Write-Host "So far so good ...."

# Count total subscriptions
$countSubscriptions = 0

# Count total Virtual Machines
$totalVMs = 0

# Create a new empty CSV
$csvOutput = @()

# Define the list of tenants
$tenants = @(
    # Define the first tenant details here
    @{
        TenantName = "Tenant1Name"
        TenantId = "Tenant1Id"
        Environment = "Tenant1Environment"
        Username = "Tenant1Username"
        KeyVaultName = "Tenant1KeyVaultName"
        PasswordSecretName = "Tenant1PasswordSecretName"
    },
    # Define the second tenant details here
    @{
        TenantName = "Tenant2Name"
        TenantId = "Tenant2Id"
        Environment = "Tenant2Environment"
        Username = "Tenant2Username"
        KeyVaultName = "Tenant2KeyVaultName"
        PasswordSecretName = "Tenant2PasswordSecretName"
    },
    # Define the third tenant details here
    @{
        TenantName = "Tenant3Name"
        TenantId = "Tenant3Id"
        Environment = "Tenant3Environment"
        Username = "Tenant3Username"
        KeyVaultName = "Tenant3KeyVaultName"
        PasswordSecretName = "Tenant3PasswordSecretName"
    }
)

Write-Host "Importing PS Module ...."
# Import the Azure PowerShell module
Import-Module Az

Write-Host "Iterating Tenant loop ...."
foreach ($tenant in $tenants) {
    $tenantName = $tenant.TenantName
	  $tenantId = $tenant.TenantId
	  $env = $tenant.Environment
    $username = $tenant.Username
    $keyVaultName = $tenant.KeyVaultName
    $passwordSecretName = $tenant.PasswordSecretName

    # Create a PSCredential object with the username and fetched password
    Write-Host "Fetching Credentials ...."
    $password = ConvertTo-SecureString $passwordSecretName -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential ($username, $password)

    # Connect to the Azure tenant using the PSCredential
    Write-Host "Connecting to tenant ...."
    Connect-AzAccount -Tenant $tenantId -Credential $credential -Environment $env

    # Get a list of all subscriptions in the tenant
    $subscriptions = Get-AzSubscription
    Write-Host "Total subscriptions in $tenantName: $($subscriptions.Count)"
    
    # Increment total subscriptions counter
    $countSubscriptions += $subscriptions.Count

    Write-Host "Subscription looping ...."

    foreach ($subscription in $subscriptions) {
        $subscriptionId = $subscription.Id

		# Check if the subscription is enabled or disabled
		if ($subscription.State -ne 'Enabled') {
			Write-Host "Skipping disabled subscription $subscriptionId"
			continue  
		}

	    # Set the Azure context to the current subscription
        Write-Host "Set AzContext ...."
        Set-AzContext -Subscription $subscriptionId

        # Switch to the current subscription
        Write-Host "Switching to subscription $subscriptionId"
        Select-AzSubscription -SubscriptionId $subscriptionId | Out-Null

        # Perform tasks for the current subscription
		Write-Host "Getting VM List ...."
		$daysToCheck = 2
		$vmList = Get-AzVM | Where-Object {
            $_.TimeCreated -ge (Get-Date).AddDays(-$daysToCheck) -and
            $_.ResourceGroupName -notlike "*DATABRICKS*" 
        }

		if ($vmList.Count -gt 0) {
            Write-Host "New Virtual Machines found in Subscription $subscriptionId in the last $daysToCheck days."

            # Increment total Virtual Machines counter
            $totalVMs += $vmList.Count

            # Save the current warning preference
            $oldWarningPreference = $WarningPreference

            # Set warning preference to SilentlyContinue to ignore warning messages
            $WarningPreference = "SilentlyContinue"

            foreach ($vm in $vmList) {
                # Add each VM as a row to the CSV output
                $tagsValidation = $null

                # Check if all required tags are present
                if (
                    $vm.Tags.Environment -and
                    $vm.Tags.Charge_Code -and
                    $vm.Tags.Ticket_Number -and
                    $vm.Tags.Desired_MS_VM_SLA -and
                    ($vm.Tags.Business_Service -or $vm.Tags.Application_Service)
                ) {
                    $tagsValidation = 'Tags_Compliant'
                } else {
                    $tagsValidation = 'Tags_NonCompliant'
                }
                $csvOutput += [PSCustomObject]@{
                    Name = $vm.Name
                    ResourceGroupName = $vm.ResourceGroupName
                    SubscriptionName = (Get-AzContext).Subscription.Name
                    TenantName = $tenantName
                    Location = $vm.Location
                    TimeCreated = $vm.TimeCreated
                    SubscriptionId = (Get-AzContext).Subscription.Id
                    TenantId = (Get-AzContext).Tenant.Id
                    VmId = $vm.VmId
                    ProvisioningState = $vm.ProvisioningState
                    Tags_Environment = $vm.Tags.Environment
                    Tags_Charge_Code = $vm.Tags.Charge_Code
                    Tags_Business_Service = $vm.Tags.Business_Service
                    Tags_Application_Service = $vm.Tags.Application_Service
                    Tags_Application_ID = $vm.Tags.Application_ID
                    Tags_Ticket_Number = $vm.Tags.Ticket_Number
                    Tags_DesiredMSVMSLA = $vm.Tags.DesiredMSVMSLA
                    Tags_Validation = $tagsValidation
                    Tags_All = ($vm.Tags.GetEnumerator() | ForEach-Object { "$($_.Key):$($_.Value)" }) -join '; '
                    Environment = $env
                }
            }
            # Restore the original warning preference
            $WarningPreference = $oldWarningPreference
        }
    }

	Write-Host "Disconnecting AzAccount $tenantName ...."
	Disconnect-AzAccount
}

Write-Host "The sleep command executing for 15 seconds ...."
sleep 15

$dateFormat = Get-Date -UFormat "%d/%m/%Y %R"
$dateEnd = Get-Date 
$dateEndUTC = $dateEnd.ToUniversalTime()
$dateEndUTCStr = $dateEndUTC.ToString('dd-MM-yyyy-HH-mm')
Write-Host "Script Ended at $dateEndUTC UTC ...."

$outputPath = "$pwd\output\Delta_$dateEndUTCStr.csv"
Write-Host "The output path $outputPath ...."

Write-Output $csvOutput | Export-Csv -Path $outputPath -NoTypeInformation 
Write-Host "Total number of Subscriptions analysed: $countSubscriptions"
Write-Host "Total number of Virtual Machines analysed: $totalVMs"
