# kubeernetes aliases

# get zsh complete kubectl
source <(kubectl completion zsh)

# set aliases to use kubecolor if it's installed
if command -v kubecolor >/dev/null; then
  __container_kube_cmd="kubecolor"
  compdef kubecolor=kubectl
else 
  __container_kube_cmd="kubectl"
fi

# this command is used a lot
alias k="$__container_kube_cmd"

# switch namespaces
alias kns="kubens"

# switch contexts
alias ktx="kubectx"

# Execute a kubectl command against all namespaces
alias kca="_kca(){ $__container_kube_cmd \"$@\" --all-namespaces;  unset -f _kca; }; _kca"

# Apply a YAML file
alias kaf="$__container_kube_cmd apply -f"

# Apply a kustomization directory
alias kak="$__container_kube_cmd apply -k"

# Drop into an interactive terminal on a container
alias keti="$__container_kube_cmd exec -t -i"

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc="$__container_kube_cmd config use-context"
alias kcsc="$__container_kube_cmd config set-context"
alias kcdc="$__container_kube_cmd config delete-context"
alias kccc="$__container_kube_cmd config current-context"

# List all contexts
alias kcgc="$__container_kube_cmd config get-contexts"

# General aliases
alias kdel="$__container_kube_cmd delete"
alias kdelf="$__container_kube_cmd delete -f"

# Pod management.
alias kgp="$__container_kube_cmd get pods"
alias kgpa="$__container_kube_cmd get pods --all-namespaces"
alias kgpw="kgp --watch"
alias kgpwide="kgp -o wide"
alias kep="$__container_kube_cmd edit pods"
alias kdp="$__container_kube_cmd describe pods"
alias kdelp="$__container_kube_cmd delete pods"
alias kgpall="$__container_kube_cmd get pods --all-namespaces -o wide"

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl="kgp -l"

# get pod by namespace: kgpn kube-system"
alias kgpn="kgp -n"

# Service management.
alias kgs="$__container_kube_cmd get svc"
alias kgsa="$__container_kube_cmd get svc --all-namespaces"
alias kgsw="kgs --watch"
alias kgswide="kgs -o wide"
alias kes="$__container_kube_cmd edit svc"
alias kds="$__container_kube_cmd describe svc"
alias kdels="$__container_kube_cmd delete svc"

# Ingress management
alias kgi="$__container_kube_cmd get ingress"
alias kgia="$__container_kube_cmd get ingress --all-namespaces"
alias kei="$__container_kube_cmd edit ingress"
alias kdi="$__container_kube_cmd describe ingress"
alias kdeli="$__container_kube_cmd delete ingress"

# Namespace management
alias kgns="$__container_kube_cmd get namespaces"
alias kens="$__container_kube_cmd edit namespace"
alias kdns="$__container_kube_cmd describe namespace"
alias kdelns="$__container_kube_cmd delete namespace"
alias kcn="$__container_kube_cmd config set-context --current --namespace"

# ConfigMap management
alias kgcm="$__container_kube_cmd get configmaps"
alias kgcma="$__container_kube_cmd get configmaps --all-namespaces"
alias kecm="$__container_kube_cmd edit configmap"
alias kdcm="$__container_kube_cmd describe configmap"
alias kdelcm="$__container_kube_cmd delete configmap"

# Secret management
alias kgsec="$__container_kube_cmd get secret"
alias kgseca="$__container_kube_cmd get secret --all-namespaces"
alias kdsec="$__container_kube_cmd describe secret"
alias kdelsec="$__container_kube_cmd delete secret"

# Deployment management.
alias kgd="$__container_kube_cmd get deployment"
alias kgda="$__container_kube_cmd get deployment --all-namespaces"
alias kgdw="kgd --watch"
alias kgdwide="kgd -o wide"
alias ked="$__container_kube_cmd edit deployment"
alias kdd="$__container_kube_cmd describe deployment"
alias kdeld="$__container_kube_cmd delete deployment"
alias ksd="$__container_kube_cmd scale deployment"
alias krsd="$__container_kube_cmd rollout status deployment"

function kres(){
  $__container_kube_cmd set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
}

# Rollout management.
alias kgrs="$__container_kube_cmd get replicaset"
alias kdrs="$__container_kube_cmd describe replicaset"
alias kers="$__container_kube_cmd edit replicaset"
alias krh="$__container_kube_cmd rollout history"
alias krr="$__container_kube_cmd rollout restart"
alias krd="$__container_kube_cmd rollout restart deployment"
alias kru="$__container_kube_cmd rollout undo"

# Statefulset management.
alias kgss="$__container_kube_cmd get statefulset"
alias kgssa="$__container_kube_cmd get statefulset --all-namespaces"
alias kgssw="kgss --watch"
alias kgsswide="kgss -o wide"
alias kess="$__container_kube_cmd edit statefulset"
alias kdss="$__container_kube_cmd describe statefulset"
alias kdelss="$__container_kube_cmd delete statefulset"
alias ksss="$__container_kube_cmd scale statefulset"
alias krsss="$__container_kube_cmd rollout status statefulset"

# Port forwarding
alias kpf="$__container_kube_cmd port-forward"

# Tools for accessing all information
alias kga="$__container_kube_cmd get all"
alias kgaa="$__container_kube_cmd get all --all-namespaces"

# Logs
alias kl="$__container_kube_cmd logs"
alias kl1h="$__container_kube_cmd logs --since 1h"
alias kl1m="$__container_kube_cmd logs --since 1m"
alias kl1s="$__container_kube_cmd logs --since 1s"
alias klf="$__container_kube_cmd logs -f"
alias klf1h="$__container_kube_cmd logs --since 1h -f"
alias klf1m="$__container_kube_cmd logs --since 1m -f"
alias klf1s="$__container_kube_cmd logs --since 1s -f"

# File copy
alias kcp="$__container_kube_cmd cp"

# Node Management
alias kgno="$__container_kube_cmd get nodes"
alias keno="$__container_kube_cmd edit node"
alias kdno="$__container_kube_cmd describe node"
alias kdelno="$__container_kube_cmd delete node"

# PVC management.
alias kgpvc="$__container_kube_cmd get pvc"
alias kgpvca="$__container_kube_cmd get pvc --all-namespaces"
alias kgpvcw="kgpvc --watch"
alias kepvc="$__container_kube_cmd edit pvc"
alias kdpvc="$__container_kube_cmd describe pvc"
alias kdelpvc="$__container_kube_cmd delete pvc"

# Service account management.
alias kdsa="$__container_kube_cmd describe sa"
alias kdelsa="$__container_kube_cmd delete sa"

# DaemonSet management.
alias kgds="$__container_kube_cmd get daemonset"
alias kgdsw="kgds --watch"
alias keds="$__container_kube_cmd edit daemonset"
alias kdds="$__container_kube_cmd describe daemonset"
alias kdelds="$__container_kube_cmd delete daemonset"

# CronJob management.
alias kgcj="$__container_kube_cmd get cronjob"
alias kecj="$__container_kube_cmd edit cronjob"
alias kdcj="$__container_kube_cmd describe cronjob"
alias kdelcj="$__container_kube_cmd delete cronjob"

# Job management.
alias kgj="$__container_kube_cmd get job"
alias kej="$__container_kube_cmd edit job"
alias kdj="$__container_kube_cmd describe job"
alias kdelj="$__container_kube_cmd delete job"

# Only run if the user actually has kubectl installed
function kj() { $__container_kube_cmd "$@" -o json | jq; }
function kjx() { $__container_kube_cmd "$@" -o json | fx; }
