FROM rust:slim as builder
RUN apt-get update && \
    apt-get install -y pkg-config libssl-dev && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY . .
RUN mkdir bin
RUN cd powersoftau && \
    cargo build --release --bins && \
    find ./target/release/ -maxdepth 1 -type f -perm /a+x -exec mv {} /build/bin/ \;

FROM debian:buster-slim
COPY --from=builder /build/bin/* /usr/bin/
WORKDIR /data