A fluent-bit daemonset + configmap for any kubernetes cluster to gather, process and ship logs to a Loki instance.

CATCHALL:
Will catch all logs produced in a K8S or K3S environment and ship them to Loki with the appropriate labels extracted from kubernetes metadata. An additional static label is called CLUSTER_NAME - make sure you update this with your own value.
