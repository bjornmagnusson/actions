#!/bin/sh
set -e

if [[ -z "$BALENA_TOKEN" ]]; then
  echo "Set the BALENA_TOKEN env variable."
  exit 1
fi

DEBUG=1 balena login --token $BALENA_TOKEN
DEBUG=1 balena deploy "$@"
