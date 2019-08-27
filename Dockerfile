FROM k8s.gcr.io/hyperkube:v1.15.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl apt-transport-https gnupg2 && \
    curl -LsS --fail https://download.gluster.org/pub/gluster/glusterfs/6/rsa.pub | apt-key add - && \
    echo deb [arch=amd64] https://download.gluster.org/pub/gluster/glusterfs/6/LATEST/Debian/stretch/amd64/apt stretch main > /etc/apt/sources.list.d/gluster.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends glusterfs-client && \
    apt-get purge -y curl apt-transport-https gnupg2 && \
    rm -rf /var/lib/apt/lists/*