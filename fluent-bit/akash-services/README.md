A fluent-bit configmap, daemonset and all the relevant config files designed to catch, label and ship logs and events from akash-services namespace to a Loki instance.

Make sure to update the CLUSTER_NAME to match your own value in file `fluent-bit-daemonset-akash-services.yaml`

`kubectl -n monitoring create job fluent-bit-init --image=busybox -- /bin/sh -c "mkdir -p /var/lib/fluent-bit"`

`kubectl apply -f fluent-bit-service-acct.yaml`

`kubectl apply -f fluent-bit-clusterrole.yaml`

`kubectl apply -f fluent-bit-clusterrole-binding.yaml`

Then, depending on your architecture use either the K8S or the K3S configmap:

`kubectl apply -f fluent-bit-configmap-akash-services-k8s.yaml`

And last, apply the daemonset:

`kubectl apply -f fluent-bit-daemonset-akash-services.yaml`

Watch the reload process:
`kubectl -n monitoring rollout status ds/fluent-bit` 
