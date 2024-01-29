#!/usr/bin/expect

set timeout -1
spawn bash -c {
    set script {
        echo "We are getting started"

        # Adding ROS Noetic repository
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

        # Adding ROS Noetic keys
        sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

        # Updating and installing ROS Noetic
        sudo apt update
        sudo apt install ros-noetic-desktop-full
        echo "The Noetic has been downloaded"

        # Initialize and update rosdep
        sudo rosdep init
        rosdep update

        # Adding ROS setup to .bashrc
        echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

        # Adding TURTLEBOT3_MODEL and killgazebo alias to .bashrc
        echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc
        echo "alias killgazebo=\"killall -9 gazebo & killall -9 gzserver & killall -9 gzclient\"" >> ~/.bashrc

        # Creating a ROS catkin workspace
        echo "Creating a ROS catkin workspace..."
        mkdir -p ~/catkin_ws/src
        cd ~/catkin_ws/
        catkin_make
        echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

        echo "ROS Noetic and environment settings, and catkin workspace have been installed successfully!"
    }
    eval $script
}

expect {
    -re "password for .*:" {
        send "YOUR_PASSWORD\r"
        exp_continue
    }
    eof
}

