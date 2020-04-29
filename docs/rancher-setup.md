#  Rancher Setup 

Rancher is an open source software platform that enables organizations to run and manage Docker and Kubernetes in production. With Rancher, organizations no longer have to build a container services platform from scratch using a distinct set of open source technologies.

Rancher provides very good documentation. Too see how to build it from scratch, look [here](https://rancher.com/blog/2018/2018-09-26-setup-basic-kubernetes-cluster-with-ease-using-rke/).

If you are configuring the cluster for the run: 

    rke config --name <cluster-name>.yml // I used Calico for networking but others will work

This will take you though creation of thr cluster. A file will be created and then run:

    rke up

Move the generated configuration file to you kube config to allow kubectl access to the cluster.

    mkdir $HOME/.kube
    mv kube_config_cluster.yml $HOME/.kube/config


# RKE Server

RKE server is a convenient way of viewing and managing a cluster thru a GUI. Kubernetes is a very complicated framework and the GUI view of it gives a nice visual and some easy management options. Create a server that can connect to the cluster. Then update and install docker. 

### Debian/Ubuntu
    sudo apt update && sudo apt upgrade -y
    sudo apt install docker.io

### RedHat/CentOS
    sudo yum upgrade -y
    sudo yum install docker.io

Now we have to start the container and make it persist through reboots and stops.

    sudo docker container run -d --restart=unless-stopped  -p 443:443 rancher/rancher

Visit the host on port 443 and the Rancher Gui should prompt you to make a user and log in







