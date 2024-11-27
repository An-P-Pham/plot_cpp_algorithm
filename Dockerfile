# Build

FROM ubuntu:24.04 AS build

# Get C++ Stuff
RUN apt-get update && \
    apt-get install -y build-essential g++-17 make

# Get Python Stuff
RUN su \
# update/upgrade
apt update && sudo apt upgrade -y \
# add deadsnakes repository -> note big warning with confirmation!
add-apt-repository ppa:deadsnakes/ppa \
# install python 3.12 related things
apt install python3.12 python3.12-distutils python3.12-venv \

ENV python3=python3.12

WORKDIR /opt/app

COPY . .

# Run
FROM ubuntu:24.04

RUN apt-get update -qq && apt-get install -y make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/app

COPY --from=build /opt/app/* ./
RUN chmod + x /run.sh

ENTRYPOINT [ "/run.sh"]