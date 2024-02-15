FROM ubuntu:22.04

LABEL maintainer="kaptur.michal@gmail.com"

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
    python2.7 \
    curl \
    libc6-i386

RUN curl https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.6.0/CCS12.6.0.00008_linux-x64.tar.gz | tar xz && \
    CCS12.6.0.00008_linux-x64/ccs_setup_12.6.0.00008.run --mode unattended --enable-components PF_MSP430 --prefix /opt/ti && \
    ls /opt/ti
