$env:ARM_CLIENT_ID = (az keyvault secret show --name "TerraformClientId" --vault-name "newbestrongkeyvault" --query "value" -o tsv)
$env:ARM_CLIENT_SECRET = (az keyvault secret show --name "TerraformClientSecret" --vault-name "newbestrongkeyvault" --query "value" -o tsv)
$env:ARM_TENANT_ID = (az keyvault secret show --name "TerraformTenantId" --vault-name "newbestrongkeyvault" --query "value" -o tsv)
$env:ARM_SUBSCRIPTION_ID = (az keyvault secret show --name "TerraformSubscriptionId" --vault-name "newbestrongkeyvault" --query "value" -o tsv)
