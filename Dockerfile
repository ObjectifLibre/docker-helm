FROM alpine

ADD https://storage.googleapis.com/kubernetes-helm/helm-v2.6.0-linux-amd64.tar.gz ./
RUN tar -xvzf helm-v*
RUN chmod +x /linux-amd64/helm

FROM scratch
COPY --from=0 /linux-amd64/helm .
ENTRYPOINT ["./helm"]
