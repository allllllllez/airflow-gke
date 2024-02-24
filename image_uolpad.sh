#!/usr/bin/env bash

#
# https://github.com/donaldrauscher/airflow-gke?tab=readme-ov-file
# (2) Create Docker image and upload to Google Container Repository
#

docker build -t airflow-gke:latest .
docker tag airflow-gke gcr.io/${PROJECT_ID}/airflow-gke:latest

# gcloud docker -- push gcr.io/${PROJECT_ID}/airflow-gke # ERROR: gcloud crashed (TypeError): a bytes-like object is required, not 'str'
docker push gcr.io/${PROJECT_ID}/airflow-gke
