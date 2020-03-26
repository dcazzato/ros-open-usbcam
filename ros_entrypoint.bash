#!/bin/bash
set -e

#script to run with a host network
export ROS_MASTER_URI=http://$(hostname --ip-address):11311
export ROS_HOSTNAME=$(hostname --ip-address)

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
#exec "$@"
echo "ROS INITIALIZED"
roslaunch usb_cam usb_cam-test.launch
