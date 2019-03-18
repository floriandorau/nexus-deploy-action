#!/bin/sh -l

# Maven propertiees
groupId=$GROUP_ID
artifactId=$ARTIFACT_ID
version=$VERSION
packaging=$PACKAGING

# Neuxs propertiees
nexus_user=$NEXUS_USER
nexus_pw=$NEXUS_PW
nexus_base=$NEXUS
nexus_repo=$NEXUS_REPO

workspace=$GITHUB_WORKSPACE

artifact = $GITHUB_WORKSPACE/$ARTIFACT

nexus_url="https://$nexus_base/repository/$nexus_repo/"

echo "Deploying artifact '$artifact' to '$nexus_url'"
mvn deploy:deploy-file \
    -Durl=$nexus_url \
    -Dfile=$artifact \
    -DgroupId=$groupId \
    -DartifactId=$artifactId \
    -Dversion=$version \
    -Dpackaging=$packaging \
    -DgeneratePom=true \

echo "'$artifact' deployed to '$nexus_url'"