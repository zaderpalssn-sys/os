FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    live-build debootstrap xorriso squashfs-tools \
    grub-pc-bin grub-efi-amd64-bin mtools dosfstools \
    ca-certificates rsync && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
COPY . /workspace/

CMD ["bash", "-lc", "chmod +x build-zanx.sh && ./build-zanx.sh"]
