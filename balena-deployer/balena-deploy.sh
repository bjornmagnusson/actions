#!/bin/bash
set -e
set -o pipefail

$BALENA_APP=$1
if [[ -z "$BALENA_TOKEN" ]]; then
  echo "Set the BALENA_TOKEN env variable."
  exit 1
fi

balena login --token $BALENA_TOKEN
balena deploy $BALENA_APP
