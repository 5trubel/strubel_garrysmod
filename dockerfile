#Prepare Image
FROM ubuntu:groovy
COPY ./ /root/
RUN ls /root/ && \
    chmod 777 -R /root/

#Update
RUN apt update -y && apt autoremove -y

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

USER user