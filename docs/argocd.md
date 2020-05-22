# ArgoCD and Declarative GitOps

ArgoCD is a continous deployment tool for Kubernetes. It uses Git repositories as a "source of truth for the manifests that are deployed in the Kubernetes cluster. ArgoCD watches the git repo for changes and applies the changes to the cluster. 

ArgoCD can be installed by folling the installation guide [here](https://argoproj.github.io/argo-cd/getting_started/).

After installation it allows one to make changes to the cluster and visualize the current state. It also allows one to rollback to older versions of the cluster from argoCD. 

All chnages to the CTF should be made to the Git repo and applied with argocd.