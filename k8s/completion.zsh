command -v helm >/dev/null 2>&1 && source <(helm completion zsh) 
command -v k3d >/dev/null 2>&1 && source <(k3d completion zsh)

# See aliases
if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
  
  # make completion work with other functions/binaries
  compdef koyaml='kubectl'
  
  command -v kubecolor >/dev/null 2>&1 && compdef kubecolor=kubectl
fi 

[[ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]] && source '/usr/share/google-cloud-sdk/completion.zsh.inc'