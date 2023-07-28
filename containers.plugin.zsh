
# standarized $0 handling
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# if podman is installed, alias docker to podman, and load the podman wrapper function
if ${+commands[podman]}; then
  alias docker="podman"

  # if podman-compose is available, load the wrapper function
  if ${+commands[podman-compose]}; then
    fpath+=("${0:h}/functions")
    autoload -Uz podman
  fi
fi

# load aliases
source "${0:h}/aliases.zsh"
