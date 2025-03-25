##########################################################################
Azure DevOps Agents


##########################################################################

>>> Install amd Configs

https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops#run-as-a-systemd-service
https://www.coachdevops.com/2023/01/how-to-setup-self-hosted-linux-agent-in.html

https://learn.microsoft.com/en-us/powershell/azure/install-azps-linux?view=azps-12.0.0
https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel?view=powershell-7.4
https://learn.microsoft.com/en-us/powershell/azure/install-azps-offline?view=azps-12.0.0

https://www.freecodecamp.org/news/the-linux-commands-handbook/#the-linux-grep-command

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

ssh -l go2-hsidhu2@go2.kworld.kpmg.com 10.180.12.43
ssh -l go2-hsidhu2@go2.kworld.kpmg.com 10.180.12.44

sudo chown -R go2-hsidhu2:'go2-sg go2pazrapp015 - admins' /adoagents/
sudo chown -R go2-hsidhu2:'domain users' /adoagents/

echo "$http_proxy"
http://10.180.8.4:8080
 echo "$https_proxy"
http://10.180.8.4:8080

sudo mkdir /adoagents
sudo mkdir /adoagents/go2pazrapp016

 sudo ./config.sh
Must not run with sudo
 ./config.sh

>> End User License Agreements:

Building sources from a TFVC repository requires accepting the Team Explorer Everywhere End User License Agreement. This step is not required for building sources from Git repositories.

A copy of the Team Explorer Everywhere license agreement can be found at:
  /home/go2-hsidhu2@go2.kworld.kpmg.com/adoagent/license.html

Enter (Y/N) Accept the Team Explorer Everywhere license agreement now? (press enter for N) > Y

>> Connect:

Enter server URL > https://go-infrastructure.visualstudio.com/
https://dev.azure.com/go-infrastructure

Enter authentication type (press enter for PAT) > PAT
Enter personal access token >
Enter authentication type (press enter for PAT) > Negotiate
Enter user name > hsidhu2@kpmg.com.au
Enter password > 
VS30063: You are not authorized to access https://go-infrastructure.visualstudio.com


Enter agent pool (press enter for default) > azure-dev-automation-pool
Enter agent name (press enter for go2pazrapp015) >] go2pazrapp015_lnx_01
Enter work folder > _work

<<< that's it agent is successfully configured. >>>

Configure the Agent to run as a Service
sudo ./svc.sh install &

Execute now to run as a service
./runsvc.sh &

ls -altr /etc/systemd/system
vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2dautomation\x2dpool.go2pazrapp015_01.service'

sudo ./svc.sh start
sudo ./svc.sh ststus
sudo ./svc.sh stop

sudo apt-get install -y powershell
Get-InstalledModule | Select Name, Repository | FT -AutoSize
Install-Module -Name Az -Repository PSGallery -Force
Get-Module -Name PowerShellGet -ListAvailable | Install-Module
Find-Module PowerShellGet  | Install-module

jobs -l
fg
fg %1
kill -9 25177

Error reported in diagnostic logs. Please examine the log for more details.
Jul 01 07:36:37 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[698259]:     - /adoagents/go2pazrapp015-01/_diag/Agent_20240701-072832-utc.log
Jul 01 07:52:43 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[698259]: 2024-07-01 07:52:43Z: Agent connect error: The HTTP request timed out after 00:01:40.. Retry…connected


Access denied. Harbrinder Sidhu needs Manage permissions for pool azure-dev-automation-pool to perform the action. For more information, contact the Azure DevOps Server administrator.

$proxy = New-Object System.Net.WebProxy "http://10.180.8.4:8080"
$webclient = New-Object System.Net.WebClient
$webclient.Proxy = $proxy

////////////////////
Install-Module -Name Az -Repository PSGallery -Force
Update-Module -Name Az -Force

$env:HTTP_PROXY = "http://10.180.0.8:8080/"
$env:HTTPS_PROXY = "http://10.180.0.8:8080/"

Bocled by proxy
Invoke-WebRequest -Uri https://www.powershellgallery.com/api/v2 -UseBasicParsing
Invoke-WebRequest: The proxy tunnel request to proxy 'http://10.180.8.4:8080/' failed with status code '403'."

Invoke-WebRequest -Uri https://www.powershellgallery.com/api/v2 -UseBasicParsing -Proxy "http://10.180.0.8:8080"





/////////////////////////////////////////////////////////////////////////////////////////

$PSVersionTable
pwsh
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
Import-Module Az
Get-Module -Name Az -ListAvailable

Get-PSRepository
Register-PSRepository -Default
Register-PSRepository -Name "PSGallery" -SourceLocation "https://www.powershellgallery.com/api/v2" -InstallationPolicy Trusted
Register-PSRepository -Name "PSGallery" `
                      -SourceLocation "https://www.powershellgallery.com/api/v2/" `
                      -InstallationPolicy Trusted `
                      -PackageManagementProvider NuGet

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$proxy = New-Object System.Net.WebProxy "http://proxyserver:port"
$webclient = New-Object System.Net.WebClient
$webclient.Proxy = $proxy

Invoke-WebRequest -Uri https://www.powershellgallery.com/api/v2/

Install-PackageProvider -Name NuGet -Force
Install-Module -Name PowerShellGet -Force -AllowClobber

[System.Net.WebRequest]::DefaultWebProxy = [System.Net.WebRequest]::GetSystemWebProxy()
[System.Net.WebRequest]::DefaultWebProxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

$env:HTTP_PROXY = $proxyAddress
$env:HTTPS_PROXY = $proxyAddress




go2pazrapp803-04









