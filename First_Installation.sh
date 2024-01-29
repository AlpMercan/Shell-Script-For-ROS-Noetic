#!/usr/bin/expect

set timeout -1
spawn bash -c {
    set script {
        echo "We are getting started"

        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'


        sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654


        sudo apt update
        sudo apt install ros-noetic-desktop-full
        echo "The Noetic has been dowloanded"


        sudo rosdep init
        rosdep update


        echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc

        echo "export TURTLEBOT3_MODEL=waffle_pi" >> ~/.bashrc
        echo "alias killgazebo=\"killall -9 gazebo & killall -9 gzserver & killall -9 gzclient\"" >> ~/.bashrc

        echo "ROS Noetic and environment settings have been installed successfully!"
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
