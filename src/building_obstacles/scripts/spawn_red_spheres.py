#!/usr/bin/env python3

import rospy
import random
import json
from gazebo_msgs.srv import SpawnModel, GetModelState
from geometry_msgs.msg import Pose
import tf.transformations as tf

def quaternion_rotate_vector(q, v):
    """用四元数 q 旋转向量 v"""
    return tf.quaternion_multiply(tf.quaternion_multiply(q, [v[0], v[1], v[2], 0]), tf.quaternion_conjugate(q))[:3]

def get_model_pose(model_name):
    """获取模型的位姿（位置和四元数）"""
    rospy.wait_for_service('/gazebo/get_model_state')
    try:
        get_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
        resp = get_state(model_name, 'world')
        if resp.success:
            return resp.pose
        else:
            rospy.logerr(f"无法获取模型 {model_name} 的状态: {resp.status_message}")
            return None
    except rospy.ServiceException as e:
        rospy.logerr(f"服务调用失败: {e}")
        return None

def spawn_red_sphere(name, world_pose):
    """生成红色球体（危险源）"""
    sphere_sdf = f"""<?xml version="1.0" ?>
<sdf version="1.6">
  <model name="{name}">
    <static>true</static>
    <link name="link">
      <collision name="collision">
        <geometry>
          <sphere>
            <radius>0.15</radius>
          </sphere>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <sphere>
            <radius>0.15</radius>
          </sphere>
        </geometry>
        <material>
          <ambient>1 0 0 1</ambient>
          <diffuse>1 0 0 1</diffuse>
        </material>
      </visual>
    </link>
  </model>
</sdf>"""
    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    try:
        spawn_model = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
        resp = spawn_model(name, sphere_sdf, "", world_pose, "world")
        if resp.success:
            # rospy.loginfo(f"成功生成红色球体（危险源） {name} 在 ({world_pose.position.x:.2f}, {world_pose.position.y:.2f}, {world_pose.position.z:.2f})")
            # rospy.loginfo(f"成功生成红色球体（危险源）")
            pass
        else:
            rospy.logwarn(f"生成红色球体 {name} 失败: {resp.status_message}")
    except rospy.ServiceException as e:
        rospy.logerr(f"服务调用失败: {e}")

def spawn_green_sphere(name, world_pose):
    """生成绿色球体（干扰源）"""
    sphere_sdf = f"""<?xml version="1.0" ?>
<sdf version="1.6">
  <model name="{name}">
    <static>true</static>
    <link name="link">
      <collision name="collision">
        <geometry>
          <sphere>
            <radius>0.15</radius>
          </sphere>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <sphere>
            <radius>0.15</radius>
          </sphere>
        </geometry>
        <material>
          <ambient>0 1 0 1</ambient>
          <diffuse>0 1 0 1</diffuse>
        </material>
      </visual>
    </link>
  </model>
</sdf>"""
    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    try:
        spawn_model = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
        resp = spawn_model(name, sphere_sdf, "", world_pose, "world")
        if resp.success:
            # rospy.loginfo(f"成功生成绿色球体（干扰源） {name} 在 ({world_pose.position.x:.2f}, {world_pose.position.y:.2f}, {world_pose.position.z:.2f})")
            # rospy.loginfo(f"成功生成绿色球体（干扰源）")
            pass
        else:
            rospy.logwarn(f"生成绿色球体 {name} 失败: {resp.status_message}")
    except rospy.ServiceException as e:
        rospy.logerr(f"服务调用失败: {e}")

def spawn_red_box(name, world_pose):
    """生成红色方块（干扰源）"""
    box_sdf = f"""<?xml version="1.0" ?>
<sdf version="1.6">
  <model name="{name}">
    <static>true</static>
    <link name="link">
      <collision name="collision">
        <geometry>
          <box>
            <size>0.3 0.3 0.3</size>
          </box>
        </geometry>
      </collision>
      <visual name="visual">
        <geometry>
          <box>
            <size>0.3 0.3 0.3</size>
          </box>
        </geometry>
        <material>
          <ambient>1 0 0 1</ambient>
          <diffuse>1 0 0 1</diffuse>
        </material>
      </visual>
    </link>
  </model>
</sdf>"""
    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    try:
        spawn_model = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
        resp = spawn_model(name, box_sdf, "", world_pose, "world")
        if resp.success:
            # rospy.loginfo(f"成功生成红色方块（干扰源） {name} 在 ({world_pose.position.x:.2f}, {world_pose.position.y:.2f}, {world_pose.position.z:.2f})")
            #  rospy.loginfo(f"成功生成红色方块（干扰源）")
            pass
        else:
            rospy.logwarn(f"生成红色方块 {name} 失败: {resp.status_message}")
    except rospy.ServiceException as e:
        rospy.logerr(f"服务调用失败: {e}")

