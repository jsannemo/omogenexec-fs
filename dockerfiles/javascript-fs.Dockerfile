FROM omogen/common-fs:latest

RUN apt-get update
RUN apt-get install -y curl

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
    apt-get install -y \
    nodejs
