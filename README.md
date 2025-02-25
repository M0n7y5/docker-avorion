[![Docker Automated build](https://img.shields.io/docker/cloud/automated/m0n7y5/avorion-beta?style=flat-square)](https://hub.docker.com/r/m0n7y5/avorion-beta)
[![Docker Pulls](https://img.shields.io/docker/pulls/m0n7y5/avorion-beta.svg?style=flat-square)](https://hub.docker.com/r/m0n7y5/avorion-beta)

Avorion[Beta Branch] for Docker
==================


### Game Info

For some information about the game see https://www.avorion.net/

This is a docker image to create a dedicated server.


## Getting started
Starting the server 

* Create a `/data` directory, this will be mounted into the container.
* Change the owner of the `/data` directory to UID 1000
* Start the server to generate the configfiles.
* Stop the server.
* Edit the configfiles as you like.
* If necessary delete the galaxy (```alliances```,```factions```,```moddata```,```players```and```sectors``` folders)
* Start the server

> **Note: if you change ports in the config, you'll need to adjust the port mappings.**

Run the following to start the server.
```
docker run --name avorion -d -v `pwd`/data:/home/steam/.avorion/galaxies/avorion_galaxy -p 27000:27000 -p 27000:27000/udp -p 27003:27003/udp -p 27020:27020/udp -p 27021:27021/udp m0n7y5/avorion-beta
```
or use docker-compose:
```
version: '3.3'
services:
    avorion-docker:
        image: m0n7y5/avorion-beta
        container_name: avorion
        volumes:
            - './data:/home/steam/.avorion/galaxies/avorion_galaxy'
        ports:
            - '27000:27000'
            - '27000:27000/udp'
            - '27003:27003/udp'
            - '27020:27020/udp'
            - '27022:27021/udp'
        restart: unless-stopped
```

The server data will be saved locally on the host machine within the data folder. This allows you to bring the server down, and pull the new image when needed to do any updates.



## Contributing

See [CONTRIBUTING.md](https://github.com/Lukas1818/docker-avorion/blob/master/CONTRIBUTING.md)


