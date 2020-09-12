# Blue Application

## Docker

Build docker image
```bash
$ docker build -t capstone-docker-image-blue .
```

Run docker container
```bash
$ docker run -d -p 3333:3000 --name capstone-docker-container-blue capstone-docker-image-blue
```

Test your `BLUE` application on the following URL
```bash
$ http://localhost:3333
```

```bash
$ docker exec -it capstone-docker-container-blue /bin/sh
```