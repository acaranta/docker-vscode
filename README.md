# Visual Studio Code, a Docker container with noVNC http access
This container allows you to have a working Visual Studio Code, reachable via a http noVNC that can be placed behind a reverse proxy.

More information about the noVNC baseimage here : https://github.com/jlesage/docker-baseimage-gui.

More info about Visual Studio Code : https://code.visualstudio.com/ 

Basically, here is a docker-compose exmaple of how to use it :
```
version: '2'
services:
  trgui:
    image: acaranta/docker-vscode
    environment:
      - VNC_PASSWORD=<yourVNCpassword>
    volumes:
      - <yourdockervolume>:/app/.config:rw
    ports:
      - 5800:5800
```

NB : the volume for config/data files must be read/write for UID/GID 1000/1000
