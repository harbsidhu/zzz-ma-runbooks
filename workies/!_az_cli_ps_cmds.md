##########################################################################
Azure CLI and Powershell Commands

##########################################################################
## Linux

Tenant: GO-AzrManagement

Subscription: GO-M-Core Services AMR
Resource Group: AMR_PRD_OPPREPORT001
Location: East US

Virtual network/subnet: Group-GOAZRVNET0001-GOAZRVNET0001/GOSNMgtI0050

Computer name: go2pazrapp015.go2.kworld.kpmg.com
Private IP address: 10.180.12.43
Operating system: Linux (redhat 8.8)


Computer name: go2pazrapp016.go2.kworld.kpmg.com
Private IP address: 10.180.12.44
Operating system: Linux (redhat 8.8)

NAME="Red Hat Enterprise Linux"
VERSION="8.8 (Ootpa)"
ID="rhel"
ID_LIKE="fedora"
VERSION_ID="8.8"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Red Hat Enterprise Linux 8.8 (Ootpa)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:8::baseos"
HOME_URL="https://www.redhat.com/"
DOCUMENTATION_URL="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8"
BUG_REPORT_URL="https://bugzilla.redhat.com/"

REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 8"
REDHAT_BUGZILLA_PRODUCT_VERSION=8.8
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="8.8"
Red Hat Enterprise Linux release 8.8 (Ootpa)
Red Hat Enterprise Linux release 8.8 


https://www.freecodecamp.org/news/the-linux-commands-handbook/
https://www.freecodecamp.org/news/file-ownership-permissions-rhel/
https://www.freecodecamp.org/news/linux-chmod-chown-change-file-permissions/

yum clean all
sudo yum install nc
rpm -qa | grep -i nmap-ncat
sudo yum install telnet
rpm -qa | grep -i telnet
sudo du -a /home | sort -n -r | head -n 10

echo "$http_proxy" >> http://10.180.8.4:8080
echo "$https_proxy" >> http://10.180.8.4:8080

whomami
wh -u

pwsh

$PSVersionTable

users
cat /usr/share/doc/setup*/uidgid
id go2-hsidhu2
groups
groups go2-hsidhu2
getent passwd go2-hsidhu2
grep -i go2-hsidhu2 /etc/passwd

ssh -l roaima@domain.local remotehost
ssh -l go2-hsidhu2@go2.kworld.kpmg.com   <IP address>

/go2-hsidhu2@go2.kworld.kpmg.com

id -Gn
id -Gn userName
id -Gn go2-hsidhu2

groups
groups go2-hsidhu2
grep -w go2-hsidhu2 /etc/group
getent group go2-hsidhu2

netstat -tulpn

systemctl
systemctl | more
systemctl | grep httpd
systemctl list-units --type service
systemctl list-units --type mount
sudo systemctl list-units --type=service
sudo systemct | egerep 'httpd|php-fpm|mysqld|nginx'
sudo systemctl list-units --type=service | grep nginx
To list all services:
systemctl list-unit-files
systemctl list-dependencies {service-name}

systemctl status sshd.service
systemctl is-active sshd
systemctl is-enabled sshd


[go2-hsidhu2@go2pazrapp016 ~]$ users
go2-hsidhu2 go2-szhang136
[go2-hsidhu2@go2pazrapp016 ~]$ groups
domain users go2-sg go2azrwts009 - access go2-sg ad delegation - local server administration gdcazr go2-sg its global platform operations ce hosting tier 3 go2-sg gdcazr-de local server administration go2-sg gdcazr-uk local server administration go2-sg go2orchapp0055 - admin go2-sg go2pazrapp015 - access go2-sg go2pazrapp015 - admins go2-sg go2pazrapp016 - access go2-sg go2pazrapp016 - admins go2-sg go2pazrapp017 - admins
[go2-hsidhu2@go2pazrapp016 ~]$  groups go2-hsidhu2
go2-hsidhu2 : domain users go2-sg its global platform operations ce hosting tier 3 go2-sg go2pazrapp015 - admins go2-sg go2pazrapp016 - admins go2-sg ad delegation - local server administration gdcazr go2-sg gdcazr-de local server administration go2-sg go2pazrapp016 - access go2-sg gdcazr-uk local server administration go2-sg go2orchapp0055 - admin go2-sg go2pazrapp017 - admins go2-sg go2pazrapp015 - access go2-sg go2azrwts009 - access
[go2-hsidhu2@go2pazrapp016 ~]$



