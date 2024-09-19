Fluentd daemonset for collecting logs from all pods in akash-services namespace.

It will ship the logs to Loki.

Pre-requisites: a running K8S cluster with Grafana running in monitoring namespace.
To install:

kubectl apply -f fluentd-clusterrole.yaml -n monitoring

kubectl apply -f fluentd-clusterrolebinding.yaml -n monitoring

kubectl apply -f fluentd-configmap.yaml -n monitoring

kubectl apply -f fluentd-daemonset.yaml -n monitoring

kubectl delete pod -l app=fluentd -n monitoring
