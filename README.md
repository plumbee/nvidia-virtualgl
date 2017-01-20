# nvidia-virtualgl
VirtualGL on Ubuntu 16.04

*This image is not intended to be run directly!*

This is intended to be a bridge between the host X server and the container.
Tested on nvidia-docker 1.0.0 https://github.com/NVIDIA/nvidia-docker/releases

# Launch commands
```bash
xhost +local:root
nvidia-docker run -d \
     --env="DISPLAY" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     plumbee/nvidia-virtualgl vglrun glxgears
xhost -local:root # resetting permissions
```

# Resources
- nvidia-docker project https://github.com/NVIDIA/nvidia-docker
- VirtualGl project http://www.virtualgl.org/
