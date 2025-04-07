# Base image
FROM ros:humble-ros-core

# Environment setup
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=humble

# Install ROS 2 development tools + image processing dependencies
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    python3-vcstool \
    software-properties-common \
    python3-pip \
    python3-opencv \
    python3-flake8-docstrings \
    python3-pytest-cov \
    git \
    curl \
    wget \
    nano \
    net-tools \
    ros-dev-tools \
    ros-humble-topic-tools \
    ros-humble-image-transport \
    ros-humble-cv-bridge \
    ros-humble-vision-msgs \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-urdf \
    ros-humble-urdf-parser-plugin \
    ros-humble-xacro \
    ros-humble-ffmpeg-image-transport \
    ros-humble-rqt \
    ros-humble-rqt-common-plugins \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    mesa-utils \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Remove conflicting system-installed SymPy
RUN rm -rf /usr/lib/python3/dist-packages/sympy*

# Install PyTorch + TorchVision (CPU)
RUN pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu

# Downgrade NumPy to ensure binary compatibility
RUN pip install numpy==1.24.4 --force-reinstall

# Install packages with known good compatibility
RUN pip install --force-reinstall matplotlib scipy

# Install Ultralytics and supporting packages
RUN pip install \
    ultralytics \
    opencv-python \
    pandas \
    tqdm \
    typing-extensions \
    jinja2 \
    fsspec \
    filelock \
    py-cpuinfo \
    seaborn>=0.11.0 \
    ultralytics-thop>=2.0.0 \
    networkx \
    sympy==1.12 \
    mpmath==1.2.1 \
    rospkg \
    empy \
    catkin_pkg

# Initialize rosdep
RUN pip install -U rosdep && rosdep init && rosdep update

# Setup workspace
WORKDIR /ros2_ws
