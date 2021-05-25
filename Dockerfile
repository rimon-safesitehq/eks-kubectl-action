FROM python:3.10.0a7-alpine3.13

LABEL maintainer="Ian Belcher <github.com@ianbelcher.me>"

ENV PYTHONIOENCODING=UTF-8

ADD entrypoint.sh /entrypoint.sh

RUN apk add --no-cache curl jq bash &&\
    pip install awscli && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl &&\
    chmod +x ./kubectl &&\
    mv ./kubectl /usr/local/bin/kubectl &&\
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp &&\
    mv /tmp/eksctl /usr/local/bin &&\
    chmod +x /entrypoint.sh

RUN apk add yq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community


ENTRYPOINT ["/entrypoint.sh"]