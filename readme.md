# zsh-containers

> zsh-containers is a zsh plugin that provides aliases and better interoperability between podman and docker commands based on which you have installed.

## installing

### zinit

Add this to your zinit config (.zshrc):

```zsh
zinit light redxtech/zsh-containers

# it also works with turbo mode:
zinit ice wait lucid
zinit load redxtech/zsh-containers
```

### oh-my-zsh

Install it with your favourite zsh package manager, or clone it directly to your `$ZSH_CUSTOM/plugins` directory with git, and add `containers` to the plugins array in your `.zshrc` file:

```zsh
plugins=(... containers)
```

## completion

i would recommend using [greymd/docker-zsh-completion](https://github.com/greymd/docker-zsh-completion) for up-to-date completions pulled weekly from upstream.

## podman -> docker

since `podman` and `docker` commands are mostly interchangable, people will often use `alias docker="podman"`, and it usually works fine - however, if you also use `docker compose`, it might be not work if you run compose via `docker compose`, since `podman compose` isn't a command - you have to run `podman-compose`, which isn't exactly compatible with the alias method.

to solve that, i've made a `docker` function, that detects if the first argument is `compose`. if that's the case, it removes that argument, and passes the rest to `podman-compose`. for any other first argument, it passes them all to podman.

if you don't use podman or podman-compose, then this plugin won't change any of this.

# `docker` aliases

| Alias   | Command                       | Description                                                                              |
| :------ | :---------------------------- | :--------------------------------------------------------------------------------------- |
| dbl     | `docker build`                | Build an image from a Dockerfile                                                         |
| dcin    | `docker container inspect`    | Display detailed information on one or more containers                                   |
| dcls    | `docker container ls`         | List all the running docker containers                                                   |
| dclsa   | `docker container ls -a`      | List all running and stopped containers                                                  |
| dib     | `docker image build`          | Build an image from a Dockerfile (same as docker build)                                  |
| dii     | `docker image inspect`        | Display detailed information on one or more images                                       |
| dils    | `docker image ls`             | List docker images                                                                       |
| dipu    | `docker image push`           | Push an image or repository to a remote registry                                         |
| dirm    | `docker image rm`             | Remove one or more images                                                                |
| dit     | `docker image tag`            | Add a name and tag to a particular image                                                 |
| dlo     | `docker container logs`       | Fetch the logs of a docker container                                                     |
| dnc     | `docker network create`       | Create a new network                                                                     |
| dncn    | `docker network connect`      | Connect a container to a network                                                         |
| dndcn   | `docker network disconnect`   | Disconnect a container from a network                                                    |
| dni     | `docker network inspect`      | Return information about one or more networks                                            |
| dnls    | `docker network ls`           | List all networks the engine daemon knows about, including those spanning multiple hosts |
| dnrm    | `docker network rm`           | Remove one or more networks                                                              |
| dpo     | `docker container port`       | List port mappings or a specific mapping for the container                               |
| dpu     | `docker pull`                 | Pull an image or a repository from a registry                                            |
| dr      | `docker container run`        | Create a new container and start it using the specified command                          |
| drit    | `docker container run -it`    | Create a new container and start it in an interactive shell                              |
| drm     | `docker container rm`         | Remove the specified container(s)                                                        |
| drm!    | `docker container rm -f`      | Force the removal of a running container (uses SIGKILL)                                  |
| dst     | `docker container start`      | Start one or more stopped containers                                                     |
| drs     | `docker container restart`    | Restart one or more containers                                                           |
| dsta    | `docker stop $(docker ps -q)` | Stop all running containers                                                              |
| dstp    | `docker container stop`       | Stop one or more running containers                                                      |
| dtop    | `docker top`                  | Display the running processes of a container                                             |
| dvi     | `docker volume inspect`       | Display detailed information about one or more volumes                                   |
| dvls    | `docker volume ls`            | List all the volumes known to docker                                                     |
| dvprune | `docker volume prune`         | Cleanup dangling volumes                                                                 |
| dxc     | `docker container exec`       | Run a new command in a running container                                                 |
| dxcit   | `docker container exec -it`   | Run a new command in a running container in an interactive shell                         |

# `docker compose` aliases

| Alias     | Command                        | Description                                                                      |
| --------- | ------------------------------ | -------------------------------------------------------------------------------- |
| dco       | `docker-compose`               | Docker-compose main command                                                      |
| dcb       | `docker-compose build`         | Build containers                                                                 |
| dce       | `docker-compose exec`          | Execute command inside a container                                               |
| dcps      | `docker-compose ps`            | List containers                                                                  |
| dcrestart | `docker-compose restart`       | Restart container                                                                |
| dcrm      | `docker-compose rm`            | Remove container                                                                 |
| dcr       | `docker-compose run`           | Run a command in container                                                       |
| dcstop    | `docker-compose stop`          | Stop a container                                                                 |
| dcup      | `docker-compose up`            | Build, (re)create, start, and attach to containers for a service                 |
| dcupb     | `docker-compose up --build`    | Same as `dcup`, but build images before starting containers                      |
| dcupd     | `docker-compose up -d`         | Same as `dcup`, but starts as daemon                                             |
| dcupdb    | `docker-compose up -d --build` | Same as `dcup`, but build images before starting containers and starts as daemon |
| dcdn      | `docker-compose down`          | Stop and remove containers                                                       |
| dcl       | `docker-compose logs`          | Show logs of container                                                           |
| dclf      | `docker-compose logs -f`       | Show logs and follow output                                                      |
| dcpull    | `docker-compose pull`          | Pull image of a service                                                          |
| dcstart   | `docker-compose start`         | Start a container                                                                |
| dck       | `docker-compose kill`          | Kills containers                                                                 |

## credit

thanks to the [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker) and [docker-compose](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose) `oh-my-zsh` plugins for inspiration for the aliases.

## author

**zsh-containers** © [gabe dunn](https://github.com/redxtech), released under the [MIT](./LICENSE) License.
