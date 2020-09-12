# Green Application

## Docker

Build docker image
```bash
$ docker build -t capstone-docker-image-green .
```

Run docker container
```bash
$ docker run -d -p 4444:4000 --name capstone-docker-container-green capstone-docker-image-green
```

Test your `GREEN` application on the following URL
```bash
$ http://localhost:4444
```

```bash
$ docker exec -it capstone-docker-container-green /bin/sh
```