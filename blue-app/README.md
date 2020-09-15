# Blue Application

## Running Docker containers in K8s using Kubectl and minikube locally

## Docker

Build docker image
```bash
$ chmod +x ./build_docker.sh
$ ./build_docker.sh
```

Run docker container
```bash
$ chmod +x ./run_docker.sh
$ ./run_docker.sh
```

Test your `BLUE` application on the following URL
```bash
$ http://localhost:8080
```

Explore and dubug your application inside docker container
```bash
$ docker exec -it capstone-docker-container-blue /bin/sh
```

Upload docker image to the repository
```bash
$ chmod +x ./upload_docker.sh
$ ./upload_docker.sh
```

Remove docker image from the system
```bash
$ chmod +x ./remove_docker.sh
$ ./remove_docker.sh
```

## K8s & minikube


Start minikube
```bash
$ minikube start
```

Minikube dashboard
```bash
$ minikube dashboard
```

Check K8s nodes, application, services and pods are running
```bash
$ kubectl get nodes,deploy,svc,pod
```

Start deployment of `BLUE` application
```bash
$ kubectl apply -f blue-app.yaml
```

Start deployment of `GREEN` application
```bash
$ kubectl apply -f ../green-app/green-app.yaml
```

Run `BLUE` application
```bash
$ kubectl apply -f blue-service.yaml
```

Get `BLUE` app URL and test it on browser
```bash
$ minikube service blue-green-service-lb --url
```

Once both `BLUE` and `GREEN` services are running, switch to `GREEN` service
```bash
$ kubectl rollout status deploy green-app -w
```

Send all your traffic from `BLUE` to `GREEN`
```bash
$ kubectl patch service blue-green-service-lb -p '{"spec":{"selector":{"version":"v2.0.0"}}}'
```

If you want to switch back to `BLUE`
```bash
$ kubectl patch service blue-green-service-lb -p '{"spec":{"selector":{"version":"v1.0.0"}}}'
```

Delete your deployment
```bash
$ kubectl delete all -l app=blue-app
```