FROM alpine

ADD https://storage.googleapis.com/kubernetes-helm/helm-v2.6.0-linux-amd64.tar.gz ./
RUN tar -xvzf helm-v*
RUN chmod +x /linux-amd64/helm

FROM debian:jessie-slim
COPY --from=0 /linux-amd64/helm /usr/local/bin
RUN apt-get update && apt-get install -y ca-certificates \
    && rm -rf /var/lib/apt/lists/*
