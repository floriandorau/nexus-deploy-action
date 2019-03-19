#!/bin/sh -l

# Maven propertiees
groupId=$GROUP_ID
artifactId=$ARTIFACT_ID
repositoryId=$REPOSITORY_ID
version=$VERSION
packaging=zip

# Neuxs propertiees
nexus_user=$NEXUS_USER
nexus_pw=$NEXUS_PW
nexus_base=$NEXUS

# Artifact
artifact="$ARTIFACT"
folder="$ARTIFACT_DIR"
extension="$ARTIFACT_EXT"
artifactPath="$folder$artifact.$extension"
zippedArtifact="/project/$artifact.zip"
nexus_url="https://$nexus_base/repository/$repositoryId"

echo "Zipping '$folder/$artifact' to '$zippedArtifact'"
zip -v $zippedArtifact $artifactPath

ls -la /project

echo "Deploying artifact '$artifact' to '$nexus_url' as '$groupId:$artifactId:$version'"
mvn --settings /project/settings.xml deploy:deploy-file \
    -Durl=$nexus_url \
    -Dfile=$zippedArtifact \
    -DgroupId=$groupId \
    -DrepositoryId=$repositoryId \
    -DartifactId=$artifactId \
    -Dversion=$version \
    -Dpackaging=$packaging \
    -DgeneratePom=true \
    -Drepo.id=$repositoryId \
    -Drepo.username=$nexus_user \
    -Drepo.password=$nexus_pw

echo "'$artifact' deployed to '$nexus_url'"