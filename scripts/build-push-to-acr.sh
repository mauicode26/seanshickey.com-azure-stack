# Get ACR login server from Terraform output or Azure CLI

cd ../tf

ACR_NAME=$(terraform output -raw acr_name)
ACR_LOGIN_SERVER=$(terraform output -raw acr_server_name)

# Login to ACR
az acr login --name $ACR_NAME

# Build and tag your image (from your web app directory)
docker build -t $ACR_LOGIN_SERVER/seanshickey.com:latest -f ../Dockerfile ../app

# Push to ACR
docker push $ACR_LOGIN_SERVER/seanshickey.com:latest