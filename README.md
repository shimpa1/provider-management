Akash provider management repository.

Some of the tools to make managing Akash providers simpler.

Feel free to use

Grafana-Loki repo is for private deployments where neither Grafana nor Loki require any authentication. It's optimized for loki log ingestion and acess via Grafana.

Prometheus-Grafana repo is for public environments. It is used for creation of a Kubernetes monitoring system based on Prometheus which is collecting data and Grafana for displaying. A number of dashboards will already be created by default.

Fluent-bit repo is for fluent-bit log collection, specifically optimized for Akash Providers. It will catch all pod logs running in a K8S or K3S system and ship them to Loki. Soon to be added a configmap that will only capture logs from akash-services namespace.

Fluentd repo is outdated and will not receive any further updates.
