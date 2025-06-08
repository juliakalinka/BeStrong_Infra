# Create Azure storage

```bash
az group create --name rg-terraform-state --location westeurope

```

```bash
az storage account create --name tfstatestoragebestrong \
  --resource-group rg-terraform-state \
  --location westeurope \
  --sku Standard_LRS \
  --kind StorageV2

```

```bash
az storage container create --name tfstate \
  --account-name tfstatestoragebestrong \
  --public-access off

```

## Create key-vault

<!-- ```bash
az keyvault create --name kv-terraform-secrets --resource-group rg-terraform-state --location westeurope

``` -->

### Set secrets

```bash
az keyvault secret set --vault-name bestrongkeyvault --name "TerraformClientId" --value "<your-client-id>"
az keyvault secret set --vault-name bestrongkeyvault --name "TerraformClientSecret" --value "<your-client-secret>"
az keyvault secret set --vault-name bestrongkeyvault --name "TerraformTenantId" --value "<your-tenant-id>"
az keyvault secret set --vault-name bestrongkeyvault --name "TerraformSubscriptionId" --value "<your-subscription-id>"

```

#### To get crentials

```bash
az ad sp create-for-rbac --name "terraform-sp" --role="Contributor" --scopes="/subscriptions/<your-subscription-id>"
```
