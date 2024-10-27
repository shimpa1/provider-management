A fluent-bit daemonset + configmap for any kubernetes cluster to gather, process and ship logs to a Loki instance.

A good idea is to create an environment variable called CLUSTER_NAME 

read -p "Enter cluster name: " CLUSTER_NAME

and then use 

cat << EOF > fluent-bit-configmap-akash-services.yaml <code here> EOF
