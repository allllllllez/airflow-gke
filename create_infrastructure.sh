#!/usr/bin/env bash

#
# https://github.com/donaldrauscher/airflow-gke
# (3) Create infrastructure with Terraform
#

if [ ! -d "./.terraform" ]; then
	terraform init
fi

# こうなるので： Error: Attempted to load application default credentials since neither `credentials` nor `access_token` was set in the provider block.  No credentials loaded. To use your gcloud credentials, run 'gcloud auth application-default login'
gcloud auth application-default login

terraform apply -var project=${PROJECT_ID}

gcloud container clusters get-credentials airflow-cluster --region us-central1
gcloud config set container/cluster airflow-cluster

kubectl create secret generic cloudsql-instance-credentials # -from-file=credentials.json=.keys/airflow-cloudsql.json
