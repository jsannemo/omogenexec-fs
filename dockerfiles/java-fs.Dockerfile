FROM omogen/common-fs:latest

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
                    apt-get install -y --no-install-recommends \
                    openjdk-21-jdk-headless
