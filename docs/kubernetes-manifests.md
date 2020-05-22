# Kubernetes Manifests

Kubernetes Manifests are a collection of yaml configs in a single file that allows a user to build a desired application by applying the yaml file. This includes deployments, ingress, services, and anything else that would be packaged to build the application in Kubernetes. You can find the the manifests for the Capture the Flag in the repo. 

# DVWA Manifest /w MetalLb

This web application deployment consist of the deployment of the pods, a services to allows the cluster to talk to the containers, and finally an auto scaling function. It uses a load balancer called [Metallb](https://metallb.universe.tf/installation/). Once you have a cluster installed with Rancher, you are ready to download MetalLb. 

    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
    # On first install only
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

Now you need a ConfigMap for MetalLb. ConfigMaps allow you to decouple configuration artifacts from image content to keep containerized applications portable. This page provides a series of usage examples demonstrating how to create ConfigMaps and configure Pods using data stored in ConfigMaps. In layman's terms, it can be used for values (configurations, secrets, etc.) to be passed to containers. Because containers die and comeback all the time, it can be helpful to pass configs from a consistent source. Create the ConfigMap by making a yaml file. 


    $ cat <<EOF | kubectl create -f -
    apiVersion: v1
    kind: ConfigMap
    metadata:
        namespace: metallb-system
        name: config
    data:
        config: |
          address-pools:
            - name: my-ip-space
              protocol: layer2
              addresses:
              - 192.168.1.240/2(add your network addressing scheme)
    EOF
    

This will create the ConfigMap for the LoadBalancer. Check this by running 

    kubectl get ConfigMaps -n metallb-system

Now go to the manifests folder and run:

    kubectl apply -f dvwa-metal-lb.yaml -n ctf

The pods will start running and you will be able to connect via the LoadBalancer port over port 8080. Find the LoadBalancer IP with the following command and look under the external IP for the IP address to connect to.

    kubectl get svc -n ctf

# Vuln-SSH

The vulnerable SSH container is simple and does not require configurations to be passed into the container like metalLB. Simply navigate to the manifest file and run the following command:

kubectl apply -f vuln-ssh.yaml -n ctf

This will create the deployment and attach it to metalLB. Look at the services in the ctf name space to find the external IP.

# Vuln-FTP

The container has some very specific parameters that need to be set for it to work. Within the vuln-ftp docker file there is a document called vsftpd.conf. Because of the way Kubernetes does its networking, you must specify the IP it returns to. 

*Hint: Making it return to the metalLB service IP works for me.*

    vsftpd.conf

    listen=YES
    listen_port=21
    anonymous_enable=YES
    local_enable=NO
    write_enable=NO
    pasv_enable=YES
    pasv_promiscuous=YES
    port_promiscuous=YES
    pasv_min_port=13450
    pasv_max_port=13460
    file_open_mode=0755
    anon_root=/var/ftp/
    no_anon_password=YES
    pasv_address= <LoadBalancer external IP>

I will attempt to automate this with the Docker start up file, but you can also change this by replacing the IP above with the load balancer external IP.
