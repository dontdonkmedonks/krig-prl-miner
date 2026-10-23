FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y curl tar ca-certificates libssl3 && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /root
# Скачиваем KRig 1.5.10 для Linux
RUN curl -L -o krig.tar.gz https://github.com/kryptex/krig-miner/releases/download/v1.5.10/krig-miner-1.5.10-linux-x64.tar.gz && \
    tar -xzf krig.tar.gz && \
    rm krig.tar.gz && \
    chmod +x krig-miner
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
