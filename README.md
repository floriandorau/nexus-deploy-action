# nexus-deploy-action #

Github action to deploy artifacts to Nexus using Maven deploy plugin.

## Usage ##

Register the _nexus-deploy-action_ in your `.github/main.workflow` according to the following.

```bash
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

In order to run the deployment, the action requires the following variables provided via the enviroment.

### Nexus variables ###

| Option      | Description
| ----------- | ---------------------------------------
| NEXUS       | Nexus base url
| NEXUS_USER  | User of the Nexus
| NEXUS_PW    | Password of the Nexus user

### Maven variables ###

| Option        | Description
| -----------   | ---------------------------------------
| GROUP_ID      | Maven group id
| ARTIFACT_ID   | Maven artifact id
| REPOSITORY_ID | Maven repository id
| VERSION       | Version of the artifact
| ARTIFACT      | Name/path of the artifact to deploy

## Note ##

The `version` option is not working properly at the moment. The action will try to parse it from `package.json` file. Therefore the action will work with Node-based applications only!
