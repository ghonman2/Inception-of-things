#! /bin/bash

sudo apt-get update
sudo apt-get upgrade -y 

sudo apt-get install net-tools -y 

# docker install
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo chmod 666 /var/run/docker.sock
#sudo usermod -aG docker $USER


# k3d install
#curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# k3d cluster  create
#k3d cluster create joowparkNode --agents 3 --wait

#kubectl install
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
#chmod +x kubectl
#mv ./kubectl /usr/local/bin
#
## generate namespace
#kubectl create namespace argocd
#kubectl create namespace dev
#
##argoCD intall
#kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#kubectl wait --for=condition=Ready pods --all -n argocd


echo "For get argoCD admin Password ENTER : "
echo "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d"
echo "kubectl port-forward --address=0.0.0.0 svc/argocd-server -n argocd 8080:443 2>&1 & "



# k3s init
#sudo apt-get install cgroup-bin
#sudo ufw disable
#export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san $(hostname) --node-ip 192.168.56.110 --bind-address 192.168.56.110  --advertise-address 192.168.56.110"
#curl -sfL https://get.k3s.io | sh -

#sudo chmod 644 /etc/rancher/k3s/k3s.yaml
#cp /etc/rancher/k3s/k3s.yaml /vagrant
#cp /var/lib/rancher/k3s/server/node-token /vagrant/
