# docker command
if command -v podman >/dev/null; then
  d='podman'
else
  d='docker'
fi

# docker aliases
alias dbl="$d build"
alias dcin="$d container inspect"
alias dcls="$d container ls"
alias dclsa="$d container ls -a"
alias dib="$d image build"
alias dii="$d image inspect"
alias dils="$d image ls"
alias dipu="$d image push"
alias dirm="$d image rm"
alias dit="$d image tag"
alias dlo="$d container logs"
alias dnc="$d network create"
alias dncn="$d network connect"
alias dndcn="$d network disconnect"
alias dni="$d network inspect"
alias dnls="$d network ls"
alias dnrm="$d network rm"
alias dpo="$d container port"
alias dpu="$d pull"
alias dr="$d container run"
alias drit="$d container run -it"
alias drm="$d container rm"
alias 'drm!'="$d container rm -f"
alias dst="$d container start"
alias drs="$d container restart"
alias dsta="$d stop $($d ps -q)"
alias dstp="$d container stop"
alias dtop="$d top"
alias dvi="$d volume inspect"
alias dvls="$d volume ls"
alias dvprune="$d volume prune"
alias dxc="$d container exec"
alias dxcit="$d container exec -it"

# docker compose aliases

if command -v docker-compose >/dev/null || command -v podman-compose >/dev/null; then
  if command -v podman-compose >/dev/null; then
    dccmd='podman-compose'
  else
    dccmd='docker compose'
  fi


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

