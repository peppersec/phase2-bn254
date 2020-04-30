FROM rust:slim as builder
RUN apt-get update && \
    apt-get install -y pkg-config libssl-dev curl && \
    rm -rf /var/lib/apt/lists/*
RUN curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
WORKDIR /build
COPY . .

WORKDIR /build/phase2
RUN mkdir bin
RUN cargo build --release --bins
RUN find ./target/release/ -maxdepth 1 -type f -perm /a+x -exec mv {} /build/phase2/bin/ \;
RUN wasm-pack build --release --target web -- --no-default-features --features wasm

FROM debian:buster-slim
COPY --from=builder /build/phase2/bin/* /usr/bin/
COPY --from=builder /build/phase2/pkg/* /wasm/
WORKDIR /data