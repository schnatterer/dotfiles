function kgpoyaml() {
  kubectl get pod "$@" -oyaml|yaml
}

function kgdepyaml() {
  kubectl get deployment "$@" -oyaml|yaml
}

# Allow syntax completion. Doesnt work that way for sub commands :(
# Idea: https://dev.to/raphink/colored-wrappers-for-kubectl-2pj1
# compdef kgpoyaml='kubectl get po'
function koyaml() {
  kubectl "$@" -oyaml|bat -p --language='yaml'
}

command -v kubecolor >/dev/null 2>&1 && alias kubectl="kubecolor"

[[ -f ~/.kubectl_aliases ]] && source ~/.kubectl_aliases

alias kx=kubectx
alias kn=kubens

export USE_GKE_GCLOUD_AUTH_PLUGIN=True