set-variable -name TENANT_ID "72f988bf-86f1-41af-91ab-2d7cd011db47" -option constant
set-variable -name SUBSCRIPTOIN_GUID "dc5d3c89-36dd-4a3c-b09b-e6ee41f6d5b5" -option constant
set-variable -name BICEP_FILE "main.bicep" -option constant
set-variable -name PARAMETER_FILE "azuredeploy.parameters.dev.json" -option constant

$resourceGroupName = "azstudy-1-0526"
$location = "japanwest"

#Azure Login
Connect-AzAccount -Tenant ${TENANT_ID} -Subscription ${SUBSCRIPTOIN_GUID}

#Create Resource Group 
## az group create --name $RESOURCE_GROUP_NAME  --location $LOCATION
New-AzResourceGroup -Name ${resourceGroupName} -Location ${location} -Verbose

New-AzResourceGroupDeployment `
  -Name devenvironment `
  -ResourceGroupName ${resourceGroupName} `
  -TemplateFile ${BICEP_FILE} `
  -TemplateParameterFile ${PARAMETER_FILE} `
  -Verbose