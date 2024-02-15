FROM ubuntu:22.04 as base

LABEL maintainer="kaptur.michal@gmail.com"

RUN apt-get update && \
    apt-get install -y \
    python2.7 \
    libc6-i386 \
    && rm -rf /var/lib/apt/lists/*

FROM base as builder

RUN apt-get update && \
    apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/12.6.0/CCS12.6.0.00008_linux-x64.tar.gz | tar xz && \
    CCS12.6.0.00008_linux-x64/ccs_setup_12.6.0.00008.run --mode unattended --enable-components PF_MSP430 --prefix /opt/ti && \
    ls /opt/ti # sanity check, failed installation exists with zero

FROM base as final
COPY --from=builder /opt/ti /opt/ti
ENTRYPOINT [ "/opt/ti/ccs/eclipse/eclipse", "-noSplash" ]
