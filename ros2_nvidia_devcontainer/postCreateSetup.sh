#!/bin/bash
# Source ROS2 setup
source /opt/ros/humble/setup.bash

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
echo "export FASTRTPS_DEFAULT_PROFILES_FILE=/ros2_ws/dds_config/config.xml" >> ~/.bashrc

# Navigate to the workspace
cd /ros2_ws

rosdep install --from-paths src --ignore-src -r -y

# Build the workspace
colcon build --symlink-install

# Add any additional commands here
source install/setup.bash