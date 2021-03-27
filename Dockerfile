FROM ubuntu:latest

LABEL version="latest"
LABEL description="A server configured for Minecraft programming. (mcproject)"

RUN apt update
RUN apt install openjdk-8-jdk -y
RUN apt install curl -y

RUN mkdir /var/Minecraft
WORKDIR /var/Minecraft

COPY eula.txt /var/Minecraft
COPY server.properties /var/Minecraft
COPY start.sh /var/Minecraft

RUN curl -LO https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

EXPOSE 25565 25575

ENTRYPOINT "/var/Minecraft/start.sh"