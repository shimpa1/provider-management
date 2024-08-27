**SET UP DNS
**

Open your browser, navigate to your Domain name hosting service (in my case Cloudflare, could be namecheap, godaddy or any other).

Add an A record for grafana pointing to your provider public IP address (this will be the same as your provider entry)

**INSTALL THE PROMETHEUS-COMMUNITY HELM CHARTS
**

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo update prometheus-community

kubectl create namespace monitoring

**CREATE THE prometheus-values.yaml FILE
**

curl https://gist.githubusercontent.com/shimpa1/20704b9329213c6419e9bbd1b81d1dfb/raw/6655c98600d075890d89bb704526670fce1b00bc/prometheus-values.yaml >> ~/provider/prometheus-values.yaml


**EDIT THE prometheus-values.yaml FILE
**

cd ~/provider
nano ~/provider/prometheus-values.yaml

1.	Make sure to explicitly set the physical IP addresses of your nodes correctly!!

2.	Make sure you enter the domain name correctly!!

3.	Make sure you specify the persistent storage class name (in my case it’s beta3, yours can be either beta1, beta2 or beta3

**CREATE SECRET
**

echo -n 'adminuser' > ./admin-user # change your username
echo -n 'p@ssword!' > ./admin-password # change your password

kubectl create secret generic grafana-admin-credentials --from-file=./admin-user --from-file=admin-password -n monitoring

**VERIFY
**

kubectl describe secret -n monitoring grafana-admin-credentials

kubectl get secret -n monitoring grafana-admin-credentials -o jsonpath="{.data.admin-user}" | base64 --decode

kubectl get secret -n monitoring grafana-admin-credentials -o jsonpath="{.data.admin-password}" | base64 --decode

**REMOVE SECRET FILES
**

rm admin-user && rm admin-password

**INSTALL PROMETHEUS STACK
**

helm install -n monitoring prometheus prometheus-community/kube-prometheus-stack -f prometheus-values.yaml

**VERIFY THAT PROMETHEUS IS USING THE PERSISTENT STORAGE
**

kubectl -n monitoring get pvc -l app.kubernetes.io/name=prometheus

**ACCESS THE GRAFANA GUI
**

Open your browser and enter the URI you have specified in the prometheus-values.yaml file

NOTE: the values might not be available immediately. Give it at least 5 minutes after installing.


