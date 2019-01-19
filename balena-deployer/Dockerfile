FROM debian:buster-slim as builder
ENV BALENA_CLI_VERSION 9.11.0
RUN apt-get update && apt-get install unzip
ADD https://github.com/balena-io/balena-cli/releases/download/v$BALENA_CLI_VERSION/balena-cli-v$BALENA_CLI_VERSION-linux-x64.zip /
RUN unzip balena-cli-v$BALENA_CLI_VERSION-linux-x64.zip

FROM debian:buster-slim as test
COPY --from=builder /balena-cli/balena /usr/bin/balena
RUN balena

FROM debian:buster-slim as dist
LABEL "com.github.actions.name"="Balena Cloud deployer"
LABEL "com.github.actions.description"="Deploy IoT app on Balena Cloud"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="red"

COPY --from=builder /balena-cli/balena /usr/bin/balena
ADD balena-deploy.sh /usr/bin/balena-deploy.sh
RUN chmod +x /usr/bin/balena-deploy.sh
ENTRYPOINT ["/usr/bin/balena-deploy.sh"]
