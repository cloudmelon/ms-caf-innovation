#!/bin/sh

# az cloud set --name AzureChinaCloud|AzureGermanCloud|AzureUSGovernment

export ARM_USE_MSI=true
export ARM_SUBSCRIPTION_ID=xxxxxxxx
export ARM_CLIENT_ID=xxxxxxx
export ARM_CLIENT_SECRET=xxxxxxx
export ARM_TENANT_ID=xxxxxxxx

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your_subscription_id"

terraform plan -var "client_id=your_client_id" -var "client_secret=your_client_secret" -out run.plan

terraform apply "run.plan"          

echo "$(terraform output kube_config)" > ~/.kube/azurek8s

export KUBECONFIG=~/.kube/azurek8s