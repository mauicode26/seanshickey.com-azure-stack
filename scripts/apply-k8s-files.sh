kubectl apply -f ../k8s-secrets/secrets.yaml
kubectl apply -f ../k8s/azure-file-sc.yaml
kubectl apply -f ../k8s/azure-file-pvc.yaml
kubectl apply -f ../k8s/config-map.yaml
kubectl apply -f ../k8s/deployment.yaml 
kubectl apply -f ../k8s/service.yaml    
kubectl apply -f ../k8s/ingress.yaml
