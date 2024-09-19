append this to 

~/kubespray/inventory/akash/group_vars/k8s_cluster/k8s-cluster.yml

before kubespraying.

This will make the scheduler fill up worker nodes starting with the most used one. The result will be that there should always be worker nodes without deployments which will in turn make sure there will always be enough resources for larger deployments.
