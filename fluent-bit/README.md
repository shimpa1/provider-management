A fluent-bit daemonset + configmap for any kubernetes cluster to gather, process and ship logs to a Loki instance.

FOR CATCHALL:
A good idea is to create an environment variable called CLUSTER_NAME 

If used in a script, then :
read -p "Enter cluster name: " CLUSTER_NAME

else use:
CLUSTER_NAME=<name of your cluster>

and then use 

cat << EOF > fluent-bit-configmap-akash-services.yaml <code here> EOF

Order of applying:

kubectl apply -f fluent-bit-service-account-rbac.yaml
kubectl apply -f fluent-bit-configmap-catchall.yaml
kubectl apply -f fluent-bit-daemonset.yaml

FOR AKASH-SERVICES ONLY:
