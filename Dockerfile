FROM alpine:latest
RUN apk add curl
WORKDIR /opt/watcom
RUN curl -L https://github.com/open-watcom/open-watcom-v2/releases/download/Current-build/ow-snapshot.tar.gz | tar xzv

FROM alpine:latest
RUN apk add --no-cache make
COPY --from=0 /opt/watcom /opt/watcom
COPY /entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
