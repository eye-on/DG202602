from __future__ import annotations

import unittest

from building_generator_classic.control_server import _compose_world_pose
from building_generator_classic.control_runtime import BuildingControlRuntime


class BuildingControlRuntimeTest(unittest.TestCase):
    def test_updates_door_and_elevator_state(self) -> None:
        runtime = BuildingControlRuntime(
            door_specs=[{"id": "main_entrance", "initial_open": True}],
            elevator_specs=[{"id": "elevator_main", "current_floor": 0, "served_floors": [0, 1, 2]}],
        )

        door_result = runtime.set_door_state("main_entrance", False)
        elevator_result = runtime.call_elevator("elevator_main", 2, True)

        self.assertEqual(door_result["state"], "closed")
        self.assertEqual(elevator_result["current_floor"], 2)
        self.assertEqual(elevator_result["state"], "door_open")

    def test_compose_world_pose_rotates_local_offsets(self) -> None:
        pose = _compose_world_pose(
            [1.0, 2.0, 0.5, 0.0, 0.0, 3.141592653589793 / 2.0],
            [0.0, 1.0, 0.2, 0.0, 0.0, 0.0],
        )

        self.assertAlmostEqual(pose[0], 0.0, places=6)
        self.assertAlmostEqual(pose[1], 2.0, places=6)
        self.assertAlmostEqual(pose[2], 0.7, places=6)


if __name__ == "__main__":
    unittest.main()