# Export Scheduled Tasks
schtasks /query /FO CSV /V >F:\tasksoutput.csv

## Azure CLI

Get-AzVm -ResourceGroupName "rg-sh1m-hub-se-001" -Name "PentestServer"
Remove-AzVM -ResourceGroupName "rg-sh1m-hub-se-001" -Name "PentestServer"

Remove-AzResourceGroup -Name rg-td1m-dar -Force
Get-AzResourceGroup -Name "rg-td1m-dar" | Remove-AzResourceGroup -Force

Get-AzPublicIpAddress | Where-Object IpAddress -eq 'ipAddress'
Get-AzPublicIpAddress | Where-Object IpAddress -eq 'ipAddress'

>> Create Resource Group
New-AzResourceGroupDeployment `
  -Name demoRGDeployment `
  -ResourceGroupName rg-hsidhu2-sbx-accelnet-rss `
  -TemplateUri https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json `
  -storageAccountType Standard_LRS



### Powershell
>> Add Environment Variables to Profile:
  code %PROFILE
  # Set Personal Access Token (PAT) for Azure DevOps
  $env:PAT = "your-pat-token"
  # Set Azure Usernamme and Password 
  $env:AZURE_USERNAME = "your-username-here"
  $env:AZURE_PASSWORD = "your-password-here"
>> Reload Profile
  . %PROFILE
>> Check ENV variables
  echo $env:AZURE_USERNAME


Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime

Install-Module -Name PowerShellGet -Force -Scope CurrentUser

$PSVersionTable.PSVersiondir 
Connect-AzAccount
Connect-AzAccount -UseDeviceAuthentication
Get-Azcontext 
Get-Azcontext -ListAvailable
Set-AzContext -SubscriptionName 'ITSS Enterprise (h1) - Primary Hub' 
Set-AzContext -SubscriptionName '<Subscription Name>'

