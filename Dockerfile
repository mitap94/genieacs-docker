FROM ubuntu:20.04
LABEL maintainter="dimitrije.petrovic@rt-rk.com"

# Update system and install curl
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl

# Install mongodb
RUN apt-get install -y mongodb

# Download nvm
RUN curl -O https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh && \
    chmod 744 install.sh && \
    /install.sh

ENV NVM_DIR="/root/.nvm"

# Install npm using nvm
# Install genieacs
RUN chmod 744 $NVM_DIR/nvm.sh && \
    chmod 744 $NVM_DIR/bash_completion
RUN . $NVM_DIR/nvm.sh && \
    . $NVM_DIR/bash_completion && \
    nvm install --lts && \
    npm install -g genieacs

