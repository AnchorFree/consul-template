FROM golang:1.10-alpine

COPY . /go/src/github.com/hashicorp/consul-template
WORKDIR /go/src/github.com/hashicorp/consul-template
RUN apk add --no-cache make git && \
    make dev


FROM alpine:3.8

RUN apk add --no-cache ca-certificates curl
COPY --from=0 /go/bin/consul-template /

ENTRYPOINT ["/consul-template"]
