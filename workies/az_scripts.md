###################################################################
Azure CLI && Powershell Scripts

###################################################################

>> PowerShell script that you can use to check if accelerated networking and receive side scaling is disabled and set it to enabled on all Azure VMs in a subscription
# Login to Azure
Connect-AzAccount


# Select the subscription
$subscriptionId = "your_subscription_id"
Set-AzContext -SubscriptionId $subscriptionId

# Get all the VMs in the subscription
$vms = Get-AzVM

# Set the resource group name
$resourceGroupName = "your_resource_group_name"

# Get all the VMs 
n the resource group
$vms = Get-AzVM -ResourceGroupName $resourceGroupName

foreach ($vm in $vms) {
    # Check if accelerated networking is disabled
    $accelNet = Get-AzNetworkInterface -ResourceId $vm.NetworkProfile.NetworkInterfaces[0].Id
    if ($accelNet.EnableAcceleratedNetworking -eq $false) {
        Write-Output "Accelerated networking is disabled for $($vm.Name). Enabling accelerated networking..."
        Set-AzNetworkInterface -ResourceId $accelNet.Id -EnableAcceleratedNetworking $true
    }
<!-- 
    # Check if receive side scaling is disabled
    $rss = Get-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -Status | Select-Object -ExpandProperty VmAgent | Select-Object -ExpandProperty Statuses | Where-Object { $_.Code -eq "ProvisioningState/succeeded" } | Select-Object -ExpandProperty DisplayStatus
    if ($rss -notlike "*RssEnabled=True*") {
        Write-Output "Receive side scaling is disabled for $($vm.Name). Enabling receive side scaling..."
        Set-AzVM -ResourceGroupName $vm.ResourceGroupName -Name $vm.Name -CustomData "<powershell><script>Set-NetAdapterAdvancedProperty -Name '*' -DisplayName 'Receive Side Scaling' -DisplayValue 'Enabled'</script></powershell>"
    }
}

 -->
 Write-Output "Accelerated networking and receive side scaling has been enabled on all VMs."



 


---

>> Azure CLI to export the resource group, VM size, accelerated networking, and RSS for all VMs in your subscription using the following steps.

This command uses the az vm list command with the --query parameter to select the information that you want to export. The [] brackets indicate that you want to select information for all VMs in your subscription. The {}.() brackets specify the information that you want to select for each VM. The --output table parameter formats the output as a table.

The information that is exported includes the resource group name, VM name, VM size, whether accelerated networking is enabled or not, and the size of the OS disk in GB.

Note that this command may take some time to complete if you have a large number of VMs in your subscription.

Open a terminal or command prompt.
Install the Azure CLI if you haven't already done so. You can find instructions on how to do this at https://docs.microsoft.com/en-us/cli/azure/install-azure-cli.

Login to your Azure account using the following command:
	az login

Set the subscription that you want to use:
sql
	az account set --subscription <subscription_id>
Replace <subscription_id> with the ID of the subscription that you want to use.

Run the following command to export the information for all VMs in your subscription:

css
	az vm list --query "[].{ResourceGroup:resourceGroup, VMName:name, VMSize:hardwareProfile.vmSize, AcceleratedNetworking:networkProfile.networkInterface.acceleratedNetworkingEnabled, RSS:storageProfile.osDisk.diskSizeGb}" --output table

	az vm list --query "[].{ResourceGroup:resourceGroup, VMName:name, VMSize:hardwareProfile.vmSize, AcceleratedNetworking:networkProfile.networkInterface.acceleratedNetworkingEnabled, RSS:storageProfile.osDisk.diskSizeGb}" --output table

>> Export the resource groups, VM size, accelerated networking, and RSS for all VMs in your Azure subscription to a CSV file, you can use the following Azure CLI command
This command uses the az vm list command with the --query parameter to select the information that you want to export. The [] brackets indicate that you want to select information for all VMs in your subscription. The {}.() brackets specify the information that you want to select for each VM. The --output csv parameter formats the output as a CSV file.

The > symbol redirects the output to a file named vms.csv.

After running this command, you should have a CSV file named vms.csv that contains the resource group name, VM name, VM size, whether accelerated networking is enabled or not, and the size of the OS disk in GB for all VMs in your Azure subscription.

