GREEN=$(tput setaf 2)
RESET=$(tput sgr0)
namespace="jenkins"

check_pod_status() {
    echo "Checking pod status for namespace: $namespace"
    kubectl -n "$namespace" wait --for=condition=Ready pod --timeout=1s --all
}

echo "Configure Helm for Jenkins"
helm repo add jenkins https://charts.jenkins.io
helm repo update

echo "Installing Jenkins"
helm upgrade --install jenkins jenkins/jenkins --namespace $namespace

echo "Waiting for pods to be ready"
check_pod_status

echo "Get Jenkins pwd"
echo -e "${GREEN}$(kubectl get secret --namespace jenkins jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --d)${RESET}\n"

echo "Port forward"
kubectl --namespace $namespace port-forward svc/jenkins 8080:8080