def main():
    rospy.init_node('spawn_obstacles_inside')

    # 获取 Buliding 模型的当前位姿（注意拼写）
    model_name = 'Buliding'
    model_pose = get_model_pose(model_name)
    if model_pose is None:
        rospy.logerr("无法获取模型位姿，退出。")
        return

    # 提取位置和四元数
    pos = model_pose.position
    quat = [model_pose.orientation.x, model_pose.orientation.y,
            model_pose.orientation.z, model_pose.orientation.w]

    # rospy.loginfo(f"Buliding 位姿: 位置({pos.x:.3f}, {pos.y:.3f}, {pos.z:.3f}), 四元数({quat[0]:.3f}, {quat[1]:.3f}, {quat[2]:.3f}, {quat[3]:.3f})")

    # 定义在模型局部坐标系下的可生成区域（单位：米）
    floor_heights = [0.25, 1.75, 3.15, 4.65]  # 0.25 + 1.5*(n-1)
    x_min_local, x_max_local = -3.2, 3.2
    y_min_local, y_max_local = -3.2, 3.2

    # 随机生成障碍物总数量
    num_obstacles = random.randint(5, 15)
    # rospy.loginfo(f"将生成 {num_obstacles} 个障碍物（红色球体危险源、绿色球体干扰源、红色方块干扰源）...")

    # 用于保存真值数据的列表
    danger_sources = []      # 危险源：红色球体
    distraction_sources = [] # 干扰源：绿色球体 + 红色方块
    object_id = 0             # 全局唯一ID

    for i in range(num_obstacles):
        # 随机选择楼层（0~3）
        floor = random.randint(0, 3)
        z_local = floor_heights[floor]

        # 随机生成局部坐标
        x_local = random.uniform(x_min_local, x_max_local)
        y_local = random.uniform(y_min_local, y_max_local)

        # 将局部坐标转换为世界坐标
        local_vec = [x_local, y_local, z_local]
        world_vec = quaternion_rotate_vector(quat, local_vec)
        world_x = pos.x + world_vec[0]
        world_y = pos.y + world_vec[1]
        world_z = pos.z + world_vec[2]

        # 构造世界坐标系下的位姿
        obstacle_pose = Pose()
        obstacle_pose.position.x = world_x
        obstacle_pose.position.y = world_y
        obstacle_pose.position.z = world_z
        obstacle_pose.orientation.w = 1.0

        # 随机选择障碍物类型：0=红色球体（危险源），1=绿色球体（干扰源），2=红色方块（干扰源）
        obj_type = random.randint(0, 2)
        name_suffix = f"{i}_{random.randint(1000,9999)}"

        # 公共位置信息（相对于机器人出发点，假设为世界原点）
        position = [round(world_x, 2), round(world_y, 2), round(world_z, 2)]

        if obj_type == 0:
            name = f"red_sphere_{name_suffix}"
            spawn_red_sphere(name, obstacle_pose)
            danger_sources.append({
                "id": object_id,
                "position": position,
                "color": "red",
                "shape": "sphere",
                "radius": 0.15
            })
        elif obj_type == 1:
            name = f"green_sphere_{name_suffix}"
            spawn_green_sphere(name, obstacle_pose)
            distraction_sources.append({
                "id": object_id,
                "position": position,
                "color": "green",
                "shape": "sphere",
                "radius": 0.15
            })
        else:
            name = f"red_box_{name_suffix}"
            spawn_red_box(name, obstacle_pose)
            distraction_sources.append({
                "id": object_id,
                "position": position,
                "color": "red",
                "shape": "box",
                "size": [0.3, 0.3, 0.3]
            })

        object_id += 1
        rospy.sleep(0.1)

    rospy.loginfo("所有障碍物生成完毕。")

    # 写入真值 JSON 文件
    truth_data = {
        "danger_sources": danger_sources,
        "distraction_sources": distraction_sources
    }

    json_filename = "./results/danger_truth.json"
    with open(json_filename, 'w') as f:
        json.dump(truth_data, f, indent=2)
    rospy.loginfo(f"真值数据已保存至 {json_filename}")

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass