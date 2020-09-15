# udacity-cloud-devops-engineer-nanodegree-project-5
Capstone project - Udacity Cloud DevOps NanoDegree

<hr />

In this project, we will create 2 applications i.e Blue and Green running inside the docker containers and deploying them to the Kubernetes Cluster. Later we will switch BLUE application to the GREEN in the cluster.

<hr />

![](https://github.com/hafeez-syed/pipeline.png)

<hr />

Following will be performed inside the AWS EC2 instance running the Jenkins pipeline

## NodeJS and NPM

```bash
 - View Nodejs version
 - View NPM version
```

## Install NodeJS packages

```bash
 - Install node packages for Blue application
 - Install node packages for Green application
```

## Lint static files

```bash
 - Lint HTML files
 - Lint Javascript files
```

## Adding permissions

```bash
 - Assign execution permission to all scripts and templates
```

## Docker

```bash
 - Build docker images in the system
    - Build blue image
    - Build green image

 - Push docker images to the registry
    - Push blue image
    - Push green image

 - Delete docker images from the system
    - Push blue image
    - Push green image
```

## Kuberbetes (K8s)

```bash
 - Create Kubernetes Cluster in AWS using eksctl
 - Update Cluster configuration
 - Deploy Blue Application
 - Deploy Green Application
 - Run Blue Application service
 - Verify Blue service is running
 - Switch to Green Application service
 - Verify Blue Application has been replaced with Green Application
```

## Clenup

```bash
 - Delete an unused docker data in the system
 - Delete Kubernetes Cluster
```

<hr />

![](https://github.com/hafeez-syed/blue.png)

<hr />

![](https://github.com/hafeez-syed/green.png)
