#Prepare Image
FROM ubuntu:focal
COPY ./ /root/
RUN ls /root/ && \
    chmod 777 -R /root/

#Update and install dependencies
RUN apt update -y && apt autoremove -y
RUN dpkg --add-architecture i386; apt update -y; apt install -y iproute2 python3 cpio sudo curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 libsdl2-2.0-0:i386 libtinfo5:i386

#Add User Account
RUN groupadd -r user && \
        useradd -rm -g user user && \
        adduser user sudo && \
        echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#Install SteamCMD
RUN mkdir /home/user/.steam/ && \
	mkdir /home/user/.steam/steamcmd && \
	cd /home/user/.steam/steamcmd/ && \
	wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz; tar -xvzf steamcmd_linux.tar.gz && \
	/home/user/.steam/steamcmd/steamcmd.sh +exit

#Install gmodWS
RUN GMODWS_LATEST=$(curl --silent "https://api.github.com/repos/Meachamp/gmodws/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")') && \
    GMODWS_ZIP=$(echo "https://github.com/Meachamp/gmodws/releases/download/$GMODWS_LATEST/gmodws.zip") && \
    curl -sqL $GMODWS_ZIP -o $1

USER user

RUN ~/.steam/steamcmd.sh +login strubellpkevin +quit