sudo nvidia-docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority -v /home/$USER:/home/$USER --net=host --pid=host --ipc=host tano297/bonnetal:runtime /bin/bash
