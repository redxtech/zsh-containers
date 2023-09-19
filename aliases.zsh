# docker aliases
alias dbl='docker build'
alias dcin='docker container inspect'
alias dcls='docker container ls'
alias dclsa='docker container ls -a'
alias dib='docker image build'
alias dii='docker image inspect'
alias dils='docker image ls'
alias dipu='docker image push'
alias dirm='docker image rm'
alias dit='docker image tag'
alias dlo='docker container logs'
alias dnc='docker network create'
alias dncn='docker network connect'
alias dndcn='docker network disconnect'
alias dni='docker network inspect'
alias dnls='docker network ls'
alias dnrm='docker network rm'
alias dpo='docker container port'
alias dpu='docker pull'
alias dr='docker container run'
alias drit='docker container run -it'
alias drm='docker container rm'
alias 'drm!'='docker container rm -f'
alias dst='docker container start'
alias drs='docker container restart'
alias dsta='docker stop $(docker ps -q)'
alias dstp='docker container stop'
alias dtop='docker top'
alias dvi='docker volume inspect'
alias dvls='docker volume ls'
alias dvprune='docker volume prune'
alias dxc='docker container exec'
alias dxcit='docker container exec -it'

# docker compose aliases

if command -v docker-compose >/dev/null || command -v podman-compose >/dev/null; then
  dccmd='docker-compose'

  alias dco="$dccmd"
  alias dcb="$dccmd build"
  alias dce="$dccmd exec"
  alias dcps="$dccmd ps"
  alias dcrestart="$dccmd restart"
  alias dcrm="$dccmd rm"
  alias dcr="$dccmd run"
  alias dcstop="$dccmd stop"
  alias dcup="$dccmd up"
  alias dcupb="$dccmd up --build"
  alias dcupd="$dccmd up -d"
  alias dcupdb="$dccmd up -d --build"
  alias dcdn="$dccmd down"
  alias dcl="$dccmd logs"
  alias dclf="$dccmd logs -f"
  alias dcpull="$dccmd pull"
  alias dcstart="$dccmd start"
  alias dck="$dccmd kill"

  unset dccmd
fi

