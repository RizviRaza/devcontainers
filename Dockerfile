# Base image
FROM ros:humble-ros-core

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-vcstool \
    software-properties-common \
    python3-flake8-docstrings \
    python3-pip \
    python3-pytest-cov \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    ros-dev-tools \
    ros-humble-topic-tools \
    ros-humble-image-transport \
    ros-humble-urdf \
    ros-humble-urdf-parser-plugin \
    ros-humble-xacro \
    ros-humble-ffmpeg-image-transport \
    ros-humble-rqt \
    ros-humble-rqt-common-plugins \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -U rosdep && rosdep init && rosdep update

# Set environment variables
ENV ROS_DISTRO=humble
WORKDIR /ros2_ws
