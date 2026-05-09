from __future__ import annotations

import argparse
import math
from pathlib import Path

from building_generator_classic.control_runtime import BuildingControlRuntime
import yaml


def main(argv: list[str] | None = None) -> int:
    import rospy
    from gazebo_msgs.srv import SetLinkState, SetModelState
    from building_generator_interfaces.srv import (
        CallElevator,
        CallElevatorResponse,
        SetDoorState,
        SetDoorStateResponse,
    )

    args = _build_parser().parse_args(rospy.myargv(argv=argv)[1:])
    runtime = _load_runtime(args.door_config, args.elevator_config)

    rospy.init_node("building_generator_classic_control")
    rospy.wait_for_service("/gazebo/set_model_state")
    rospy.wait_for_service("/gazebo/set_link_state")
    set_model_state = rospy.ServiceProxy("/gazebo/set_model_state", SetModelState)
    set_link_state = rospy.ServiceProxy("/gazebo/set_link_state", SetLinkState)
    rospy.Service(
        "call_elevator",
        CallElevator,
        lambda request: _handle_call_elevator(runtime, request, CallElevatorResponse, set_model_state),
    )
    rospy.Service(
        "set_door_state",
        SetDoorState,
        lambda request: _handle_set_door_state(runtime, request, SetDoorStateResponse, set_model_state, set_link_state),
    )
    rospy.loginfo("building_generator_classic_control ready")
    rospy.spin()
    return 0


def _build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Building generator Gazebo Classic control server")
    parser.add_argument("--door-config", required=True)
    parser.add_argument("--elevator-config", required=True)
    return parser


def _load_runtime(door_config_path: str, elevator_config_path: str) -> BuildingControlRuntime:
    door_config = yaml.safe_load(Path(door_config_path).read_text()) or {}
    elevator_config = yaml.safe_load(Path(elevator_config_path).read_text()) or {}
    return BuildingControlRuntime(
        door_specs=door_config.get("doors", []),
        elevator_specs=elevator_config.get("elevators", []),
    )


def _handle_call_elevator(runtime: BuildingControlRuntime, request, response_type, set_model_state):
    result = runtime.call_elevator(
        request.elevator_id,
        request.target_floor,
        request.open_doors,
    )
    if result.get("accepted") and result.get("target_pose"):
        _apply_model_pose(set_model_state, result["model_name"], result["target_pose"])
    return response_type(
        accepted=bool(result["accepted"]),
        current_floor=int(result["current_floor"]),
        state=str(result["state"]),
        message=str(result["message"]),
    )


def _handle_set_door_state(runtime: BuildingControlRuntime, request, response_type, set_model_state, set_link_state):
    result = runtime.set_door_state(request.door_id, request.open)
    if result.get("accepted") and result.get("panel_poses"):
        _apply_model_pose(set_model_state, result["model_name"], result["model_pose"])
        for link_name, pose_values in result["panel_poses"].items():
            if pose_values:
                _apply_link_pose(
                    set_link_state,
                    result["model_name"],
                    link_name,
                    _compose_world_pose(result["model_pose"], pose_values),
                )
    elif result.get("accepted") and result.get("target_pose"):
        _apply_model_pose(set_model_state, result["model_name"], result["target_pose"])
    return response_type(
        accepted=bool(result["accepted"]),
        state=str(result["state"]),
        message=str(result["message"]),
    )


def _apply_model_pose(set_model_state, model_name: str, pose_values: list[float]) -> None:
    from gazebo_msgs.msg import ModelState
    from geometry_msgs.msg import Pose
    from tf.transformations import quaternion_from_euler

    model_state = ModelState()
    model_state.model_name = model_name
    model_state.reference_frame = "world"
    model_state.pose = Pose()
    model_state.pose.position.x = float(pose_values[0])
    model_state.pose.position.y = float(pose_values[1])
    model_state.pose.position.z = float(pose_values[2])
    qx, qy, qz, qw = quaternion_from_euler(
        float(pose_values[3]),
        float(pose_values[4]),
        float(pose_values[5]),
    )
    model_state.pose.orientation.x = qx
    model_state.pose.orientation.y = qy
    model_state.pose.orientation.z = qz
    model_state.pose.orientation.w = qw
    set_model_state(model_state)


def _apply_link_pose(set_link_state, model_name: str, link_name: str, pose_values: list[float]) -> None:
    from gazebo_msgs.msg import LinkState
    from geometry_msgs.msg import Pose
    from tf.transformations import quaternion_from_euler

    link_state = LinkState()
    link_state.link_name = f"{model_name}::{link_name}"
    link_state.reference_frame = "world"
    link_state.pose = Pose()
    link_state.pose.position.x = float(pose_values[0])
    link_state.pose.position.y = float(pose_values[1])
    link_state.pose.position.z = float(pose_values[2])
    qx, qy, qz, qw = quaternion_from_euler(
        float(pose_values[3]),
        float(pose_values[4]),
        float(pose_values[5]),
    )
    link_state.pose.orientation.x = qx
    link_state.pose.orientation.y = qy
    link_state.pose.orientation.z = qz
    link_state.pose.orientation.w = qw
    set_link_state(link_state)


def _compose_world_pose(base_pose: list[float], local_pose: list[float]) -> list[float]:
    yaw = float(base_pose[5])
    cos_yaw = math.cos(yaw)
    sin_yaw = math.sin(yaw)
    local_x = float(local_pose[0])
    local_y = float(local_pose[1])
    return [
        float(base_pose[0]) + local_x * cos_yaw - local_y * sin_yaw,
        float(base_pose[1]) + local_x * sin_yaw + local_y * cos_yaw,
        float(base_pose[2]) + float(local_pose[2]),
        float(base_pose[3]) + float(local_pose[3]),
        float(base_pose[4]) + float(local_pose[4]),
        float(base_pose[5]) + float(local_pose[5]),
    ]

__all__ = ["main"]
