export ARM_CLIENT_ID=$(az keyvault secret show --name TerraformClientId --vault-name bestrongkeyvault --query value -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --name TerraformClientSecret --vault-name my-keyvault-name --query value -o tsv)
export ARM_TENANT_ID=$(az keyvault secret show --name TerraformTenantId --vault-name my-keyvault-name --query value -o tsv)
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --name TerraformSubscriptionId --vault-name my-keyvault-name --query value -o tsv)
