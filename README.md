# nexus-deploy-action #

Github action to automatically deploy artifacts to Nexus using Maven deploy plugin.

## Usage ##

Register the _nexus-deploy-action_ in your `.github/main.workflow` according to the following.

```
workflow "Deploy to nexus" {
  on = "push"
  resolves = ["nexus-deploy"]
}

action "nexus-deploy" {
  uses = "floriandorau/nexus-deploy-action@master"
  secrets = ["GITHUB_TOKEN"]
}
```

## Variables ##

In order to run the deployment, the action requires the following variables passes via the enviroment.

### Nexus variables ###

| Option      | Desc
| ----------- | ---------------------------------------
| NEXUS       | Nexus base url
| NEXUS_USER  | User of the Nexus
| NEXUS_PW    | Password of the Nexus user

### Maven variables ###

| Option        | Desc
| -----------   | ---------------------------------------
| GROUP_ID      | Maven group id
| ARTIFACT_ID   | Maven artifact id
| REPOSITORY_ID | Maven repository id
| VERSION       | Version of the artifact
| ARTIFACT      | Name/path of the artifact to deploy