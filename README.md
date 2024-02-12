# Simple Jenkins deployment to Kubernetes
## Local deployment
* Install [Minikube](https://minikube.sigs.k8s.io/docs/start/)
* Install [Helm](https://helm.sh/docs/intro/install/)

* Start minikube by executing `minikube start` in the shell
* Check minikube status/dashboard `minikube status/dashboard`

* When everything is ready, simply change mode of the script file: `chmod 700 deploy-jenkins.sh`
* Execute the deployment script `./deploy-jenkins.sh` 

## AKS/EKS deployment
* Eliminate `Port forward` step from the script, do further configuration if needed, later I might update it for both AKS/EKS cases
* And simply reuse the script file by connecting to `AKS/EKS` and executing it 