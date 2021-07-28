Your dotfiles are how you personalize your system. These are mine.

They follow the general concepts of [holman/dotfiles](https://github.com/holman/dotfiles), but are not forked.  
Instead they are supposed to be used with [dotfiles-loader](https://github.com/schnatterer/dotfiles-loader).

## Features

* zsh (configured with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh))  
  plus a couple of very valuable extra plugins and themes.
* tmux (inspired from [.tmux](https://github.com/gpakosz/.tmux))
* vim (configured with [vimrc](https://github.com/amix/vimrc))
* terraform via [tfenv](https://github.com/tfutils/tfenv)
* [sdkman](https://sdkman.io/) for java, groovy, maven, gradle, etc.
* node.js via [nvm](https://github.com/nvm-sh/nvm)
* bin, pipx and topgrade for installing and upgrading everything.
  Hints:
    * Run `topgrade` to upgrade everything regularly.
    * Use `pipx` to install python-base apps. Other than `pip`, apps installed using `pipx` are also upgraded using topgrade.
* kubectl and docker aliases galore 

## Install 

Install them like so:

```shell
git clone https://github.com/schnatterer/dotfiles-loader .dotfiles-loader

dotfiles_repo=https://github.com/schnatterer/dotfiles ~/.dotfiles-loader/script/bootstrap
```

## Try

Or try the environment they provide in a container

```shell
docker run --rm -it ghcr.io/schnatterer/dotfiles
```

Or if you want to observe the install process:

```shell
docker run --rm -it \
  -e dotfiles_repo=https://github.com/schnatterer/dotfiles \
  -v $(pwd)/git/gitconfig:/home/dev/.dotfiles-loader/git/gitconfig.local \
  ghcr.io/schnatterer/dotfiles-loader \
  -c 'echo O | .dotfiles-loader/script/bootstrap && zsh'
```

## Development

```shell
docker run --rm -it -v $(pwd):/home/dev/.dotfiles ghcr.io/schnatterer/dotfiles-loader

# Run non-interactively, speed up the start:
docker run --rm -it -v $(pwd):/home/dev/.dotfiles \
  -v $(pwd)/git/gitconfig:/home/dev/.dotfiles-loader/git/gitconfig.local \
  ghcr.io/schnatterer/dotfiles-loader -c 'echo O | .dotfiles-loader/script/bootstrap && zsh'

# Print some debug statements to better understand order of loading
docker run --rm -it -v $(pwd):/home/dev/.dotfiles -e DEBUG ghcr.io/schnatterer/dotfiles-loader
# Print every command (`set -x`)
docker run --rm -it -v $(pwd):/home/dev/.dotfiles -e TRACE ghcr.io/schnatterer/dotfiles-loader
```