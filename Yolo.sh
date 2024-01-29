#!/bin/bash

# YOLOv5 Installation in ROS Noetic

echo "Starting YOLOv5 installation in ROS Noetic environment..."


cd ~/catkin_ws/src


git clone https://github.com/AlexeyAB/darknet.git/<YOLOv5_ROS_GitHub_repo> yolov5_ros
cd yolov5_ros


wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v4_pre/yolov4.weights


# Install Python dependencies
pip install -r requirements.txt

# Navigate back to the ROS workspace root
cd ~/catkin_ws

# Build the workspace
catkin_make

# Source the workspace
source devel/setup.bash

echo "YOLOv5 installation for ROS Noetic completed."
