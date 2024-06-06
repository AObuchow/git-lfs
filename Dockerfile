FROM registry.redhat.io/rhel8/go-toolset:1.21.9-3.1716505664 AS builder

USER 0

ENV HOME=/home/user

RUN mkdir -p $HOME

WORKDIR $HOME

RUN dnf install -y git make

RUN go install golang.org/x/tools/cmd/goimports@latest

RUN git clone -b fips https://github.com/AObuchow/git-lfs

RUN cd ./git-lfs/ && make

RUN ls -l $HOME/git-lfs/bin/git-lfs

RUN mv $HOME/git-lfs/bin/git-lfs /usr/bin/git-lfs-compiled
