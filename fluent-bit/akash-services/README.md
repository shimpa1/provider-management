Fluent-bit daemonset for K8S-based clusters. It will catch all logs from pods in `akash-services` namespace and forward it to the Loki log collector.

## Features

- **Multi-Output Support**: Logs are forwarded to up to 3 different Loki endpoints for redundancy and data distribution
- **Container-Specific Logging**: Captures logs from akash-provider, operator-hostname, operator-inventory, operator-inventory-hardware-discovery, operator-ip, and Kubernetes events
- **Kubernetes Integration**: Automatically enriches logs with Kubernetes metadata

## How to install:

`kubectl create ns monitoring`

### Basic Installation (Single Output)
```
helm install fluent-bit ./fluent-bit \
  --namespace monitoring --create-namespace \
  --set clusterName=my-cluster \
  --set loki.host=<IP_address>
```

### Multi-Output Installation (Up to 3 Endpoints)
```
helm install fluent-bit ./fluent-bit \
  --namespace monitoring --create-namespace \
  --set clusterName=my-cluster \
  --set loki.host=<primary_loki_ip> \
  --set loki.secondary.host=<secondary_loki_ip> \
  --set loki.tertiary.host=<tertiary_loki_ip>
```

## Configuration Options

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `clusterName` | Name of the cluster for log labeling | Yes | "" |
| `loki.host` | Primary Loki endpoint host/IP | Yes | "" |
| `loki.port` | Primary Loki endpoint port | No | 32100 |
| `loki.secondary.host` | Secondary Loki endpoint host/IP | No | "" |
| `loki.secondary.port` | Secondary Loki endpoint port | No | 32100 |
| `loki.tertiary.host` | Tertiary Loki endpoint host/IP | No | "" |
| `loki.tertiary.port` | Tertiary Loki endpoint port | No | 32100 |
| `namespace` | Kubernetes namespace for deployment | No | "monitoring" |

## Log Sources

The following log sources are captured and forwarded:

- **akash-provider**: Provider service logs
- **operator-hostname**: Hostname operator logs  
- **operator-inventory**: Inventory operator logs
- **operator-inventory-hardware-discovery**: Hardware discovery operator logs
- **operator-ip**: IP operator logs
- **kubernetes-events**: Kubernetes cluster events

## Output Configuration

Each log source is forwarded to up to 3 Loki endpoints:
1. **Primary**: Always active if `loki.host` is configured
2. **Secondary**: Active if `loki.secondary.host` is configured
3. **Tertiary**: Active if `loki.tertiary.host` is configured

This provides redundancy and allows for log distribution across multiple monitoring systems.
