FROM debian:buster-slim

LABEL git=https://github.com/M0n7y5/docker-avorion

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update \
 && apt-get install -y curl lib32gcc1

# Add steam user
RUN useradd -m -u 1000 steam
USER steam

# Download and extract SteamCMD
RUN mkdir -p /home/steam/steamcmd \
 && curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz -C /home/steam/steamcmd

# install server
RUN mkdir -p /home/steam/avorion-server \
 && /home/steam/steamcmd/steamcmd.sh \
                +login anonymous \
				+force_install_dir /home/steam/avorion-server \
				+app_update 565060 -beta beta validate \
				+quit

# Ports required
EXPOSE 27000
EXPOSE 27000/udp
EXPOSE 27003/udp
EXPOSE 27020/udp
EXPOSE 27021/udp

CMD ["/home/steam/avorion-server/server.sh"]
