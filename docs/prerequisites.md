# **Prerequisites**
## **Linux Terminal**

This project will use Docker and Kubectl. These packages work best from the Linux command line. Use a Linux/Mac Machine or create a virtual machine for development.  A code editor will also be useful for developing containers and scripts. I suggest Guake and Visual Studio Code, but any editors will work. Docker is not needed on the local machine but is helpful for testing. 

* [Guake](http://guake-project.org/)
* [Visual Studio Code](https://code.visualstudio.com/download)

## **Docker**

Download Docker to any machines that will be used within the cluster. Install KubeCtl on your local machine and set the config to allow yourself to interface with your Kubernetes cluster. This will be explained int detail more later in the documentation. This will vary depending on the operating system that you are running. Kubernetes does not work with the most current version of docker so ensure that the version that you are using is compatible with Kubernetes.

#### Ubuntu
    sudo apt install docker.io 


#### CentOS
    sudo yum install docker.io


## **KubeCtl**

Kubectl allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs. This will go on your local machine to control the cluster. Kubectl is only needed on you local machine and on a master node

    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
  
    chmod +x ./kubectl 

    sudo mv ./kubectl /usr/local/bin/kubectl


# TODO add how to put in kubernetes auto complete


