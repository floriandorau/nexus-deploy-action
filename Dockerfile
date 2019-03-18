FROM maven:3.6.0-slim

LABEL "com.github.actions.name"="nexus-deploy-action"
LABEL "com.github.actions.description"="Deploy artifacts to Nexus using Maven deploy plugin"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="blue"

COPY settings.xml /github/workspace/settings.xml

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]