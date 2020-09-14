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
$ eksctl delete cluster --region=ap-southeast-2 --name=udacity-capstone
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

```bash
$ minikube start
```

```bash
$ kubectl apply -f <deployment-template>.yaml
```

## K8s

Minikube dashboard

```bash
$ minikube dashboard
```

Once both `BLUE` and `GREEN` services are running, switch to `GREEN` service
```bash
$ kubectl rollout status deploy green-deployment -w
```

Send all your traffic from v1 `BLUE` to v2 `GREEN`
```bash
$ kubectl patch service blue-service -p '{"spec":{"selector":{"version":"v2.0.0"}}}'
```

If you want to switch back to v1 `BLUE`
```bash
$ kubectl patch service blue-service -p '{"spec":{"selector":{"version":"v1.0.0"}}}'
```

Delete your deployment
```bash
$ kubectl delete all -l app=udacity-capstone-project
```