# Green Application

## Running Docker and Kubectl locally

## Docker

Build docker image and run docker container
```bash
$ chmod +x ./run_docker.sh
$ ./run_docker.sh
```

Test your `GREEN` application on the following URL
```bash
$ http://localhost:4000
```

Explore and dubug your application inside docker container
```bash
$ docker exec -it capstone-docker-container-green /bin/sh
```

Start minikube
```bash
$ minikube start
```

Check K8s nodes, application, services and pods are running
```bash
$ kubectl get nodes,deploy,svc,pod
OR
$ kubectl get all
```

Start kubectl deployment of `GREEN` application
```bash
$ kubectl apply -f deploy-green.yaml
```

Check again for any application, services and pods are running
```bash
$ kubectl get nodes,deploy,svc,pod
```

Start minikube dashboard
```bash
$ minikube dashboard
```

Get `GREEN` app K8s URL and test it on browser
```bash
$ minikube service green-service --url
```