---
	az vm list --query "[].{ResourceGroup:resourceGroup, VMName:name, VMSize:hardwareProfile.vmSize, AcceleratedNetworking:networkProfile.networkInterface.acceleratedNetworkingEnabled, RSS:storageProfile.osDisk.diskSizeGb}" --output csv > vms.csv

---
>> export the resource group, VM size, accelerated networking, and receive side scaling (RSS) for all VMs in your Azure subscription, you can use the following Azure CLI command
This command uses the az vm list command with the --query parameter to select the information that you want to export. The [] brackets indicate that you want to select information for all VMs in your subscription. The {}.() brackets specify the information that you want to select for each VM.

The RSS:properties.networkProfile.networkInterfaceConfigurations[].properties.receiveScaleEnabled parameter specifies the RSS information. Note that RSS is enabled at the network interface level, so we use the networkInterfaceConfigurations property to access this information.

The --output table parameter formats the output as a table.

After running this command, you should see a table that lists the resource group name, VM name, VM size, whether accelerated networking is enabled or not, and whether RSS is enabled or not for all VMs in your Azure subscription.

	az vm list --query "[].{ResourceGroup:resourceGroup, VMName:name, VMSize:hardwareProfile.vmSize, AcceleratedNetworking:networkProfile.networkInterface.acceleratedNetworkingEnabled, RSS:properties.networkProfile.networkInterfaceConfigurations[].properties.receiveScaleEnabled}" --output table

	az vm list --query "[].{ResourceGroup:resourceGroup, VMName:name, VMSize:hardwareProfile.vmSize, AcceleratedNetworking:networkProfile.networkInterface.acceleratedNetworkingEnabled, RSS:properties.networkProfile.networkInterfaceConfigurations[].properties.receiveScaleEnabled}" --output csv > vms.csv

>> Azure PowerShell command to export resource group, VM size, accelerated networking, and RSS for all VMs in the subscription.
Replace <Subscription ID> with the ID of the subscription you want to export the data for, and <File path and name> with the path and name of the CSV file where you want to export the data. This command connects to the specified subscription, gets all the resource groups in the subscription, and then gets all the VMs in each resource group.

For each VM, the command retrieves the VM size, whether accelerated networking is enabled or not, and whether RSS is enabled or not. It then creates a custom object with these properties and adds it to an array. Finally, the command exports the array to a CSV file.
---
bash

$subscriptionId = "<Subscription ID>"
Connect-AzAccount
Select-AzSubscription -SubscriptionId $subscriptionId

$vmData = @()
Get-AzResourceGroup | ForEach-Object {
    $rgName = $_.ResourceGroupName
    Get-AzVM -ResourceGroupName $rgName | ForEach-Object {
        $vmName = $_.Name
        $vmSize = $_.HardwareProfile.VmSize
        $acceleratedNetworking = $_.NetworkProfile.NetworkInterfaces[0].EnableAcceleratedNetworking
        $rssEnabled = $_.GuestDiagnosticSettings.DiagnosticsSettings | Where-Object {$_.MetricName -eq "Percentage CPU"} | Select-Object -ExpandProperty MetricResourceId -Unique | ForEach-Object {(Get-AzResource -ResourceId $_).Properties.Diagnostics.Value[0].VMDiagnostics.Value[0].Enabled}

        $vmData += [PSCustomObject]@{
            ResourceGroup = $rgName
            VMName = $vmName
            VMSize = $vmSize
            AcceleratedNetworking = $acceleratedNetworking
            RSSEnabled = $rssEnabled
        }
    }
}

$vmData | Export-Csv -Path "<File path and name>" -NoTypeInformation

---

>> Azure PowerShell script that can export VM size, resource group, accelerated networking, and RSS for all VMs in a subscription.
To use this script, replace <SubscriptionId> with the ID of the subscription you want to query. Then, save the script as a .ps1 file and run it in PowerShell. The script will output the VM information to a CSV file located at C:\VMInfo.csv.
---
powershell
# Login to Azure
Connect-AzAccount

# Set the subscription
Set-AzContext -SubscriptionId <SubscriptionId>

