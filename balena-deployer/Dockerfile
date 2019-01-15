FROM alpine:3.8 as builder
RUN apk add --no-cache \
    ca-certificates \
    wget \
    unzip
ADD https://github.com/balena-io/balena-cli/releases/download/v9.10.0/balena-cli-v9.10.0-linux-x64.zip /
RUN unzip balena-cli-v9.10.0-linux-x64.zip && \
    mv /balena-cli/balena /usr/bin/balena

FROM alpine:3.8
LABEL "com.github.actions.name"="Balena Cloud deployer"
LABEL "com.github.actions.description"="Deploy IoT app on Balena Cloud"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="red"

COPY --from=builder /usr/bin/balena /usr/bin/balena
ADD balena-deploy.sh /usr/bin/balena-deploy.sh
CMD ["balena-deploy"]
