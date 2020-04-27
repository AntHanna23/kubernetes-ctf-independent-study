# Kubernetes Manifests

Kubernetes Manifests are a collection of yaml configs in a single file that allows a user to build a desired application by applying the yaml file. This includes deployments, ingress, services, and anything else that would be packaged to build the application in Kubernetes. You can find the the manifests for the Capture the Flag in the repo. 

# DVWA Manifest

This web application deployment consist of the deployment of the pods, a services to allow the cluster to talk to the containers, and finally an auto scaling function. It uses a load balancer called [Metallb](https://metallb.universe.tf/installation/). Once you have a cluster installed with Rancher, you are ready to download MetalLb. 

    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
    kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
    # On first install only
    kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

Now you need a ConfigMap for MetalLb. ConfigMaps allow you to decouple configuration artifacts from image content to keep containerized applications portable. This page provides a series of usage examples demonstrating how to create ConfigMaps and configure Pods using data stored in ConfigMaps. In layman's terms, it can be used for values (configurations, secrets, etc.) to be passed to containers. Because containers die and comeback all the time, it can be helpful to pass configs from a consistent source. Create the ConfigMap by make a yaml file. 


    $ cat <<EOF | kubectl creat -f -
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
        - 192.168.1.240/2(add your netowork addressing scheme)
    EOF
    

This will create the ConfigMap for the LoadBalancer. Check this by running 

    kubectl get ConfigMaps -n metallb-system

Now go to the manifests folder and run:

    kubectl apply -f dvwa-metal-lb.yaml -n ctf

The pods will start running and you will be able to connect via the LoadBalancer port over port 8080. Find the LoadBalancer IP with 

    kubectl get svc -n metallb-system

