# kubeernetes aliases

# get zsh complete kubectl
source <(kubectl completion zsh)

# set aliases to use kubecolor if it's installed
if command -v kubecolor >/dev/null; then
  kcmd="kubecolor"
  compdef kubecolor=kubectl
else 
  kcmd="kubectl"
fi

# this command is used a lot
alias k="$kcmd"

# switch namespaces
alias kns="kubens"

# switch contexts
alias ktx="kubectx"

# Execute a kubectl command against all namespaces
alias kca="_kca(){ $kcmd \"$@\" --all-namespaces;  unset -f _kca; }; _kca"

# Apply a YAML file
alias kaf="$kcmd apply -f"

# Apply a kustomization directory
alias kak="$kcmd apply -k"

# Drop into an interactive terminal on a container
alias keti="$kcmd exec -t -i"

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc="$kcmd config use-context"
alias kcsc="$kcmd config set-context"
alias kcdc="$kcmd config delete-context"
alias kccc="$kcmd config current-context"

# List all contexts
alias kcgc="$kcmd config get-contexts"

# General aliases
alias kdel="$kcmd delete"
alias kdelf="$kcmd delete -f"

# Pod management.
alias kgp="$kcmd get pods"
alias kgpa="$kcmd get pods --all-namespaces"
alias kgpw="kgp --watch"
alias kgpwide="kgp -o wide"
alias kep="$kcmd edit pods"
alias kdp="$kcmd describe pods"
alias kdelp="$kcmd delete pods"
alias kgpall="$kcmd get pods --all-namespaces -o wide"

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl="kgp -l"

# get pod by namespace: kgpn kube-system"
alias kgpn="kgp -n"

# Service management.
alias kgs="$kcmd get svc"
alias kgsa="$kcmd get svc --all-namespaces"
alias kgsw="kgs --watch"
alias kgswide="kgs -o wide"
alias kes="$kcmd edit svc"
alias kds="$kcmd describe svc"
alias kdels="$kcmd delete svc"

# Ingress management
alias kgi="$kcmd get ingress"
alias kgia="$kcmd get ingress --all-namespaces"
alias kei="$kcmd edit ingress"
alias kdi="$kcmd describe ingress"
alias kdeli="$kcmd delete ingress"

# Namespace management
alias kgns="$kcmd get namespaces"
alias kens="$kcmd edit namespace"
alias kdns="$kcmd describe namespace"
alias kdelns="$kcmd delete namespace"
alias kcn="$kcmd config set-context --current --namespace"

# ConfigMap management
alias kgcm="$kcmd get configmaps"
alias kgcma="$kcmd get configmaps --all-namespaces"
alias kecm="$kcmd edit configmap"
alias kdcm="$kcmd describe configmap"
alias kdelcm="$kcmd delete configmap"

# Secret management
alias kgsec="$kcmd get secret"
alias kgseca="$kcmd get secret --all-namespaces"
alias kdsec="$kcmd describe secret"
alias kdelsec="$kcmd delete secret"

# Deployment management.
alias kgd="$kcmd get deployment"
alias kgda="$kcmd get deployment --all-namespaces"
alias kgdw="kgd --watch"
alias kgdwide="kgd -o wide"
alias ked="$kcmd edit deployment"
alias kdd="$kcmd describe deployment"
alias kdeld="$kcmd delete deployment"
alias ksd="$kcmd scale deployment"
alias krsd="$kcmd rollout status deployment"

function kres(){
  $kcmd set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
}

# Rollout management.
alias kgrs="$kcmd get replicaset"
alias kdrs="$kcmd describe replicaset"
alias kers="$kcmd edit replicaset"
alias krh="$kcmd rollout history"
alias krr="$kcmd rollout restart"
alias krd="$kcmd rollout restart deployment"
alias kru="$kcmd rollout undo"

# Statefulset management.
alias kgss="$kcmd get statefulset"
alias kgssa="$kcmd get statefulset --all-namespaces"
alias kgssw="kgss --watch"
alias kgsswide="kgss -o wide"
alias kess="$kcmd edit statefulset"
alias kdss="$kcmd describe statefulset"
alias kdelss="$kcmd delete statefulset"
alias ksss="$kcmd scale statefulset"
alias krsss="$kcmd rollout status statefulset"

# Port forwarding
alias kpf="$kcmd port-forward"

# Tools for accessing all information
alias kga="$kcmd get all"
alias kgaa="$kcmd get all --all-namespaces"

# Logs
alias kl="$kcmd logs"
alias kl1h="$kcmd logs --since 1h"
alias kl1m="$kcmd logs --since 1m"
alias kl1s="$kcmd logs --since 1s"
alias klf="$kcmd logs -f"
alias klf1h="$kcmd logs --since 1h -f"
alias klf1m="$kcmd logs --since 1m -f"
alias klf1s="$kcmd logs --since 1s -f"

# File copy
alias kcp="$kcmd cp"

# Node Management
alias kgno="$kcmd get nodes"
alias keno="$kcmd edit node"
alias kdno="$kcmd describe node"
alias kdelno="$kcmd delete node"

# PVC management.
alias kgpvc="$kcmd get pvc"
alias kgpvca="$kcmd get pvc --all-namespaces"
alias kgpvcw="kgpvc --watch"
alias kepvc="$kcmd edit pvc"
alias kdpvc="$kcmd describe pvc"
alias kdelpvc="$kcmd delete pvc"

# Service account management.
alias kdsa="$kcmd describe sa"
alias kdelsa="$kcmd delete sa"

# DaemonSet management.
alias kgds="$kcmd get daemonset"
alias kgdsw="kgds --watch"
alias keds="$kcmd edit daemonset"
alias kdds="$kcmd describe daemonset"
alias kdelds="$kcmd delete daemonset"

# CronJob management.
alias kgcj="$kcmd get cronjob"
alias kecj="$kcmd edit cronjob"
alias kdcj="$kcmd describe cronjob"
alias kdelcj="$kcmd delete cronjob"

# Job management.
alias kgj="$kcmd get job"
alias kej="$kcmd edit job"
alias kdj="$kcmd describe job"
alias kdelj="$kcmd delete job"

# Only run if the user actually has kubectl installed
function kj() { $kcmd "$@" -o json | jq; }
function kjx() { $kcmd "$@" -o json | fx; }
