# Too many builds failed with build kit, as of 07/2020
#export DOCKER_BUILDKIT=1 

if [[ -d "$HOME/Documents/git/docker-image-size/scripts/" ]]; then
  export PATH="$HOME/Documents/git/docker-image-size/scripts/:${PATH}"
fi