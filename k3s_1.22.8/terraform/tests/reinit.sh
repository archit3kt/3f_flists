#!/bin/bash
sudo wg-quick down netTest1
terraform destroy --auto-approve --parallelism=1
terraform apply --auto-approve --parallelism=1
terraform output wg_config | sed '1,2d' | sed '$d' > netTest1.conf
sudo cp -f netTest1.conf /etc/wireguard
sudo wg-quick up netTest1
echo Pause de 20 secondes...
sleep 20
scp root@10.13.3.2:/etc/rancher/k3s/k3s.yaml ~/.kube/config
sed -i 's/127.0.0.1/10.13.3.2/' ~/.kube/config
kubens kube-system
kubectl get node --show-labels
kubectl get pod -o wide --all-namespaces
