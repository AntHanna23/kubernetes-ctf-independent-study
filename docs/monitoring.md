# Monitoring and Logging

The cluster has monitoring and logging using tools to visualize and collect logs for the cluster

* [Prometheus](https://prometheus.io/)
* [Grafana](https://grafana.com/)
* [Fluentd](https://www.fluentd.org/)
* [ELK Stack](https://www.elastic.co/what-is/elk-stack)

## Deploying Prometheus and Grafana
Prometheus and Gafana will show real time events that are happening with the Kubernetes Cluster. Alerts can be made from the Prometheus Alert Manager to send alerts based off values that are met.Deploy these to the cluster by running.

    kubectl apply -f manifests/cattle-prometheus.yaml 

Check the service in the cattle-prometheus namespace and visit the respective IP to see Grafana and Prometheus with full node exporter dashboard. 

When the container dies teh data will also be deleted. This is only for monitoring the cluster in real time  and persistant logging will be gathered in fluentd and forwarded to ELK stack. 

# ELK Stack
ElK Stack has to be ran on a seperate server to ensure that the logs are to ensuere persistance and safe storage of the server. Create a server and download Docker. Copy the ELK directory in the containers folder to the new machine. 

On the new machine:

    sudo echo sysctl -w vm.max_map_count=262144 >> /etc/sysctl.conf

Change directory into the ELK file and run:

    docker-composed up -d

This will create the conatiner and the volumes that will be used to store and process the logs. Finally we need to tell Rancher to forward the logs to ELK.

Go to the logging tab within the ctf namespace and select logging. Choose elasticsearch and input the correct ip.

TODO add pictures



