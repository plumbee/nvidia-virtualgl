FROM ubuntu:16.04

# install VirtualGl 2.5.1
RUN apt-get update && apt-get install -y \
    libglu1-mesa-dev mesa-utils wget xterm && \
    wget http://downloads.sourceforge.net/project/virtualgl/2.5.1/virtualgl_2.5.1_amd64.deb && \
    dpkg -i virtualgl_2.5.1_amd64.deb && \
    /opt/VirtualGL/bin/vglserver_config -config +s +f -t && \
    rm virtualgl_2.5.1_amd64.deb && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/*

# nvidia-docker links
LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:/opt/VirtualGL/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}
