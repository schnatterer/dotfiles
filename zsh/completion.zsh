if command -v atuin >/dev/null 2>&1; then
  source <(atuin init zsh --disable-up-arrow)
  source <(atuin gen-completions --shell zsh)
fi 