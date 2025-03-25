########################################################################################################
Microsoft Azure Storage Account Keys Rotation
Midnight Blizzard: Microsoft Azure Storage Account Keys Rotation
GISG Regional Security Delivery Team Advisory | 

########################################################################################################



Tenant: KPMG
Subscriptions:
  ASPAC-RDC-SUB-CH-PlatformServices
  GO-M-ASPAC IBS02
  GO-M-ASPAC IBS03
Tenant: GOAZR
Subscriptions:
  GO-M-ASPAC IBS01
  GO-M-ASPAC RDCMS01

The business has identified the subset of Storage accounts into batches
Batch 1 - SAs identified by business
Batch 2 - SAs identified by business
Batch 3 - Unknown Requestors - this require validation from T2/T3 team


### Azure Storage Account Key Rotation Plan
 
##### Follow the steps for Batch 1 & 2 #####
 
## 1. Storage Account Assessment
-- Compile the list all impacted storage accounts
    - SA names have been provided by business
-- Identify any critical accounts from the list
-- Document dependencies for each account (applications, services, etc.)
-- Communicate plan and dates to business and get an agreement - Philip/Alvin
 
## 2. Implementation Strategy
-- Determine SA key rotation implementation process - manual or automated
-- Assign implementation responsibility (T2 or T3 team)
-- Initiate service request - Change Request or Service Request
-- Communicate to business - Philip/Alvin
 
## 3. Backout Plan
-- Maintain a record of the original keys before rotation
-- If issues arise post-rotation:
    a. Revert applications to use the original key
    b. Regenerate the rotated key to its original value (if possible)
 
## 4. Test and Verify
-- Determine validation process - manual or automated
-- Assign implementation responsibility (T2 or T3 team)
-- Communicate to business - Philip/Alvin
 
##### Follow the steps for Batch 3, Storage Accounts with Unknown Requestors #####
 
## 1. Storage Account Assessment
-- Compile the list all impacted storage accounts
    - SA names have been provided by business
-- Document dependencies for each account (applications, services, etc.), also i.e. owner, business/application using, impact
-- Communicate information to business - Philip/Alvin
-- Get agreement of implementation plan/date
-- Follow Step 2 to 4








////////////////////////////////////////////////////////////////////////

### Manual Process
1. Access Azure Portal
2. Navigate to the specific storage account
3. Go to "Access keys" under Settings
4. Regenerate the inactive key
5. Update applications with the new key
6. Verify functionality
7. Regenerate the previously active key

### Automated Script (PowerShell)

```powershell
# PowerShell Script for Azure Storage Account Key Rotation

param(
    [Parameter(Mandatory=$true)]
    [string]$ResourceGroup,
    
    [Parameter(Mandatory=$true)]
    [string]$StorageAccount
)

# Connect to Azure (if not already connected)
Connect-AzAccount

# Get current keys
Write-Host "Retrieving current keys..."
$keys = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroup -Name $StorageAccount

# Determine which key to rotate
$currentKey = $keys[0].KeyName
$keyToRotate = if ($currentKey -eq "key1") { "key2" } else { "key1" }

# Regenerate the key
Write-Host "Regenerating $keyToRotate..."
$newKey = New-AzStorageAccountKey -ResourceGroupName $ResourceGroup -Name $StorageAccount -KeyName $keyToRotate

# Display the new key
Write-Host "New key generated successfully. Update your applications with the new key."
Write-Host "New $keyToRotate value: $($newKey.Keys[0].Value)"

