FROM ubuntu:22.04

ARG AARCH64_TOOLCHAIN=https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-elf.tar.xz;

RUN set -ex;                                      \
    apt-get update;                               \
    apt-get install -q -y --no-install-recommends \
    build-essential                               \
    ca-certificates                               \
    ranger                                        \
    rsync                                         \
    wget                                          \
    ;                                             \
    # GCC AArch64 tools
    wget ${AARCH64_TOOLCHAIN};                    \
    tar -xf arm-gnu-toolchain*;                   \
    rsync -r arm-gnu-toolchain*/ /usr/;           \
    rm -rf arm-gnu-toolchain*;
