## 环境介绍
使用Gazebo仿真环境，此仿真环境中使用了 Unitree A1 机器人模型以及强化学习控制器，其中控制器需要 CUDA 支持。

(此仿真环境用于揭榜挂帅-西南技术物理研究所)

## 下载与依赖
### 依赖项安装
**libtorch**：下载 C++ 版本的 [libtorch](https://pytorch.org/)。
## 安装步骤
### 配置 libtorch 和 CUDA 路径
修改 `src/unitree_guide/unitree_guide/unitree_guide/CMakeLists.txt` 中的 `libtorch` 路径和 `CMAKE_CUDA_COMPILER` 路径。
#### Environment
- Ubuntu >= 20.04
- ROS >= Noetic with ros-desktop-full installation
- CUDA >= 11.7
#### Python（建议使用虚拟环境）
- Python >= 3.8
- [CuPy](https://docs.cupy.dev/en/stable/install.html) with CUDA >= 11.7
- Open3d
## 使用说明
### 1. 环境编译：
```bash
catkin_make -j
```
### 2. 启动 RL 控制器
启动虚拟手柄：
```bash
sudo -s
source ./devel/setup.bash
sudo modprobe uinput
rosrun unitree_guide virtual_joy.py
```
### 3. 启动 Gazebo 仿真环境并运行控制器：
```bash
sudo -s
. auto.sh  # 等待 Unitree A1 机器人展开
./devel/lib/unitree_guide/junior_ctrl
```
在控制器中：
- 按键 **2**：站立
- 按键 **6**：切换为 RL 模式（此时接收 `cmd_vel` 消息）
- 再次按键 **2**：会闪退，需重新启动控制器

### 4. 生成随机数量和位置的危险源和干扰源
```bash
rosrun building_obstacles spawn_red_spheres.py
```
- **危险源**：红色球体
- **干扰源**：红色方块和绿色球体

参数队伍需对场景内的危险源（红色球体）进行识别，记录其三维坐标，并按照规定格式保存为JSON格式，文件名定义为danger_detect.json，文件保存在/results/目录下。

参数队伍JSON文件保存格式示例：
```bash
{
  "exploration_time": 98.76,
  "detected_danger_sources": [
    {"position": [2.34, -1.56, 0.25]},
    {"position": [-3.21, 4.78, 1.75]}
  ]
}
```

### 5. 测试评估
在完成探索与危险源识别全部流程后，参数队伍可通过主办方提供的测试脚本验证算法性能；
```bash
python3 ./src/building_obstacles/scripts/evaulate_danger.py
```
主要指标：
- 探索时间(exploration_time)：
- 危险源识别概率
- 危险源虚警率

## 传感器位姿配置

本仿真环境中的 Unitree A1 机器人配备了以下传感器，其安装位姿定义如下（所有坐标系遵循ROS标准：X-前，Y-左，Z-上）：

### 1. 机载IMU (`imu_link`)

| 属性 | 数值 |
|------|------|
| **父坐标系** | `trunk` (机器人躯干) |
| **安装位置** | 躯干中心 |
| **位姿 (xyz, rpy)** | `(0.0, 0.0, 0.0)`, `(0.0, 0.0, 0.0)` |
| **质量** | 0.001 kg |

&gt; 注：IMU安装于机器人质心位置，与躯干坐标系重合。

---

### 2. Livox Mid-360 激光雷达 (`laser_livox`)

| 属性 | 数值 |
|------|------|
| **父坐标系** | `base` |
| **安装位置** | 躯干前上方 |
| **位姿 (xyz, rpy)** | `(0.2, 0.0, 0.08)`, `(0.0, 0.785, 0.0)` |
| **备注** | 绕Y轴倾斜45°（0.785 rad），优化前方及地面点云覆盖 |

**Livox内置IMU** (`livox_imu_link`):
- **父坐标系**: `laser_livox`
- **相对位姿**: `(-0.011, -0.02329, 0.04412)`, `(0.0, 0.0, 0.0)`
- 该IMU固连于激光雷达本体，提供高频姿态数据

---

### 3. RealSense D415 深度相机 (`real_sense`)

| 属性 | 数值 |
|------|------|
| **父坐标系** | `base` |
| **安装位置** | 躯干最前端 |
| **位姿 (xyz, rpy)** | `(0.28, 0.0, 0.043)`, `(0.0, 0.0, 0.0)` |
| **视觉朝向** | 绕Z轴旋转90°（1.5708 rad），确保图像坐标系对齐 |
| **质量** | 0.103 kg |

---

## ROS话题列表

以下为Gazebo仿真环境中所有可用的ROS话题，按功能分类：

### 1. 状态估计与真值

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/trunk_imu` | `sensor_msgs/Imu` | 1000 Hz | 躯干IMU数据（加速度、角速度、姿态） |
| `/livox/imu` | `sensor_msgs/Imu` | 1000 Hz | Livox雷达内置IMU数据 |
| `/ground_truth/base_trunk` | `nav_msgs/Odometry` | 100 Hz | base相对于trunk的真值位姿（用于调试） |
| `/ground_truth/base_w` | `nav_msgs/Odometry` | 100 Hz | base相对于world的真值位姿 |

### 2. 足端状态真值

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/ground_truth/FL_foot` | `nav_msgs/Odometry` | 100 Hz | 左前足(FL)相对于base的位姿与速度 |
| `/ground_truth/FR_foot` | `nav_msgs/Odometry` | 100 Hz | 右前足(FR)相对于base的位姿与速度 |
| `/ground_truth/RL_foot` | `nav_msgs/Odometry` | 100 Hz | 左后足(RL)相对于base的位姿与速度 |
| `/ground_truth/RR_foot` | `nav_msgs/Odometry` | 100 Hz | 右后足(RR)相对于base的位姿与速度 |

### 3. 足端接触力

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/FR_foot_contact` | `gazebo_msgs/ContactsState` | 100 Hz | 右前足接触力（含可视化） |
| `/FL_foot_contact` | `gazebo_msgs/ContactsState` | 100 Hz | 左前足接触力（含可视化） |
| `/RR_foot_contact` | `gazebo_msgs/ContactsState` | 100 Hz | 右后足接触力（含可视化） |
| `/RL_foot_contact` | `gazebo_msgs/ContactsState` | 100 Hz | 左后足接触力（含可视化） |

### 4. 激光雷达

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/scan` | `sensor_msgs/PointCloud2` | 10 Hz | Livox Mid-360点云数据 |
| `/livox/imu` | `sensor_msgs/Imu` | 1000 Hz | 雷达内置IMU（同状态估计） |

**雷达参数**：
- 水平FOV: 360° (`0 ~ 2π`)
- 垂直FOV: -5.22° ~ 57.22°
- 测距范围: 0.1 ~ 40 m
- 分辨率: 0.01 m
- 噪声: 高斯噪声 σ=0.005

### 5. 视觉传感器

#### 5.1 前视单目相机 (`front_camera`)

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/camera/image_raw` | `sensor_msgs/Image` | 30 Hz | RGB图像 |
| `/camera/camera_info` | `sensor_msgs/CameraInfo` | 30 Hz | 相机标定参数 |

**相机参数**：
- 分辨率: 800x800
- 水平FOV: 1.396 rad (80°)
- 近/远裁剪面: 0.02 / 300 m
- 噪声: 高斯噪声 σ=0.007

#### 5.2 RealSense D415深度相机 (`real_sense`)

| 话题名称 | 消息类型 | 发布频率 | 说明 |
|---------|---------|---------|------|
| `/real_sense/rgb/image_raw` | `sensor_msgs/Image` | 10 Hz | RGB图像 |
| `/real_sense/rgb/camera_info` | `sensor_msgs/CameraInfo` | 10 Hz | RGB相机标定 |
| `/real_sense/depth/image_raw` | `sensor_msgs/Image` | 10 Hz | 深度图像 |
| `/real_sense/depth/camera_info` | `sensor_msgs/CameraInfo` | 10 Hz | 深度相机标定 |
| `/real_sense/depth/points` | `sensor_msgs/PointCloud2` | 10 Hz | 点云数据 |

**相机参数**：
- 分辨率: 640x480
- 水平FOV: 60°
- 近/远裁剪面: 0.05 / 8.0 m
- 点云最小距离: 0.4 m

### 6. 外部控制

| 话题名称 | 消息类型 | 功能 |
|---------|---------|------|
| `/apply_force/trunk` | `geometry_msgs/Wrench` | 向躯干施加外力/力矩（用于扰动测试） |

---

### 坐标系定义

| 坐标系ID | 父坐标系 | 说明 |
|---------|---------|------|
| `world` | - | Gazebo世界坐标系 |
| `base` | `world` | 机器人基坐标系（几何中心） |
| `trunk` | `base` | 浮动基座（质心） |
| `imu_link` | `trunk` | 机载IMU |
| `laser_livox` | `base` | Livox雷达 |
| `livox_imu_link` | `laser_livox` | 雷达内置IMU |
| `real_sense` | `base` | RealSense深度相机 |
| `front_camera` | - | 前视单目相机（需在URDF中定义joint） |
| `FR_foot` / `FL_foot` / `RR_foot` / `RL_foot` | 各小腿 | 足端接触点 |

### 使用示例

```bash
# 查看IMU数据
rostopic echo /trunk_imu

# 可视化点云
rosrun rviz rviz
# 添加 PointCloud2 显示，订阅 /scan

# 查看深度图像
rosrun image_view image_view image:=/real_sense/depth/image_raw