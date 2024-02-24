#!/usr/bin/env bash

#
# https://github.com/donaldrauscher/airflow-gke?tab=readme-ov-file
# (1) Store project id and Fernet key as env variables
#

export PROJECT_ID=$(gcloud config get-value project -q)

if [ ! -d '.keys' ]; then
  mkdir ./.keys
fi

if [ ! -f '.keys/fernet.key' ]; then
  export FERNET_KEY=$(python3 -c "from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print(FERNET_KEY)")
  echo $FERNET_KEY > .keys/fernet.key
else
  export FERNET_KEY=$(cat .keys/fernet.key)
fi

