# Docker

##  Table of Contents

1. [Docker Containers](#Docker-Containers)

    a. [List Running Containers](#list-running-containers)

    b. [List All Containers](#list-all-containers)

    c. [List Stopped Containers](#list-stopped-containers)

    d. [Copy Files/Folders to Container](#copy-filesfolders-between-a-container-and-the-local-filesystem)

    e. [Start Container](#start-container)

    f. [Stop Container](#stop-container)

    g. [Restart Container](#restart-container)

    h. [Remove Container](#remove-container)
    
2. [Misc](#Misc)
    a. [HyperV](#HyperV)

***

## Docker Containers

### List Running Containers
    docker container ls

### List All Containers
    docker container ls -a

### List Stopped Containers
    docker container ls -f "status=exited"

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

