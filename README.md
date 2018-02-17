Rodas in Docker Mode
======================

### Requirements

1. Docker CE:
  - [Download Docker CE For Mac](https://www.docker.com/docker-mac)
  - [Download Docker CE for Linux](https://docs.docker.com/engine/installation/linux/ubuntu/#install-using-the-repository)

2. Docker Compose (is not needed for Mac):
  - Docker Compose is already installed in Mac
  - [Download Docker Compose only Ubuntu](https://docs.docker.com/compose/install/)

- - - -


## Download base images and build containers

Execute this steps for launch Rodas in docker mode:

1. Clone this repo:
```bash
  git clone git@github.com:agustinruatta/rodas.git
```

2. Copy the `.env.example` file to `.env`, and complete the properties according your needs.  
 
**Build images on your own**

From inside our docker folder (e.g. *`rodas/docker`*):

```bash
docker-compose build
```

6. Final step:

Inside the docker folder (e.g. *`rodas/docker`*) execute:

```bash
docker-compose up -d
```

- - - -
### Rodas configuration

Nothing to do now


- - - -

## Useful Docker commands
The commands for start and stop Rodas containers are (always inside the folder where is the `docker-compose.yml`):
```bash
docker-compose start
docker-compose stop
docker-compose restart
```

You can see all the commands using:
```bash
docker-compose -h
```

For list the containers and their status:
```bash
docker-compose ps
```
To enter some container, you can fetch the name from the previous command and execute the following:
```bash
docker exec -it rodas /bin/bash
```
- - - -