# Installation
```
sudo snap install microk8s --classic
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
sudo su - $USER
microk8s enable dns storage dashboard

# Bug in Calico (https://github.com/ubuntu/microk8s/issues/1554#issuecomment-691426908) requires the below workaround:
sed -re "s/(value: \"first-found\")/value: \"interface=wlo.*\"/" -i /var/snap/microk8s/current/args/cni-network/cni.yaml
microk8s kubectl apply -f /var/snap/microk8s/current/args/cni-network/cni.yaml
```

# Accessing the Kubernetes Dashboard
Llogin to the dashboard via its `ClusterIP`:
```
microk8s kubectl get -n kube-system service/kubernetes-dashboard -ocustom-columns=ip:spec.clusterIP --no-headers
```

with token:
```
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
```