# Create an array to store the VMs
$vms = @()

# Get all the resource groups
$resourceGroups = Get-AzResourceGroup

# Loop through the resource groups
foreach ($resourceGroup in $resourceGroups) {

    # Get all the VMs in the resource group
    $vmsInRG = Get-AzVM -ResourceGroupName $resourceGroup.ResourceGroupName

    # Loop through the VMs
    foreach ($vm in $vmsInRG) {

        # Create an object to store the VM information
        $vmObject = New-Object -TypeName PSObject
        $vmObject | Add-Member -MemberType NoteProperty -Name "VM Name" -Value $vm.Name
        $vmObject | Add-Member -MemberType NoteProperty -Name "Resource Group" -Value $resourceGroup.ResourceGroupName
        $vmObject | Add-Member -MemberType NoteProperty -Name "VM Size" -Value $vm.HardwareProfile.VmSize

        # Check if Accelerated Networking is enabled
        if ($vm.NetworkProfile.NetworkInterfaces[0].EnableAcceleratedNetworking) {
            $vmObject | Add-Member -MemberType NoteProperty -Name "Accelerated Networking" -Value "Enabled"
        } else {
            $vmObject | Add-Member -MemberType NoteProperty -Name "Accelerated Networking" -Value "Disabled"
        }

        # Check if RSS is enabled
        if ($vm.HardwareProfile.RssEnabled) {
            $vmObject | Add-Member -MemberType NoteProperty -Name "RSS" -Value "Enabled"
        } else {
            $vmObject | Add-Member -MemberType NoteProperty -Name "RSS" -Value "Disabled"
        }

        # Add the VM object to the array
        $vms += $vmObject
    }
}

# Export the VM information to a CSV file
$vms | Export-Csv -Path "C:\VMInfo.csv" -NoTypeInformation
---

# Login to Azure
Connect-AzAccount

# Set variables
$csvPath = "C:\vm-info.csv"

# Get all VMs in the subscription
$vms = Get-AzVM

# Initialize an array to hold the VM information
$vmInfo = @()

# Loop through each VM and gather the required information
foreach ($vm in $vms) {
    $acceleratedNetwork = "Disabled"
    $rssEnabled = "Disabled"

    # Check if the VM has Accelerated Networking enabled
    $nic = Get-AzNetworkInterface -ResourceId $vm.NetworkProfile.NetworkInterfaces[0].Id
    if ($nic.EnableAcceleratedNetworking) {
        $acceleratedNetwork = "Enabled"
    }

    # Check if Receive Side Scaling (RSS) is enabled on the VM's network interface
    $rssEnabled = (Get-NetAdapterAdvancedProperty -Name "vEthernet ($($nic.Name))" -RegistryKeyword "*RSS*").DisplayValue

    # Add the VM information to the array
    $vmInfo += [PSCustomObject]@{
        "Resource Group" = $vm.ResourceGroupName
        "VM Name" = $vm.Name
        "VM Size" = $vm.HardwareProfile.VmSize
        "Accelerated Networking" = $acceleratedNetwork
        "Receive Side Scaling" = $rssEnabled
    }
}

# Export the VM information to a CSV file
$vmInfo | Export-Csv -Path $csvPath -NoTypeInformation



##########################

>> Enable accelerated networking and RSS (Receive Side Scaling) on an Azure VM, you can follow the below steps:

	Select the Azure VM you want to enable Accelerated Networking and RSS for.
	Stop the VM to make changes.
	Go to the "Networking" tab and select "Accelerated Networking".
	Enable Accelerated Networking and select "Save".
	Start the VM once again.
	Log in to the VM and open PowerShell or Command Prompt with administrative privileges.
	Type the following command to check if RSS is enabled: Get-NetAdapterRss
	If RSS is not enabled, type the following command to enable it: Set-NetAdapterRss -Name <adaptername> -Enabled $true

Note: Replace <adaptername> with the name of the adapter you want to enable RSS for.

  Restart the VM for the changes to take effect.

By enabling Accelerated Networking and RSS, you can improve the network performance and scalability of your Azure VM, allowing you to handle larger workloads and data-intensive applications.
hsidhu.mawah@simplelogin.com
create plan to enable accelerated network and rss azure vm using powershell script

