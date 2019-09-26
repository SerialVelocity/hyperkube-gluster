ARG DOCKER_TAG
ARG K8S_ARCH
FROM gcr.io/google-containers/hyperkube-${K8S_ARCH}:${DOCKER_TAG}

# Allows us to compile for different architectures
ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

RUN echo "deb http://deb.debian.org/debian sid main" > /etc/apt/sources.list.d/sid.list && \
    echo -e "Package: *\nPin: o=Debian,n=sid\nPin-Priority: -200" >> /etc/apt/preferences && \
    apt-get update && \
    apt-get install -y --no-install-recommends open-iscsi && \
    apt-get install -t sid -y --no-install-recommends glusterfs-client && \
    rm -rf /var/lib/apt/lists/*
