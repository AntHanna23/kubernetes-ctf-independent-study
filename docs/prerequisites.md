# **Prerequisites**
## **Linux Terminal**

This project will use Docker and Kubectl. On the server or local machine that you will be working on you will need a terminal to run these tools. Use a Linux/Mac Machine or create a virtual machine for development.  A code editor will also be useful for developing containers and scripts. I suggest Guake and Visual Studio Code, but any editors will work. 

* [Guake](http://guake-project.org/)
* [Visual Studio Code](https://code.visualstudio.com/download)

## **Docker**

Download Docker to the machines that you will be working on. This will vary depending on the operating system that you are running. Kubernetes does not work with the most current version of docker so ensure that the version that you are using is compatible with Kubernetes.

#### Ubuntu
> sudo apt install docker.io  


#### CentOS
> sudo yum install docker.io


## **KubeCtl**

Kubectl allows you to run commands against Kubernetes clusters. You can use kubectl to deploy applications, inspect and manage cluster resources, and view logs. This will go on your local machine to control the cluster.

> curl -LO https://storage.googleapis.com/kubernetes-release/release/\`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt\`/bin/linux/amd64/kubectl
>  
> curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl 
>  
>chmod +x ./kubectl 
>  
>sudo mv ./kubectl /usr/local/bin/kubectl



