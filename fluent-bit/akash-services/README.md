A fluent-bit configmap, daemonset and all the relevant config files designed to catch, label and ship logs from akash-services namespace and ship them to a Loki instance.

Make sure to update the CLUSTER_NAME to match your own value.

Also make sure to update the name of the physical node that will host the persistent volume. On that specific node, make sure the directory exists:

mkdir -p /mnt/data/loki

chmod 777 /mnt/data/loki
