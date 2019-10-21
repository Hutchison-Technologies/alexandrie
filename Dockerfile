FROM rust:1-buster AS builder
WORKDIR /app
RUN USER=root cargo new --bin builder
WORKDIR /app/builder
COPY rust-toolchain .
RUN rustup self update && rustup set profile minimal && rustup toolchain install `cat rust-toolchain` && rustup default nightly
RUN apt-get update && apt-get install -y libsqlite3-dev clang

COPY Cargo.toml .
COPY Cargo.lock .
RUN cargo build --release

RUN rm src/main.rs
COPY src src
COPY ./migrations/ ./migrations
RUN rm target/release/deps/alexandrie*
RUN cargo build --release

FROM debian:buster-slim
RUN apt-get update && apt-get install -y libsqlite3-0
VOLUME /mnt/alexandrie/
COPY --from=builder /app/builder/target/release/alexandrie .
COPY . .


EXPOSE 3000
ENTRYPOINT ["./alexandrie"]
