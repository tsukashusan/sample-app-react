param appServicePlanName string
param location string
param kind string //windows
param tier string //Standard
param skuName string //S1
param webappsName string
param webAppsKind string //app 
param ipAddress string

resource appservice 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appServicePlanName
  location: location
  kind: kind
  sku:{
    tier: tier
    name: skuName
  }
}

resource webapps 'Microsoft.Web/sites@2020-12-01' = {
  name: webappsName
  location: location
  kind: webAppsKind
  properties:{
    serverFarmId: appservice.id
    siteConfig:{
      ipSecurityRestrictions:[
        {
          ipAddress: ipAddress
          action: 'Allow'
        }
      ]
      scmIpSecurityRestrictions:[
        {
          ipAddress: ipAddress
          action: 'Allow'
        }
      ]
    }
  }
  
  dependsOn:[
    appservice
  ]
}
