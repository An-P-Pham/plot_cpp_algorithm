# Build
FROM ubuntu:24.04
# Get C++ Stuff
RUN apt-get update && \
    apt-get install -y build-essential g++-17 make

# Get Python Stuff
RUN apt-get install software-properties-common -y && \
add-apt-repository ppa:deadsnakes/ppa && \
apt update && \
apt install -y python3.12 python3.12-venv 

ENV python3=python3.12

WORKDIR /app

COPY . .

RUN chmod +x run.sh

ENTRYPOINT [ "./run.sh"]