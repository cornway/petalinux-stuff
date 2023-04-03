FROM ubuntu:18.04

# install dependences:
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  apt-utils \
  autoconf \
  bc \
  bison \
  build-essential \
  ca-certificates \
  chrpath \
  cpio \
  curl \
  dbus \
  dbus-x11 \
  debianutils \
  diffstat \
  expect \
  flex \
  fonts-droid-fallback \
  fonts-ubuntu-font-family-console \
  gawk \
  gcc-multilib \
  git \
  gnupg \
  gtk2-engines \
  gzip \
  iproute2 \
  iputils-ping \
  kmod \
  lib32z1-dev \
  libegl1-mesa \
  libglib2.0-dev \
  libgtk2.0-0 \
  libjpeg62-dev \
  libncurses5-dev \
  libsdl1.2-dev \
  libselinux1 \
  libssl-dev \
  libtool \
  libtool-bin \
  locales \
  lsb-release \
  lxappearance \
  nano \
  net-tools \
  pax \
  pylint3 \
  python3 \
  python3-pexpect \
  python3-pip \
  python3-git \
  python3-jinja2 \
  repo \
  rsync \
  screen \
  socat \
  sudo \
  texinfo \
  tftpd \
  tofrodos \
  ttf-ubuntu-font-family \
  u-boot-tools \
  ubuntu-gnome-default-settings \
  unzip \
  update-inetd \
  wget \
  xorg \
  xterm \
  xvfb \
  xxd \
  zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 RUN dpkg --add-architecture i386 && apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  zlib1g:i386 libc6-dev:i386 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 # make a petalinux user
RUN adduser --disabled-password --uid 1001 --gecos '' petalinux && \
  usermod -aG sudo petalinux && \
  echo "petalinux ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

USER petalinux

ENV SHELL /bin/bash