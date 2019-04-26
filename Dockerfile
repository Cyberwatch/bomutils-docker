# Start as Debian 9
FROM debian:9

# Set the directory that we will use to build
VOLUME /build

# Update apt and install dependencies
RUN apt update && apt install -y build-essential libxml2-dev libssl1.0-dev zlib1g-dev git wget cpio

# Install xar
RUN cd && \
    wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/xar/xar-1.5.2.tar.gz && \
    tar -zxvf xar-1.5.2.tar.gz && \
    cd xar-1.5.2 && \
    ./configure && \
    make && \
    make install

# Install bomutils
RUN cd && \
    git clone https://github.com/hogliux/bomutils.git && \
    cd bomutils && \
    make && \
    make install
