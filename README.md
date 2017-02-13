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

# Running accelerated GUI applications with nvidia-docker
GUI applications write their graphics commands into /tmp/.X11-unix, therefore linking it to a docker container as a volume enables an executable in that container to drawing on the screen.

Unfortunately this is not enough for it to access hardware acceleration.

Nvidia-docker comes to the rescue here as it queries the host capabilities and it automatically links the nvidia drivers and the nvidia GPUs to the container as external volumes and devices.

Unfortunately this is still not enough for an executable in the container to draw HW accelerated content into the same display where non HW accelerated content is drawn.

VirtualGL comes to the rescue! running the executable via `vglrun` enables the HW accelerated content to be shown in the same display!

Give this a try
```bash
xhost +local:root
nvidia-docker run -d \
     --env="DISPLAY" \
     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
     plumbee/nvidia-virtualgl vglrun glxgears
xhost -local:root # resetting permissions
```
And now go and have fun creating your own dockerised versions of Blender, Firefox, Chrome...

# Related posts:
- https://medium.com/@pigiuz/setting-up-a-hw-accelerated-desktop-on-aws-g2-instances-4b58718a4541#.g80twxf4f
- https://medium.com/@pigiuz/hw-accelerated-gui-apps-on-docker-7fd424fe813e#.e0bhg911w
