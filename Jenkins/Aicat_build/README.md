# AICat Web Application

![Jenkins Build](https://github.com/sohaib1khan/Automation/blob/main/img/jenkinsbuild.png)

## Introduction

This project is a part of AICat, a web application that does [Your application's purpose here]. This repository contains the source code and the Jenkins pipeline configuration to automate the build and deployment process.

## Requirements

- Docker
- Jenkins
    - Pipeline plugin
    - Credentials plugin
- Git

## Setting Up Jenkins

### Jenkins Plugins

Before running the pipeline, ensure that you have installed the following Jenkins plugins:

- Pipeline
- GitHub
- Docker

### Jenkins Environment Variables

Set up the Jenkins environment variable for your DockerHub credentials.

- `DOCKERHUB_USERNAME`: Your Docker Hub username
- `DOCKERHUB_PASSWORD`: Your Docker Hub password

### Jenkins Job Configuration

1.  Create a new item in Jenkins, of type 'Pipeline'.
2.  Under Pipeline configuration, choose 'Pipeline script from SCM'.
3.  Set SCM to Git.
4.  Set the Repository URL to your repository.

## Running the Pipeline

Once the job is configured, you can run it by clicking 'Build Now'. This will:

1.  Checkout the code from the SCM.
2.  Generate the Dockerfile and docker-compose.yml files using the `jenkins_run` script.
3.  Build the Docker image.
4.  Push the image to Docker Hub.

## Troubleshooting

- If the pipeline fails during the `ls -al` command, ensure that you're using the correct comment syntax in your shell scripts. Use `#` for comments.