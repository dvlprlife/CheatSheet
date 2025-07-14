# Docker

##  Table of Contents

1. [Docker Containers](#Docker-Containers)

    a. [List Running Containers](#list-running-containers)

    b. [List All Containers](#list-all-containers)

    c. [List Stopped Containers](#list-stopped-containers)
   
    d. [List Docker Images](#list-docker-images)
   
    e. [Copy Files/Folders to Container](#copy-filesfolders-between-a-container-and-the-local-filesystem)

    f. [Start Container](#start-container)

    g. [Stop Container](#stop-container)

    h. [Restart Container](#restart-container)

    i. [Remove Container](#remove-container)
    
3. [Misc](#Misc)

    a. [HyperV](#HyperV)

***

## Docker Containers

### List Running Containers
    docker container ps

### List All Containers
    docker container ps -a

### List Stopped Containers
    docker container ls -f "status=exited"

### List Docker Images
    docker image ls
    
### Copy files/folders between a container and the local filesystem
    docker cp [OPTIONS] SRC_PATH|- CONTAINER:DEST_PATH

    docker cp "C:\temp\file.txt" "CONTAINER:/temp/file.txt"
    docker cp C:\temp\ CONTAINER:/temp/

### Start Container
    docker start CONTAINER

### Stop Container
    docker stop CONTAINER

### Restart Container
    docker restart CONTAINER

### Remove Container
    docker rm CONTAINER
 
## Misc

### HyperV
    Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V', "Containers") -All

