[[ $(command -v starship >/dev/null 2>&1)  ]] &&  source <(starship completions zsh)

# Set STARSHIP_CONFIG to the starship.toml in the same directory as this script
export STARSHIP_CONFIG="$(dirname ${(%):-%N})/starship.toml"