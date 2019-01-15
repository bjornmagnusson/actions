#!/bin/bash
set -e
set -o pipefail

for envvar in $(BALENA_TOKEN BALENA_APP); do
  if [[ -z "$${envvar}" ]]; then
  	echo "Set the $envvar env variable."
  	exit 1
  fi
done

balena login --token $BALENA_TOKEN
balena deploy $BALENA_APP
