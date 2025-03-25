
// vm-bastion.bicep
// Tag param
param applicationId string
param applicationService string
param chargeCode string
param environment string
param ticketNumber string
param approverName string

// Bastion VM 
param vmName string
param vmAdminUsername string
// @secure()
// param vmAdminPassword string 
param vmVnetName string
param vmSubnetName string
param location string = resourceGroup().location
param vmSize string = 'Standard_DS1_v2' // Default to Standard_DS1_v2, can be overridden
param windowsImagePublisher string = 'MicrosoftWindowsServer'
param windowsImageOffer string = 'WindowsServer'
param windowsImageSku string = '2019-Datacenter'
param windowsImageVersion string = 'latest'

// Generate Credentials and store in Key Vault
@secure()
param vmAdminPassword string
param keyVaultName string = 'go-azkv-dev-use-opsgpt'
// param keyVaultSecretName string

// Tag Values
var tagValues = {
  Application_ID : applicationId
  Application_Service: applicationService
  Charge_Code: chargeCode 
  Environment: environment
  Ticket_Number: ticketNumber
  Approver_Name: approverName
}
// Save as Key Vault secret
// resource vault 'Microsoft.KeyVault/vaults@2023-07-01' existing = {
//   name: keyVaultName}

// resource kvSecret 'Microsoft.KeyVault/vaults/secrets@2023-07-01' = {
//   name: replace(replace(keyVaultSecretName, '.', '-'), ' ', '-')
//   parent: vault
//   properties: {
//     contentType: 'text/plain'
//     attributes: {
//       enabled: 'true'
//     }
//     value: "vmbastionpass"
//   }
// }

resource networkInterface 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${vmName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vmVnetName, vmSubnetName)
          }
          // enableAcceleratedNetworking: 'true'
          // enableIPForwarding: 'true'
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

// resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2022-05-01' = {
//   name: networkSecurityGroupName
//   location: location
//   properties: {
//     securityRules: [
//       {
//         name: 'default-allow-3389'
//         properties: {
//           priority: 1000
//           access: 'Allow'
//           direction: 'Inbound'
//           destinationPortRange: '3389'
//           protocol: 'Tcp'
//           sourcePortRange: '*'
//           sourceAddressPrefix: '*'
//           destinationAddressPrefix: '*'
//         }
//       }
//     ]
//   }
// }

// resource vault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
//   name: keyVaultName
//   // scope: resourceGroup(kvResourceGroup)
// }

resource virtualMachine 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: vmName
  location: location
  tags: tagValues
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      imageReference: {
        publisher: windowsImagePublisher
        offer: windowsImageOffer
        sku: windowsImageSku
        version: windowsImageVersion
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    osProfile: {
      computerName: vmName
      adminUsername: vmAdminUsername
      adminPassword: vmAdminPassword
      windowsConfiguration: {
        enableAutomaticUpdates: true // Enable automatic updates
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterface.id
        }
      ]
    }
  }
}

output vmId string = virtualMachine.id
// output kvSecretUri string = kvSecret.properties.secretUri

//output vmPublicIP string = networkInterface.properties.ipConfigurations[0].properties.publicIPAddress.id


