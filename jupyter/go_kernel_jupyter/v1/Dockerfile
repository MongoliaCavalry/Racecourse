FROM jupyter/base-notebook:latest
# if we want to install via apt
USER root
RUN apt-get update \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake \
    && apt-get install -y python3 \
    && pip install --user --ignore-installed jupyter \
    && wget https://dl.google.com/go/go1.19.1.linux-amd64.tar.gz \
    && sudo tar -C /usr/local -xzf ./go1.19.1.linux-amd64.tar.gz \
    && sudo ln -s /usr/local/go/bin/* /usr/bin/ \
    && echo "export GOPATH=\"$HOME/go\"" >> ~/.bashrc \
    && echo "export PATH=\"$PATH:/usr/local/go/bin:$GOPATH/bin\"" >> ~/.bashrc \
    && echo "export GOPROXY=https://goproxy.cn,direct" >> ~/.bashrc \
    && source ~/.bashrc \
    && echo "Show golang version:" \
    && go version \
    && go install github.com/gopherdata/gophernotes@v0.7.5 \
    && mkdir -p ~/.local/share/jupyter/kernels/gophernotes \
    && cd ~/.local/share/jupyter/kernels/gophernotes \
    && cp "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.5/kernel/*  "." \
    && chmod +w ./kernel.json # in case copied kernel.json has no write permission \
    && sed "s|gophernotes|$(go env GOPATH)/bin/gophernotes|" < kernel.json.in > kernel.json \
    && echo "Go kernel Env image create over!" 