FROM ghcr.io/schnatterer/dotfiles-loader
USER root
RUN apk add tmux
USER dev 

COPY --chown=1000 . .dotfiles
# Avoid interactive mode and then re-enable for runtime
RUN touch .dotfiles-loader/git/gitconfig.local && \
  echo O | .dotfiles-loader/script/bootstrap && \
  rm .dotfiles-loader/git/gitconfig.local 
  
ENTRYPOINT ["zsh"]
CMD ["-c" , "echo Running dotfiles bootstrap script && .dotfiles-loader/script/bootstrap && echo Starting zsh && zsh"]
