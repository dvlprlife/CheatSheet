# Docker Cheat Sheet

#### Pull the latest image of a container
    docker compose pull [options] [SERVICE...]

#### displays log output from services defined in a Docker Compose file.
    docker compose logs [options] [SERVICE...]

#### Start the services defined in a Docker Compose file in detached mode, running them in the background.
    docker compose up -d [options] [SERVICE...]

####  Stop and remove containers, networks, and optionally images and volumes defined in a Docker Compose file.
    docker compose down [options]

***

#### Remove unused Docker objects to free up space. Clean up stopped containers, unused networks, dangling images, and build cache.
    docker system prune [options]

####  get the full Docker version information
    docker version
    docker --version

#### List all running Docker containers
    docker container ps

#### List all Docker containers (running, exited, and stopped)
    docker container ps -a

#### List Stopped Containers
    docker container ls -f "status=exited"

#### List all Docker images on the local system
    docker image ls

#### Remove Docker image from local system
    docker image rm <image-id-or-name> --force

#### List all the networks created on a Docker host
    docker network ls

#### Copy files/folders between a container and the local filesystem
    docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

    docker cp "C:\temp\file.txt" "CONTAINER:/temp/file.txt"
    docker cp C:\temp\ CONTAINER:/temp/

#### Start Docker container
    docker start <container-id-or-name>

#### Stop Docker container
    docker stop <container-id-or-name>

#### Restart Docker container
    docker restart <container-id-or-name>

#### Remove Docker container
    docker rm <container-id-or-name>