//
//
// dev-parameters.json
//
{
  '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#'
  contentVersion: '1.0.0.0'
  parameters: {
    applicationId: {
      value: '700519'
    }
    chargeCode: {
      value: '2440204063'
    }
    environment: {
      value: 'Dev'
    }
    ticketNumber: {
      value: 'RITM2890507'
    }
    applicationService: {
      value: 'One Platform - Azure - Networking DEV'
    }
    approverName: {
      value: 'szhang136'
    }
    storages: {
      value: [
        {
          name: 'gosadevuseopsgpt01'
          storageAccountSku: 'Standard_LRS'
          accessTier: 'Hot'
          storageAccountKind: 'StorageV2'
        }
        {
          name: 'gosadevuseopsgpt02'
          storageAccountSku: 'Standard_LRS'
          accessTier: 'Hot'
          storageAccountKind: 'StorageV2'
        }
      ]
    }
    keyvaults: {
      value: [
        {
          vaultname: 'go-azkv-dev-use-opsgpt'
        }
      ]
    }
    asps: {
      value: [
        {
          name: 'go-asp-dev-use-opsgpt01'
          sku: 'B1'
          kind: 'Windows'
        }
        {
          name: 'go-asp-dev-use-opsgpt02'
          sku: 'B1'
          kind: 'Linux'
        }
      ]
    }
    functionapps: {
      value: [
        {
          name: 'gofadevuseopsgpt01'
          ASPName: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/go-rg-m-dev-eus-opsgpt/providers/Microsoft.Web/serverfarms/go-asp-dev-use-opsgpt01'
        }
        {
          name: 'gofadevuseopsgpt02'
          ASPName: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/go-rg-m-dev-eus-opsgpt/providers/Microsoft.Web/serverfarms/go-asp-dev-use-opsgpt01'
        }
        {
          name: 'gofadevuseopsgpt03'
          ASPName: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OpsGPT/providers/Microsoft.Web/serverFarms/go-asp-dev-use-opsgpt02'
        }
      ]
    }
    apps: {
      value: [
        {
          name: 'goappdevuseopsgpt01'
          ASPName: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OpsGPT/providers/Microsoft.Web/serverFarms/go-asp-dev-use-opsgpt02'
          subnetID: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNASPDEV115001'
          linuxFxVersion: 'NODE|18-lts'
          kind: 'app,linux'
        }
        {
          name: 'goappdevuseopsgpt02'
          ASPName: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OpsGPT/providers/Microsoft.Web/serverFarms/go-asp-dev-use-opsgpt02'
          subnetID: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNASPDEV115001'
          linuxFxVersion: 'DOCKER|goacrdevuseopsgpt01.azurecr.io/ai-workbench-gpt-api:latest'
          kind: 'app,linux,container'
        }
      ]
    }
    acrs: {
      value: [
        {
          name: 'goacrdevuseopsgpt01'
        }
      ]
    }
    publicips: {
      value: [
        {
          name: 'gopipdevuseopsgpt01'
        }
      ]
    }
    apims: {
      value: [
        {
          name: 'goapimdevuseopsgpt01'
          sku: 'Standard'
          skuCount: 1
          publisherName: 'opsgpt_developer_team'
          publisherEmail: 'go-fmoneplatformclo1@kpmg.com'
        }
      ]
    }
    agws: {
      value: [
        {
          name: 'goagwdevuseopsgpt01'
          subnet: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNAGP11510'
          fqdn: 'goappdevuseopsgpt01.azurewebsites.net'
          privateIpAddress: '10.84.214.101'
          publicIPAddressID: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OpsGPT/providers/Microsoft.Network/publicIPAddresses/gopipdevuseopsgpt01-pip01'
        }
      ]
    }
    openais: {
      value: [
        {
          name: 'goopenaidevuseopsgpt01'
        }
      ]
    }
    frs: {
      value: [
        {
          name: 'gofrdevuseopsgpt01'
        }
      ]
    }
    lngs: {
      value: [
        {
          name: 'golngdevuseopsgpt01'
        }
      ]
    }
    cosmosdbs: {
      value: [
        {
          name: 'gocosmosdevuseopsgpt01'
          keyvaultname: 'go-azkv-dev-use-opsgpt'
        }
      ]
    }
    vms: {
      value: [
        {
          vmname: 'govmdevuseopsgpt01'
          vmVnetName: 'GOAZRVNETDEV11500'
          vmSubnetName: 'GOSNBEI11510'
          keyVaultName: 'go-azkv-dev-use-opsgpt'
          keyVaultSecretName: 'vmbastion'
          vmAdminUsername: 'la-admin'
          vmAdminPassword: {
            reference: {
              keyVault: {
                id: '/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/mykeyvaultdeploymentrg/providers/Microsoft.KeyVault/vaults/go-azkv-dev-use-opsgpt'
              }
              secretName: 'vmbastion'
            }
          }
        }
      ]
    }
  }
}