az vm list-skus `
  --location westus `
  --all true `
  --resource-type virtualMachines `
  --query '[].{size:size, name:name, acceleratedNetworkingEnabled: capabilities[?name==`AcceleratedNetworkingEnabled`].value | [0]}' `
  --output table | Export-Csv -Path vm-skus-list-accelnet.csv

>>> Proxy
https://social.technet.microsoft.com/wiki/contents/articles/53831.enable-disable-proxy-settings-via-powershell.aspx
http://woshub.com/using-powershell-behind-a-proxy/
https://docs.microsoft.com/en-us/windows-server/networking/technologies/netsh/netsh-contexts
Use netsh to configure a system-wide static proxy.
Invoke-WebRequest http://woshub.com
netsh winhttp show proxy
netsh winhttp set proxy "172.20.4.200:8080"
netsh winhttp set proxy "http://awsproxy:8080"
netsh winhttp set proxy "http://proxy-aws.melb.ad:3128"
netsh winhttp set proxy "http://proxy-aws:3128"
netsh winhttp set proxy http://proxy-aws.poc.local:3128
netsh winhttp import proxy source=ie

Set-ItemProperty -path "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ProxyServer -value http://proxy-aws.melb.ad:3128



Domain Account -- Active Directory Kerberos, or NTLM authentication
$Wcl = new-object System.Net.WebClient
$Wcl.Headers.Add(“user-agent”, “PowerShell Script”)
$Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

Manual Authentication
$Wcl=New-Object System.Net.WebClient
$Creds=Get-Credential
$Wcl.Proxy.Credentials=$Creds

get-content C:\Windows\System32\Drivers\etc\hosts
ipconfig /flushdns
ping your_domain_name.com
tracert your_domain_name.com
Resolve-DNSName theitbros.com
nltest /dsgetdc:theitbros.com

runas /netonly /user:a-sidhh1@melb.ad "mmc %SystemRoot%\system32\dsa.msc"

Firewll ports for Joining Domain
https://aventistech.com/2020/02/20/firewall-ports-required-to-join-ad-domain/

TCP 88 (Kerberos Key Distribution Center)
TCP 135 (Remote Procedure Call)
TCP 139 (NetBIOS Session Service)
TCP 389 (LDAP)
TCP 445 (SMB,Net Logon)
UDP 53 (DNS)
UDP 389 (LDAP, DC Locator, Net Logon)
TCP 49152-65535 (Randomly allocated high TCP ports)

Add-Computer -domainname <domain> -cred <domain\administrator> -Passthru -OUPath "OU=<OU Here>”
Add-Computer -domainname melb.ad -cred <domain\administrator> -Passthru -OUPath "OU=OU=2016,OU=WindowsServers,OU=AWS,DC=melb,DC=ad”
Add-Computer -domainname melb.ad -cred melb.ad\a-sidhh1 -Passthru -OUPath "OU=OU=2016,OU=WindowsServers,OU=AWS,DC=melb,DC=ad”

Test-DnsServer -IPAddress 10.123.183.155
Test-DnsServer -IPAddress 10.123.183.155 -Context Forwarder
Get-DnsClientServerAddress
Get-DnsClientServerAddress -InterfaceAlias "Wired Ethernet Connection"
Get-DnsClientServerAddress -InterfaceIndex 9
Resolve-DnsName -Name gmail.com
Get-NetAdapter | Select-Object InterfaceAlias , InterfaceIndex
Get-DnsClientServerAddress -InterfaceIndex 9  ((9 is indexof network adapter))
Get-DnsClientServerAddress -InterfaceAlias "Ethernet 2"
Set-DnsClientServerAddress -InterfaceIndex 9 -ServerAddresses ("8.8.8.8","1.1.1.1")
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses ("10.41.8.117","10.41.12.117")

Test-NetConnection
Test-NetConnection -Port 80 -InformationLevel "Detailed"
Test-NetConnection -InformationLevel "Detailed"
Test-NetConnection -ComputerName www.contoso.com -DiagnoseRouting -InformationLevel Detailed
Test-NetConnection -ComputerName "wpwinf2402"
Test-NetConnection stuxcna105.cwydp1ivjbm4.ap-southeast-2.rds.amazonaws.com -Port 1521

>>> Uptime
Get-CimInstance -ClassName Win32_OperatingSystem | Select LastBootUpTime
(Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime

>>> For Domain Creds
$Wcl = new-object System.Net.WebClient
$Wcl.Headers.Add(“user-agent”, “PowerShell Script”)
$Wcl.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | findstr ProxyServer
Get-Item "HKLM:\SYSTEM\CurrentControlSet\Services\AmazonSSMAgent"

Get-Service -ServiceName "CbDefense" | Restart-Service

Remove-ItemProperty -Path "HKU:\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyEnable"

Get-PSDrive -PSProvider Registry
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
Get-Item -Path "HKU:\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyEnable"
Get-Item -Path "HKU:\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyServer"
Get-Item -Path "HKU:\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyOverride"


Get-Item -Path "HKU:\.Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyEnable"
Get-Item -Path "HKU:\.Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyServer"
Get-Item -Path "HKU:\.Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyOverride"

Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyEnable"
Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyServer"
Get-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" | Remove-ItemProperty -Name "ProxyOverride"

HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings
HKLM:\Software\Microsoft\Windows\CurrentVersion\Internet Settings
HKU:\.Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings
HKU:\S-1-5-18\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyEnable" -Value 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyServer" -Value "proxy-aws:3128"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "ProxyEnable" -Value "169.254.169.254,127.0.0.1,localhost,10.41.*.*"

Get-Service -ServiceName "BESClient" | Stop-Service
Set-Service -ServiceName "BESClient" -StartupType disabled

Get-Service | Select-Object -Property Name,Status,StartType | where-object {$_.Name -eq "BESClient"} | Format-Table -auto
Get-Service | Select-Object -Property Name,DisplayName,Status,StartType | where-object {$_.Name -eq "BESClient"} | Format-Table -auto

Copy-Item -Path "C:\Logfiles\*" -Destination "C:\Drawings" -Recurse

Get-WmiObject -Namespace root\cimv2 -Class Win32_ComputerSystem | Select Name, Domain

Add-Computer -DomainName tstmelb.ad -Credential tstmelb.ad\a-zolla1  -Restart

systeminfo | findstr /B "Domain"

>>> Replace text
$Content = Get-Content C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml
$Content.replace(‘proxy-aws:3128’,’awsproxy:8080’) | Set-Content C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml

$Content = Get-Content C:\Program Files\SplunkUniversalForwarder\etc\system\local\server.conf
$Content.replace(‘old-name’,’new-name’) | Set-Content C:\Program Files\SplunkUniversalForwarder\etc\system\local\server.conf

$Content = Get-Content C:\Program Files\SplunkUniversalForwarder\etc\system\local\deploymentclient.conf
$Content.replace(‘old-name’,’new-name’) | Set-Content C:\ProgramData\Amazon\AmazonCloudWatchAgent\common-config.toml



## Commands

shadow copy

cmd as admin
vssadmin list shadowstorage
vssadmin list volume
vssadmin resize shadowstorage /for=F: /on=F: /maxsize=14GB
  vol shadow copy storage not found
vssadmin add shadowstorage /For=D: /On=E: /MaxSize=UNBOUNDED






























########################################################
WS-TAC DAR 
########################################################

>>>>> App registration
Create app registrations
Azure Active Directory > App registrations > 

app-t1m-dar-attunity > Certificates & secrets > Client secrets > New client secrets

  for-testing-only Q~MXoqCFppB8k76~XI6.Q1_.p1-_9uiR

01. Choose Azure Active Directory > App registrations
02. Filter with the <app-registrations>
03. Certificates & secrets > Client secrets > New client secrets
04. Add new client secrets using details
    Description - <app-registration-dateofcreation>
    Expires - 12 months
05. Email the "value" to the team
06. Update KeePass db

>>>>> PAM Accounts

AAD >> New Group >> ROL-PAM-azure-td2m-dar-deploy >>
  Group Type --  Security
  Group Name -- ROL-PAM-azure-td2m-dar-deploy
  Group Desc -- ROL-PAM-azure-td2m-dar-deploy
  Azure AD roles can be assigned to the group -- Yes
  Membership Type -- Assigned (auto)                      ""If above set to Yes""
  Owner -- Myself
  Members >> Add Member -- app-td2m-dar-devops-deploy     ""Membership in the xls""
  Roles -- None
  Create >> Yes

Search and Open group -- ROL-PAM-azure-td2m-dar-deploy
  Privilege access -- Enable
  Add Assignment --
    Resource -- ROL-PAM-azure-td2m-dar-deploy
    Resource Type -- Security
    Select Role -- Member
    Select member -- app-td2m-dar-devops-deploy
    Next >> Assign

I have another request.  We need the PAM privileged groups setup as well.  This will probably take 30mins or so.  
Create PAM for these eligibility groups 
e.g. ROL-PAM-azure-tp1m-dar-databricks-admin

ROL-PAM-azure-tp1m-dar-databricks-admin	  ROL-azure-tp1m-dar-databricks-admin
ROL-PAM-azure-tt1m-dar-databricks-admin	  ROL-azure-tt1m-dar-databricks-admin
ROL-PAM-azure-td1m-dar-databricks-admin	  ROL-azure-td1m-dar-databricks-admin
ROL-PAM-azure-tt2m-dar-databricks-admin	  ROL-azure-tt2m-dar-databricks-admin
ROL-PAM-azure-td2m-dar-databricks-admin	  ROL-azure-td2m-dar-databricks-admin
ROL-PAM-azure-tt3m-dar-databricks-admin	  ROL-azure-tt3m-dar-databricks-admin
ROL-PAM-azure-td3m-dar-databricks-admin	  ROL-azure-td3m-dar-databricks-admin
ROL-PAM-azure-tp1m-dar-sqldb-owner	      ROL-azure-tp1m-dar-sqldb-owner
ROL-PAM-azure-tt1m-dar-sqldb-owner	      ROL-azure-tt1m-dar-sqldb-owner
ROL-PAM-azure-td1m-dar-sqldb-owner	      ROL-azure-td1m-dar-sqldb-owner
ROL-PAM-azure-tt2m-dar-sqldb-owner	      ROL-azure-tt2m-dar-sqldb-owner
ROL-PAM-azure-td2m-dar-sqldb-owner	      ROL-azure-td2m-dar-sqldb-owner
ROL-PAM-azure-tt3m-dar-sqldb-owner	      ROL-azure-tt3m-dar-sqldb-owner
ROL-PAM-azure-td3m-dar-sqldb-owner	      ROL-azure-td3m-dar-sqldb-owner

## Error
    Applications are allowed for active assignments only.  

    Group creation partially succeeded
    Group ROL-PAM-azure-td2m-dar-deploy was successfully created, but some members or owners failed to be assigned to the group.

## Azure Databricks

Hi,

Need a little help to implement SCIM for Databricks.  What is the best way to get this done.  Is there a way I need to raise a ticket?

## SCIM for Databricks.

https://docs.microsoft.com/en-us/azure/databricks/administration-guide/users-groups/scim/aad#prerequisites

1.	In your Azure portal, go to Azure Active Directory > Enterprise Applications.
2.	Click + New Application above the application list.  Under Add from the gallery, search for and select Azure Databricks SCIM Provisioning Connector.
3.	Enter a Name for the application and click Add. 
sv-txxm-dar-dbw-xx-xxx-provisioning  (given the documentation is seems we may be able to have one scim for all of our Databricks instances).

4.	Under the Manage menu, click Provisioning.
5.	From the Provisioning Mode drop-down, select Automatic.
6.	Enter the Tenant URL:

TAC Configurations		
Enterprise Application	              Workspace URL	                                      Tenant URL
https://docs.microsoft.com/en-us/azure/databricks/administration-guide/users-groups/scim/aad#prerequisites

sv-td1m-dar-dbw-se-001-provisioning  	https://adb-4355979071653622.2.azuredatabricks.net	https://adb-4355979071653622.2/api/2.0/preview/scim	
sv-td2m-dar-dbw-se-001-provisioning  	https://adb-6993395579674358.18.azuredatabricks.net	https://adb-6993395579674358.18.azuredatabricks.net/api/2.0/preview/scim	
  
sv-tp1m-dar-dbw-ea-001-provisioning  	https://adb-3525739209363346.6.azuredatabricks.net	https://adb-3525739209363346.6/api/2.0/preview/scim	
sv-tp1m-dar-dbw-se-001-provisioning  	https://adb-6314656389691320.0.azuredatabricks.net	https://adb-6314656389691320.0/api/2.0/preview/scim	
sv-tt1m-dar-dbw-se-001-provisioning  	https://adb-7827988665380616.16.azuredatabricks.net	https://adb-7827988665380616.16/api/2.0/preview/scim	

sv-tt2m-dar-dbw-se-001-provisioning  	https://adb-5151382202637155.15.azuredatabricks.net	https://adb-5151382202637155.15/api/2.0/preview/scim	

https://<workspace-url>/api/2.0/preview/scim


## Azure Databricks SCIM Provisioning Connector
Publisher
Databricks Inc
Provisioning
Automatic provisioning supported
Single Sign-On Mode
Linked Sign-on
URL
https://azure.microsoft.com/en-us/services/databricks/
Azure Databricks SCIM Connector allows you to enable Users and Groups synchronization to a Databricks Workspace from Azure Active Directory (Azure AD).

Testing connection to sv-td2m-dar-dbw-se-001-provisioning
You appear to have entered invalid credentials. Please confirm you are using the correct information for an administrative account.

Error code: SystemForCrossDomainIdentityManagementCredentialValidationUnavailable
Details: We are not able to connect to your application while attempting to validate our authorization to access your application. Please ensure that you have provided valid credentials to the application and reach out to the application developer to diagnose why the authorization is failing.
Request-id: b9f8c528-d811-491a-b74a-f3a2b7954d8b

Error Testing connection of Databricks SCIM Connector to Databricks Workspace


## Generated keys and secrets
Login to Azure Management Server TPWJMP0101
Login to Azure Portal and then Key Vault
Search for sv-tp1m-dar-kv-se-001-ew
If you receive a policy access warning
  Go to Access policies >> Add Access Policy >> add yourself

To generate new key and secret click on Generate/Import
  svc-edwshir-password
    Upload option - Manual
    Name - svc-edwshir-password
    Value - <<provide a secret>>
    Set activation date - <<if required>>
    Set expiration date - <<if required>>
    Click Ok

To generatea new secret for an existing key
  svc-edwshir-password
  Click 'New version"


## Firewall Change
CHG0045169
01. Login to Azure Portal
02. Search for sv-sh1m-hub-fw-se-001-policy
03. In the left pane, Settings >> Rule collection  
04. Manually delete rules below
      DefaultNetworkRuleCollectionGroup (All rules within)
      DefaultDnatRuleCollectionGroup (All rules within)
05. Search for sv-sh1m-hub-fw-ea-001-policy
06. In the left pane, Settings >> Rule collection 
07. Manually delete ruls below
      DefaultNetworkRuleCollectionGroup (All rules within)
08. Stop Qlik Replicate Jobs. To be performed by BI team
09. Login to ADO
    TAC-DAR >> Repos >> Files >> FirewallManagement >> main
    Download zip
    Extract the locally downloaded zip file
    Follow to the script and right click and ""Edit""
    Open in Powershell ISE
    -- Two options to run -- Run selection and Run (to run the entire script)
10. Run the scripts below
      20211117-145312-TAC-DAR-NETWORK-ALLOW-PROD-primary.ps1                  (10 min to run)
      20211117-145312-TAC-DAR-NETWORK-ALLOW-PROD-secondary.ps1              (10 min to run)
      20211118-FirewallRules-sv-sh1m-hub-fw-001-policy-machinelearning.ps1     (10 min to run)
11. Start Qlik Replicate Jobs To be performed by BI team

## Enable MFA

For Azure DevOps 
Project level roles in scope for MFA are as follows:  
  Azure DevOps Project	ROL-AzureDevops-tac-dar-ReleaseAdmins	
    Conditional Access - Policy - AzureDevOps-Project-DAR-MFA
  

Organisation level roles in scope for MFA are as follows:
  Azure DevOps	ROL-AzureDevops-tac-ProjectCollectionAdmin	

Azure AD >> Security >> Conditional Access >> New Policy >> Create new policy >> 
  Name: AzureDevOps-DAR-MFA-Organisation
  Assignment: Users and Groups >> Select Users and Groups >> select Users and Groups >> Add on=prem AD groups ie ROL-AzureDevops-tac-ProjectCollectionAdmin	
  Cloud apps and actions: Cloud apps >> Select apps >> Azure DevOps
  Conditions: None//default
  Access Controls: Grant access >> require MFA
  Enable Policy: On

## INC0258189

Title: DAR: Azure Firewall Monitoring 10.42.98.4
Description: An Azure DAR cloud source has failed to connect to multiple endpoints.

Source: 10.42.98.4
Destination: 57 unique IPs
Destination Port: 123-UDP (NTP), 9093-TCP (Copycat Database Replication Service)

Event Details for past 7 days:
Event Count: 14,040
Event Start: 18/10/2021 21:00

Sample Payload:
{"category": "AzureFirewallNetworkRule", "time": "2021-10-21T22:59:58.8431340Z", "resourceId": "/SUBSCRIPTIONS/AFA41E51-86BA-421A-AC6F-044FF397A53D/RESOURCEGROUPS/RG-SH1M-HUB-SE-001/PROVIDERS/MICROSOFT.NETWORK/AZUREFIREWALLS/SV-SH1M-HUB-FW-SE-001", "operationName": "AzureFirewallNetworkRuleLog", "properties": {"msg": "UDP request from 10.42.98.4:123 to 91.189.94.4:123. Action: Deny. "}}
{"category": "AzureFirewallNetworkRule", "time": "2021-10-21T22:59:51.0595910Z", "resourceId": "/SUBSCRIPTIONS/AFA41E51-86BA-421A-AC6F-044FF397A53D/RESOURCEGROUPS/RG-SH1M-HUB-SE-001/PROVIDERS/MICROSOFT.NETWORK/AZUREFIREWALLS/SV-SH1M-HUB-FW-SE-001", "operationName": "AzureFirewallNetworkRuleLog", "properties": {"msg": "TCP request from 10.42.98.4:41820 to 13.70.72.2:9093. Action: Deny. "}}
==========================================

Additional Notes:
- Alert triggered as an Azure DAR host failed to connect to multiple endpoints
- Checking logs for past 7 days, all traffic that has been blocked is for Destination ports 123 and 9093, which are for NTP and Copycat Replication services respectively
- Blocked traffic is occurring at the Azure Eventhub Firewall based on the event logs

Ticket has been raised for Azure team to check if there are any issues with host 10.42.98.4

Source: 10.42.98.4
SV-SH1M-HUB-FW-SE-001

