#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

BASEDIR=$(dirname $0)
ABSOLUTE_BASEDIR="$(cd $BASEDIR && pwd)"

source $ABSOLUTE_BASEDIR/gpg-agent.zsh

git "$@"
