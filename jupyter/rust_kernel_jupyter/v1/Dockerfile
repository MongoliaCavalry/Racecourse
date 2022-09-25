FROM jupyter/base-notebook:latest
USER root
RUN apt-get update \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake \
    && apt-get install -y python3 \
    && sudo apt install curl \
    && echo "Install Rust" \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >> ./install_rust.sh \
    && sh ./install_rust.sh -y \
    && echo "Show rust version ..." \
    && source $HOME/.cargo/env \
    && rustc --version \
    && echo "Install rust over!" \
    && cargo install evcxr_jupyter \
    && evcxr_jupyter --install \
    && echo "Install evcxr_jupyter ..." \
    && echo "Rust Env image create over!" 