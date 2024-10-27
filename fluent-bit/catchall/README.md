This deployment will catch all logs produced in a K8S or K3S environment and ship them to Loki with the appropriate labels.

A good idea is to create an environment variable called CLUSTER_NAME

If used in a script, then : read -p "Enter cluster name: " CLUSTER_NAME

else use: CLUSTER_NAME=

and then use

cat << EOF > fluent-bit-configmap-akash-services.yaml  EOF

Order of applying:

kubectl apply -f fluent-bit-service-account-rbac.yaml
kubectl apply -f fluent-bit-configmap-catchall.yaml
kubectl apply -f fluent-bit-daemonset.yaml
