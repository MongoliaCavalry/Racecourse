FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN apt-get update \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake3.17 \
    && apt-get install -y python3
# drop back to the regular jenkins user - good practice
USER jenkins