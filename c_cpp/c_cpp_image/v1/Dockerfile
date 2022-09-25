FROM ubuntu:latest
# if we want to install via apt
USER root
RUN apt-get update \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake \
    && apt-get install -y python3