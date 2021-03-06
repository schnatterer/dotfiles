# Those could also be managed by bin: https://github.com/marcosnils/bin

if command -v docker-image-sizes.sh >/dev/null 2>&1; then
  # Preferred because of DockerHub rate limiting
  alias docker-image-size="$(which docker-image-size-docker.sh)"
  alias docker-image-sizes="$(which docker-image-sizes.sh)"
else 
  # Use Docker if not on PATH
  # cant use gcloud docker auth
  alias docker-image-size='docker run --rm --entrypoint docker-image-size-curl.sh schnatterer/docker-image-size'
  alias docker-image-sizes='docker run --rm -e DIS_IMPL schnatterer/docker-image-size'
fi

#alias reg='docker run --rm -v ${HOME}:/root r.j3ss.co/reg'
#alias terraform='drrmitv ${HOME}:${HOME} --network=host -u "$(id -u):$(id -g)" -w $(pwd) hashicorp/terraform:0.12.24'
#alias velero='docker run --rm -u $(id -u):$(id -g) -v ${HOME}:/home -eHOME=/home velero/velero'