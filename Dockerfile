FROM maven:3.6.0-slim

LABEL "com.github.actions.name"="nexus-deploy-action"
LABEL "com.github.actions.description"="Deploy artifacts to Nexus using Maven deploy plugin"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/floriandorau/nexus-deploy-action"
LABEL "maintainer"="Florian Dorau <fdorau@it-economics.de>"

COPY settings.xml /project

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]