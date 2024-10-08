Fluentd daemonset for collecting logs from all pods in akash-services namespace.

It will ship the logs to Loki.

Pre-requisites: a running K8S cluster with Grafana running in monitoring namespace.

To install:

helm upgrade loki grafana/loki-stack -f loki-values.yaml -n monitoring

kubectl apply -f fluentd-clusterrole.yaml -n monitoring

kubectl apply -f fluentd-clusterrolebinding.yaml -n monitoring

kubectl apply -f fluentd-configmap.yaml -n monitoring

kubectl apply -f fluentd-daemonset.yaml -n monitoring

kubectl delete pod -l app=fluentd -n monitoring

Install Loki:

helm install loki grafana/loki-distributed \
  --namespace monitoring \
  --set ingress.enabled=true \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/rewrite-target"="/" \
  --set ingress.annotations."nginx\.ingress\.kubernetes\.io/ssl-redirect"="\"true\"" \
  --set ingress.hosts[0]=loki.euro-ai.net \
  --set ingress.tls[0].hosts[0]=loki.euro-ai.net \
  --set ingress.tls[0].secretName=loki-tls \
  --set config.server.http_listen_port=3100 \
  --set gateway.enabled=false \
  --set ingress.pathType=Prefix \

kubectl apply -f loki-nodeport-svc.yaml
kubectl apply -f loki-manifests.yaml
