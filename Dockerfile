FROM debian:bullseye

RUN apt-get update \
    && apt-get upgrade -y

# Minimal requirements to build a Linux kernel
# https://docs.kernel.org/process/changes.html#current-minimal-requirements
RUN apt-get install -y \
    gcc g++ make binutils flex bison dwarves util-linux kmod e2fsprogs jfsutils \
    u-boot-tools reiserfsprogs xfsprogs squashfs-tools btrfs-progs pcmciautils \
    quota rsync xz-utils ppp libnfs-utils procps udev grub-common iptables tar \
    openssl libelf-dev lzop libssl-dev bsdmainutils ccache bc sphinx-common \
    sphinx-doc cpio lz4 pkg-config zstd

# mcelog

# Setup of the tool
RUN apt-get install -y git curl wget time
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