>> PowerShell script to enable Accelerated Networking and RSS on an Azure VM.
Note: Replace "YourVMName" and "YourResourceGroupName" with your Azure VM's name and resource group name.
Save this script as a .ps1 file and run it in PowerShell with administrative privileges. The script will enable Accelerated Networking and RSS on the specified Azure VM and restart the VM for the changes to take effect.
---
bash

# Set the variables for the Azure VM name and the Resource Group it belongs to
$vmName = "YourVMName"
$resourceGroupName = "YourResourceGroupName"

# Get the VM object
$vm = Get-AzVM -Name $vmName -ResourceGroupName $resourceGroupName

# Enable Accelerated Networking on the NIC
Set-AzVMNetworkInterface -VM $vm -Id $vm.NetworkProfile.NetworkInterfaces[0].Id -AcceleratedNetworkingEnabled $true

# Enable RSS on the NIC
Set-NetAdapterRss -Name "vEthernet ($($vm.Name))" -Enabled $true

# Restart the VM
Restart-AzVM -Name $vmName -ResourceGroupName $resourceGroupName

---

>> PowerShell script to enable Accelerated Networking and RSS on an Azure VM:
Note: Replace "YourVMName" and "YourResourceGroupName" with your Azure VM's name and resource group name.
Save this script as a .ps1 file and run it in PowerShell with administrative privileges. The script will enable Accelerated Networking and RSS on the specified Azure VM and restart the VM for the changes to take effect.
---
bash

# Set the variables for the Azure VM name and the Resource Group it belongs to
$vmName = "YourVMName"
$resourceGroupName = "YourResourceGroupName"

# Get the VM object
$vm = Get-AzVM -Name $vmName -ResourceGroupName $resourceGroupName

# Enable Accelerated Networking on the NIC
Set-AzVMNetworkInterface -VM $vm -Id $vm.NetworkProfile.NetworkInterfaces[0].Id -AcceleratedNetworkingEnabled $true

# Enable RSS on the NIC
Set-NetAdapterRss -Name "vEthernet ($($vm.Name))" -Enabled $true

# Restart the VM
Restart-AzVM -Name $vmName -ResourceGroupName $resourceGroupName

>> PowerShell script to enable Accelerated Networking and RSS on all Azure VMs in a subscription:
Note: Replace "YourSubscriptionID" and "YourResourceGroupNamePrefix" with your subscription ID and the prefix of the Resource Group names you want to enable Accelerated Networking and RSS for.

Save this script as a .ps1 file and run it in PowerShell with administrative privileges. The script will enable Accelerated Networking and RSS on all Azure VMs that belong to Resource Groups with the specified prefix and restart the VMs for the changes to take effect.
---
perl

# Set the variables for the subscription ID and the Resource Group name prefix
$subscriptionId = "YourSubscriptionID"
$resourceGroupNamePrefix = "YourResourceGroupNamePrefix"

# Authenticate to Azure using your credentials
Connect-AzAccount

# Select the subscription to work with
Set-AzContext -SubscriptionId $subscriptionId

# Get all the VMs in the subscription
$vms = Get-AzVM

# Loop through all the VMs and enable Accelerated Networking and RSS
foreach ($vm in $vms) {
    # Check if the VM's Resource Group name starts with the specified prefix
    if ($vm.ResourceGroupName.StartsWith($resourceGroupNamePrefix)) {
        Write-Host "Enabling Accelerated Networking and RSS for VM $($vm.Name) in Resource Group $($vm.ResourceGroupName)..."
        
        # Enable Accelerated Networking on the NIC
        Set-AzVMNetworkInterface -VM $vm -Id $vm.NetworkProfile.NetworkInterfaces[0].Id -AcceleratedNetworkingEnabled $true

        # Enable RSS on the NIC
        Set-NetAdapterRss -Name "vEthernet ($($vm.Name))" -Enabled $true

        # Restart the VM
        Restart-AzVM -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName
    }
}

Write-Host "Accelerated Networking and RSS has been enabled on all VMs with Resource Group name prefix $($resourceGroupNamePrefix) in subscription $($subscriptionId)."

---


#########################################################






