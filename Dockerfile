FROM land007/cpp-grpc:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

RUN apt-get install -y build-essential
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
# RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev

RUN cd /tmp && wget https://github.com/opencv/opencv/archive/3.4.2.zip && unzip 3.4.2.zip && rm -f /tmp/3.4.2.zip
# ADD opencv-3.4.2.zip /tmp
RUN cd /tmp/opencv-3.4.2 && mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..
RUN cd /tmp/opencv-3.4.2/build && make && make install && rm -rf /tmp/opencv-3.4.2
# RUN cd /tmp/opencv-3.4.2/build/doc && make doxygen


#docker stop cpp-opencv ; docker rm cpp-opencv ; docker run -it --privileged --name cpp-opencv land007/cpp-opencv:latest
