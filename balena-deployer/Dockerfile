FROM node:8
RUN npm install balena-cli -g --production --unsafe-perm

LABEL "com.github.actions.name"="Balena Cloud deployer"
LABEL "com.github.actions.description"="Deploy IoT app on Balena Cloud"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="red"

ADD balena-deploy.sh /usr/bin/balena-deploy.sh
CMD ["balena-deploy"]
