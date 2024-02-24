kubectl create serviceaccount -n kube-system tiller
kubectl create clusterrolebinding tiller-binding --clusterrole=cluster-admin --serviceaccount kube-system:tiller
helm create tiller

kubectl create namespace kube-lego

helm install \
  --namespace kube-lego \
  --generate-name \
  --set config.LEGO_EMAIL=donald.rauscher@gmail.com \
  --set config.LEGO_URL=https://acme-v01.api.letsencrypt.org/directory \
  --set config.LEGO_DEFAULT_INGRESS_CLASS=gce \
  stable/kube-lego
