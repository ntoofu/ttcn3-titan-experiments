FROM ubuntu:18.04

RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
          sudo libssl1.1 libxml2 build-essential expect iptables libpcap-dev \
          unzip libxml2-dev libssl-dev bison flex libncurses-dev default-jdk && \
        apt-get clean && \
        echo "titan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
        useradd -m titan
USER titan
WORKDIR /home/titan
ENV TTCN3_DIR=/home/titan/titan.core/Install
ENV PATH=$TTCN3_DIR/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ADD --chown=titan:titan https://github.com/eclipse/titan.core/archive/7.1.1.zip /tmp/
RUN \
        unzip /tmp/7.1.1.zip && rm /tmp/7.1.1.zip && \
        mv titan.core-7.1.1 titan.core && \
        cd titan.core && \
        make && make install
