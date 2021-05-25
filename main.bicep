//scope
targetScope = 'resourceGroup'
//Storage account for deployment scripts
var location = resourceGroup().location

param appServicePlanName string
param kind string //windows
param tier string //Standard
param skuName string //S1
param webappsName string
param webAppsKind string //app 
param ipAddress string

module webapps './app-service.bicep' = {
    name : 'webapps'
    params:{
      appServicePlanName: appServicePlanName
      location: location
      kind: kind
      tier: tier
      skuName: skuName
      webappsName: webappsName
      webAppsKind: webAppsKind
      ipAddress: ipAddress
    }
}
