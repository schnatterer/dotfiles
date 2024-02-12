# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Start tmux in the same process, so ctrl + d closes the window right away instead of returning to a non-tmux shell
# If you want a terminal without tmux start a new window with NO_TMUX=1 zsh or  zsh -c "NO_TMUX=1 zsh"
command -v tmux >/dev/null 2>&1 && if [[ "$TMUX" = "" ]] && [[ -z "$NO_TMUX" ]]; then
  exec tmux
fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi