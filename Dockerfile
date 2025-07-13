FROM debian:bullseye

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Proxy
# ENV http_proxy=http://192.168.4.55:7897
# ENV https_proxy=http://192.168.4.55:7897
ENV http_proxy=http://192.168.1.5:7897
ENV https_proxy=http://192.168.1.5:7897
ENV no_proxy=localhost,127.0.0.1
# ENV HTTP_PROXY=http://192.168.4.55:7897
# ENV HTTPS_PROXY=http://192.168.4.55:7897
ENV HTTP_PROXY=http://192.168.1.5:7897
ENV HTTPS_PROXY=http://192.168.1.5:7897
ENV NO_PROXY=localhost,127.0.0.1

# Debian source
RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

# Docker
RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        gpg-agent \
        gpg \
        dirmngr \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/trusted.gpg.d/docker.gpg] \
        https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y --no-install-recommends \
        docker-ce \
    && rm -rf /var/lib/apt/lists/*

# Build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
        automake \
        bash \
        bc \
        binutils \
        build-essential \
        bzip2 \
        cpio \
        file \
        git \
        graphviz \
        help2man \
        jq \
        make \
        ncurses-dev \
        openssh-client \
        patch \
        perl \
        pigz \
        python3 \
        python3-matplotlib \
        python-is-python3 \
        qemu-utils \
        rsync \
        skopeo \
        sudo \
        texinfo \
        unzip \
        vim \
        wget \
        zip \
    && rm -rf /var/lib/apt/lists/*

# Init entry
COPY scripts/entry.sh /usr/sbin/
ENTRYPOINT ["/usr/sbin/entry.sh"]

# Get buildroot
WORKDIR /build
