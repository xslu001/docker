# A OpenGrok Docker container support multi repo!

## OpenGrok 1.1 from official source:

Directly downloaded from official source:
https://github.com/OpenGrok/docker

You can learn more about OpenGrok at http://oracle.github.io/opengrok/

The container is available from DockerHub at https://hub.docker.com/r/opengrok/docker/


## How to run:

The container exports ports 8080 for OpenGrok.

    docker run --name multirepo -d -v <path/to/your_opengrok_root>:/var/opengrok -p 8080:8080 xslu001/opengrok-multirepo:latest

The volume mounted to `/src` should contain the projects you want to make searchable (in sub directories). You can use common revision control checkouts (git, svn, etc...) and OpenGrok will make history and blame information available.

## How to add a repo:
* create dir in <path/to/your_opengrok_root>: mkdir -p <repo name>/{src,data,etc}
* cp source code to <path/to/your_opengrok_root>/<repo name>/src
* docker exec -it multirepo /multirepo/deployNewRepo.sh <repo name>
* docker exec -it multirepo /multirepo/createIndex.sh <repo name>

## OpenGrok Web-Interface

The container has OpenGrok as default web app installed (accessible directly from `/`). With the above container setup, you can find it running on

http://localhost:8080/

Please note: on first startup, the web interface will display empty content
until the indexing has been completed. Give it some time (depending on the
amount of data indexed - might take many hours for large code bases !) and reload.

The subsequent reindex will be incremental so will take signigicantly less time.

## Inspecting the container

You can get inside a container using the [command below](https://docs.docker.com/engine/reference/commandline/exec/):

```
docker exec -it <container> bash
```

Enjoy.
