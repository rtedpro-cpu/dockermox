FROM debian:12
RUN apt update && apt install wget curl sudo zip unzip -y
