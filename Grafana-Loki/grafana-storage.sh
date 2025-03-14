# Create the directory structure
mkdir -p /data/grafana
mkdir -p /data/grafana/logs
mkdir -p /data/grafana/plugins
mkdir -p /data/grafana/provisioning

# Set ownership to UID 472 (Grafana container user)
chown -R 472:472 /data/grafana

# Set proper permissions
chmod -R 775 /data/grafana

# Verify permissions
ls -la /data/grafana
