FROM golang:1.10-alpine

COPY . /go/src/github.com/hashicorp/consul-template
WORKDIR /go/src/github.com/hashicorp/consul-template
RUN apk add --no-cache make git && \
    make dev


FROM scratch

ADD "https://curl.haxx.se/ca/cacert.pem" "/etc/ssl/certs/ca-certificates.crt"
COPY --from=0 /go/bin/consul-template /

ENTRYPOINT ["/consul-template"]
