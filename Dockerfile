# Build:
#  docker build -t darioc1985/ros-send-images .
# Usage:
# docker pull darioc1985/ros-send-images

# Get ros full image from dockerhub
FROM ros
LABEL mantainer "Dario Cazzato <dcazzato85@gmail.com>"

ENV ROS_DISTRO melodic

RUN apt-get update && apt-get install -y \
    #ros-melodic-usb-cam \
    apt-utils \
    ros-${ROS_DISTRO}-usb-cam \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    ros-${ROS_DISTRO}-vision-opencv \
    ros-${ROS_DISTRO}-compressed-image-transport &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#WORKDIR /src/

RUN sudo usermod -a -G users "$(whoami)"
RUN sudo usermod -a -G video "$(whoami)"
# copy project folder
COPY ./ /src
COPY ./ros_entrypoint.bash /

ENTRYPOINT ["/ros_entrypoint.bash"]
CMD ["bash"]
