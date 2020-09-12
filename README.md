# udacity-cloud-devops-engineer-nanodegree-project-5
Capstone project - Udacity Cloud DevOps NanoDegree

### eksctl documentation
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html

### create cluster
```
$ eksctl create cluster --config-file cluster-node-group-lt.yaml
```

### delete cluster
```
$ eksctl delete cluster --region=ap-southeast-2 --name=udacity-capstone-project
```

## Docker
```bash
$ docker build -t capstone-docker-image .
```

```bash
$ docker run -d -p 3000:3000 --name capstone-docker-container capstone-docker-image
```

```bash
$ docker exec -it capstone-docker-container /bin/sh
```