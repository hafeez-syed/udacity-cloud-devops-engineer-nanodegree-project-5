# Blue Application

## Running Docker and Kubectl locally

## Docker

Build docker image and run docker container
```bash
$ chmod +x ./run_docker.sh
$ ./run_docker.sh
```

Test your `BLUE` application on the following URL
```bash
$ http://localhost:3000
```

Explore and dubug your application inside docker container
```bash
$ docker exec -it capstone-docker-container-blue /bin/sh
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

Start kubectl deployment of `BLUE` application
```bash
$ kubectl apply -f deploy-blue.yaml
```

Check again for any application, services and pods are running
```bash
$ kubectl get nodes,deploy,svc,pod
```

Start minikube dashboard
```bash
$ minikube dashboard
```

Get `BLUE` app K8s URL and test it on browser
```bash
$ minikube service blue-service --url
```