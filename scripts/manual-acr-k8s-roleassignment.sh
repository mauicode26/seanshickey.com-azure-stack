# Get the kubelet identity
KUBELET_ID=$(az aks show --resource-group aztest-rg --name seanshickey-k8s-cluster --query identityProfile.kubeletidentity.objectId -o tsv)

# Get ACR resource ID  
ACR_ID=$(az acr show --name seanshickeyacr --query id -o tsv)

# Create the role assignment manually
az role assignment create --assignee $KUBELET_ID --role "AcrPull" --scope $ACR_ID