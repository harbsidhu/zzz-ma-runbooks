###############################################################################
Dump Book -- Just Some Random Bits

General Comments

DELETE REGULARLY
###############################################################################


Qualys proxy only 3 proxies, ema/aspac/amr in log.txt file of qualys

Name -- Member Firm - STAG
Configuration Item Owner -- Global  Service Management
Managed By Group -- L2 Platform Ops Cloud Enterprise - ITSG
Support group -- L2 Platform Ops Cloud Enterprise - ITSG
Company -- Global
Status(install_status) -- Deployed
Environment -- Staging

Member Firm Application Service in Staging used for associating to Member firm Servers in Azure . This for Member Firm Applications that are not stored in Global CMDB


https://graph.microsoft.com

------------------------------------------------------------------------


Allowed Hosts
graph.microsoft.com
login.microsoftonline.com

Example:
https://graph.microsoft.com/v1.0/servicePrincipals?$select=id,displayName

https://graph.microsoft.com/v1.0/servicePrincipals

Scope:
https://graph.microsoft.com/.default


Authorization URL: https://login.microsoftonline.com/tenxx/oauth2/v2.0/authorize

Token URL: https://login.microsoftonline.com/tenxx/oauth2/v2.0/token




Auth >> none

base url https://graph.microsoft.com

health check: https://graph.microsoft.com
Added bearer token auth
Added Allowed hosts
>> test and save

Panel

type json
parser default
method get

urls:
https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId

http headers
Key==Authorization
Value: <bearer-token>

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId,passwordCredentials,keyCredential

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId,createdDateTime,appOwnerOrganizationId,passwordCredentials



####################################################################

{

    $passinputfile       = "E:\Reports\Script\password.txt"
    $infobusername       = "abcd@xyz.com"

    if (Test-Path $passinputfile) {
           $password = get-content $passinputfile | convertto-securestring -Key $key
              #$Password | ConvertFrom-SecureString -key $key 
            $Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist ($infobusername,$password)
    }
    
    $env = "AzureCloud"
}



[go2azrapp803-hsidhu2@go2pazrapp015 go2pazrapp015-01]$ ./svc.sh uninstall
Must run as sudo
[go2-hsidhu2@go2pazrapp015 go2pazrapp015-01]$ sudo ./svc.sh uninstall

/etc/systemd/system/vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2dautomation\x2dpool.go2pazrapp015\x2d01.service
● vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2dautomation\x2dpool.go2pazrapp015\x2d01.service - Azure Pipelines Agent (go-infrastructure.azure-dev-automation-pool.go2pazrapp015-01)
   Loaded: loaded (/etc/systemd/system/vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2dautomation\x2dpool.go2pazrapp015\x2d01.service; enabled; vendor preset: disabled)
   Active: inactive (dead) since Thu 2024-11-21 04:03:01 UTC; 13ms ago
  Process: 1475 ExecStart=/adoagents/go2pazrapp015-01/runsvc.sh (code=exited, status=0/SUCCESS)
 Main PID: 1475 (code=exited, status=0/SUCCESS)

Nov 20 23:10:46 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: 2024-11-20 23:10:46Z: Agent connect error: The …cted.Nov 20 23:12:02 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: 2024-11-20 23:12:02Z: Agent reconnected.
Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com systemd[1]: Stopping Azure Pipelines Agent (go-infrastructure.a…01)...Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: Shutting down agent listener
Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: Sending SIGINT to agent listener to stop
Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: Exiting...
Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: Agent listener exited with error code 0
Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com runsvc.sh[1540]: Agent listener exit with 0 return code, stop th…eded.Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com systemd[1]: vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2daut…eeded.Nov 21 04:03:01 go2pazrapp015.go2.kworld.kpmg.com systemd[1]: Stopped Azure Pipelines Agent (go-infrastructure.az…5-01).Hint: Some lines were ellipsized, use -l to show in full.
Removed /etc/systemd/system/multi-user.target.wants/vsts.agent.go\x2dinfrastructure.azure\x2ddev\x2dautomation\x2dpool.go2pazrapp015\x2d01.service.
[go2-hsidhu2@go2pazrapp015 go2pazrapp015-01]$ sudo ./config.sh remove
Must not run with sudo
[go2-hsidhu2@go2pazrapp015 go2pazrapp015-01]$ ./config.sh remove
Removing agent from the server
Enter authentication type (press enter for PAT) > PAT
Enter personal access token > ****************************************************
Connecting to server ...
Succeeded: Removing agent from the server
Removing .credentials
Succeeded: Removing .credentials
Removing .agent
Succeeded: Removing .agent
[go2-hsidhu2@go2pazrapp015 go2pazrapp015-01]$


E:\Azure Automation\Azure Reports\OAT


-File "E:\Azure Automation\Azure Reports\AKSClusters-Report\Script\AKSClustersReport_Script.ps1"


76492d1116743f0423413b16050a5345MgB8AG0ANwB6AEEAVgAxADYAWQBFAEwANwByAFcAVQByAFoAWgBSAE4AbwBPAHcAPQA9AHwAMABlADkAMwBkADYAZgAyAGEAZAAzAGEANQAwADMANgAzAGYANgBhADYAOQBkADUAMwBjAGMANwA4AGMAMwBlADgANgA1ADMAYgBjADMAOAA4ADEANgA5ADcAOABhAGMAOAA1ADEAOQA5ADUANwBjAGUAMwA2AGIAZgAzADgAMAA1ADMAMwAxAGUAZgBjAGUAYQAyADMANAA1ADUAMwA5ADQAMgBkAGQANQAyADIANwAyADQAMQBjADQAZQAzADIA













VMname where scripts are running
linux oat

no patching all in dec w/e 21/22 but 04 jan everything incl audit and then catchup on 11/12 all, incl audit -- DT/GK

contact narmada, dave/gertjan



Naman
another meeting to discuss reporting
how reports are generated
queries/scripts
delivery email//centrla storage






## Orchestartor Password Reset Issue - Email Delivery fails

>> QA
goemairs.go.kworld.kpmg.com

smtp
	orcqaazrapp02  = @{smtpServer = '10.180.4.33'
	emailFrom      = 'go-fmoneplatformclou@kpmgqa.com'
	goqaazrexc904

	Send-MailMessage 	-From "go-fmoneplatformclou@kpmgqa.com" `
                 		-To "hsidhu2@kpmg.com.au" `
                 		-Subject "Test Email" `
                 		-Body "This is a test email sent from qa orch serverl." `
                 		-SmtpServer "10.180.4.33"
 
ASPAC Activity
Issue is now resolved
-- Checked connectivity from orcqaazrapp02 to exchange server "10.180.4.33"
	TCP test succeded on port 25

-- Checked send mail from orcqaazrapp02 to exchange server "10.180.4.33"
	Insufficient system storage. The server response was: 4.3.1

-- DW team, Martin, cleared some space on the VM 
	Issue resolved. 
	Tested submitting a request, successfully received email for completetion

>> DEV
Test-NetConnection -ComputerName 10.180.4.106 -Port 25
    WARNING: TCP connect to 10.180.4.4:25 failed
    ComputerName           : 10.180.4.4
    RemoteAddress          : 10.180.4.4
    RemotePort             : 25
    InterfaceAlias         : Ethernet
    SourceAddress          : 10.81.212.229
    PingSucceeded          : True
    PingReplyDetails (RTT) : 6 ms
    TcpTestSucceeded       : False

Send-MailMessage -SmtpServer 10.180.4.106 -Port 25 -From go-fmoneplatformclou@kpmgdev.com -To hsidhu2@kpmg.com.au -Subject test -Body test

Test-NetConnection -ComputerName 10.180.4.27 -Port 25
ComputerName     : 10.180.4.27
RemoteAddress    : 10.180.4.27
RemotePort       : 25
InterfaceAlias   : Ethernet
SourceAddress    : 10.81.212.229
TcpTestSucceeded : True

Send-MailMessage -SmtpServer 10.180.4.27 -Port 25 -From go-fmoneplatformclou@kpmgdev.com -To hsidhu2@kpmg.com.au -Subject test -Body test


eYwm75a23WBAo2VbT3Egg57#wSR95tVvdQ8Ek&u

Send-MailMessage : Unable to connect to the remote server
At C:\Packages\Plugins\Microsoft.CPlat.Core.RunCommandWindows\1.1.18\Downloads\
script65.ps1:1 char:1
+ Send-MailMessage -SmtpServer 10.180.4.4 -Port 25 -From go-fmoneplatfo ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (System.Net.Mail.SmtpClient:Sm 
   tpClient) [Send-MailMessage], SmtpException
    + FullyQualifiedErrorId : SmtpException,Microsoft.PowerShell.Commands.Send 
   MailMessage


///////////////
Problem Resolution Summary:

Connectivity Verification:
Tested connection from "orcqaazrapp02" to Exchange server "10.180.4.33"
Port 25 TCP test: Successful

Mail Transmission Test:
Attempted to send mail from "orcqaazrapp02" to Exchange server "10.180.4.33"
Error encountered: "Insufficient system storage. Server response: 4.3.1"

Remediation:
Martin, DW team, freed up space on the Exchange server "10.180.4.33"

Confirmation of Resolution:
Issue rectified
Validation: Submitted a test request
Outcome: Successfully received confirmation email

Current status: Problem resolved






go-fmoneplatformclou@kpmgqa.com


Windows IP Configuration

   Host Name . . . . . . . . . . . . : orcqaazrapp02
   Primary Dns Suffix  . . . . . . . : kpmgqacloud.kpmg.com
   Node Type . . . . . . . . . . . . : Hybrid
   IP Routing Enabled. . . . . . . . : No
   WINS Proxy Enabled. . . . . . . . : No
   DNS Suffix Search List. . . . . . : kpmgqacloud.kpmg.com
                                       reddog.microsoft.com

Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : reddog.microsoft.com
   Description . . . . . . . . . . . : Microsoft Hyper-V Network Adapter
   Physical Address. . . . . . . . . : 00-0D-3A-8E-D6-54
   DHCP Enabled. . . . . . . . . . . : Yes
   Autoconfiguration Enabled . . . . : Yes
   Link-local IPv6 Address . . . . . : fe80::c405:4d72:4ffd:3aad%5(Preferred) 
   IPv4 Address. . . . . . . . . . . : 10.116.52.228(Preferred) 
   Subnet Mask . . . . . . . . . . . : 255.255.255.224
   Lease Obtained. . . . . . . . . . : Saturday, August 17, 2024 10:51:30 PM
   Lease Expires . . . . . . . . . . : Monday, October 20, 2160 1:58:50 AM
   Default Gateway . . . . . . . . . : 10.116.52.225
   DHCP Server . . . . . . . . . . . : 168.63.129.16
   DHCPv6 IAID . . . . . . . . . . . : 50335034
   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-25-6E-95-32-00-0D-3A-8E-D6-54
   DNS Servers . . . . . . . . . . . : 10.180.3.4
                                       10.180.3.5
   NetBIOS over Tcpip. . . . . . . . : Disabled

Tunnel adapter isatap.reddog.microsoft.com:

   Media State . . . . . . . . . . . : Media disconnected
   Connection-specific DNS Suffix  . : reddog.microsoft.com
   Description . . . . . . . . . . . : Microsoft ISATAP Adapter
   Physical Address. . . . . . . . . : 00-00-00-00-00-00-00-E0
   DHCP Enabled. . . . . . . . . . . : No
   Autoconfiguration Enabled . . . . : Yes

/////////////
AllowedDNSSuffixes                 : {}
ChildDomains                       : {ccqa.kpmgqacloud.kpmg.com, 
                                     go2qa.kpmgqacloud.kpmg.com}
ComputersContainer                 : CN=Computers,DC=kpmgqacloud,DC=kpmg,DC=com
DeletedObjectsContainer            : CN=Deleted 
                                     Objects,DC=kpmgqacloud,DC=kpmg,DC=com
DistinguishedName                  : DC=kpmgqacloud,DC=kpmg,DC=com
DNSRoot                            : kpmgqacloud.kpmg.com
DomainControllersContainer         : OU=Domain 
                                     Controllers,DC=kpmgqacloud,DC=kpmg,DC=com
DomainMode                         : Windows2016Domain
DomainSID                          : S-1-5-21-1390131745-119902313-2187765511
ForeignSecurityPrincipalsContainer : CN=ForeignSecurityPrincipals,DC=kpmgqaclou
                                     d,DC=kpmg,DC=com
Forest                             : kpmgqacloud.kpmg.com
InfrastructureMaster               : GOQAAZRGC01.kpmgqacloud.kpmg.com
LastLogonReplicationInterval       : 
LinkedGroupPolicyObjects           : {cn={05EA5719-4EBD-40A0-8E2B-B2673570744A}
                                     ,cn=policies,cn=system,DC=kpmgqacloud,DC=k
                                     pmg,DC=com, cn={0E0D3861-0EA3-4475-9604-03
                                     662D7F4C31},cn=policies,cn=system,DC=kpmgq
                                     acloud,DC=kpmg,DC=com, cn={DE79F5B6-73A7-4
                                     16F-AB8F-5B5E7F71F7E6},cn=policies,cn=syst
                                     em,DC=kpmgqacloud,DC=kpmg,DC=com, cn={FAA2
                                     7456-D76A-4FB2-8F10-B30552AF2ED3},cn=polic
                                     ies,cn=system,DC=kpmgqacloud,DC=kpmg,DC=co
                                     m...}
LostAndFoundContainer              : CN=LostAndFound,DC=kpmgqacloud,DC=kpmg,DC=
                                     com
ManagedBy                          : 
Name                               : kpmgqacloud
NetBIOSName                        : KPMGQACLOUD
ObjectClass                        : domainDNS
ObjectGUID                         : 1219fc50-bbf9-4877-ae13-3eeb70fb387b
ParentDomain                       : 
PDCEmulator                        : GOQAAZRGC01.kpmgqacloud.kpmg.com
PublicKeyRequiredPasswordRolling   : False
QuotasContainer                    : CN=NTDS 
                                     Quotas,DC=kpmgqacloud,DC=kpmg,DC=com
ReadOnlyReplicaDirectoryServers    : {}
ReplicaDirectoryServers            : {GOQAAZRGC01.kpmgqacloud.kpmg.com, 
                                     GOQAAZRGC02.kpmgqacloud.kpmg.com}
RIDMaster                          : GOQAAZRGC01.kpmgqacloud.kpmg.com
SubordinateReferences              : {DC=go2qa,DC=kpmgqacloud,DC=kpmg,DC=com, 
                                     DC=ccqa,DC=kpmgqacloud,DC=kpmg,DC=com, DC=
                                     DomainDnsZones,DC=kpmgqacloud,DC=kpmg,DC=c
                                     om, DC=ForestDnsZones,DC=kpmgqacloud,DC=kp
                                     mg,DC=com...}
SystemsContainer                   : CN=System,DC=kpmgqacloud,DC=kpmg,DC=com
UsersContainer                     : CN=Users,DC=kpmgqacloud,DC=kpmg,DC=com






#####################################################################


Improve financial literacy and management skills to develop a robust retirement plan, ensuring long-term financial security and a comfortable lifestyle post-retirement.

Retirement savings rate:
Target: Setup monthly retirement savings of 10% within 6 months
Measure: Percentage of monthly income allocated to retirement accounts

Financial education:
Target: Complete 1 personal finance courses within 12 months
Measure: Number of courses completed and certifications earned

Emergency fund:
Target: Build an emergency fund covering 3 months of expenses within 12 months
Measure: Total amount in emergency fund relative to monthly expenses


Develop proficiency in Terraform for infrastructure as code (IaC), enabling efficient and consistent management of cloud resources on Azure, AWS

Code Proficiency:
Target: Write Terraform configurations for at least 5 different resource types across Azure/AWS cloud providers
Measure: Number of resource types successfully implemented

Project Completion:
Target: Complete 3 personal projects using Terraform
Measure: Number of projects completed and implemnted in personal lab

Terraform Modules:
Target: Create and publish 2 reusable Terraform modules
Measure: Number of modules created and published in personal repository

Terraform State Management:
Target: Implement and manage Terraform state for 3 projects, using remote state storage
Measure: Percentage of projects using proper state management techniques

Terraform Best Practices:
Target: Implement Terraform best practices in all projects (e.g., using variables, outputs, and proper file structure)
Measure: Percentage of projects following best practices, as determined by self-review or peer review




>>> Logic App
---
let timerange = 7d;
let logicAppName = "goladevuseopsgpt01";
AzureDiagnostics
| where TimeGenerated > ago(timerange)
| where ResourceProvider == "MICROSOFT.LOGIC"
| where resource_workflowName_s == logicAppName
| extend duration = datetime_diff('Millisecond', endTime_t, startTime_t)
| take 10
| summarize
    RunsFailed = countif(status_s == "Failed"),
    RunsTotal = count(),
    AvgLatencyMilliseconds = avg(duration)
| extend RunsSuccessPercentage = (RunsTotal - RunsFailed) * 100.0 / RunsTotal
| project
    RunsFailed,
    ["Run Latency (seconds)"] = AvgLatencyMilliseconds / 1000,
    ["Runs Success Percentage"] = RunsSuccessPercentage
---





goappdevuseopsgpt01
auth >> app id 7942a85e-ff84-4070-a479-4f8cb52ea9d3
goappdevuseopsgpt01

https://goappdevuseopsgpt01.azurewebsites.net/

Enterprise Application
goappdevuseopsgpt01 | 

  Users and Groups >> add SG GO-SG ITSG OpsGPT CE Tier 3 - CLD

  Properties >> Assigment Required Yes

Virtual Machine:  go0dorchapp0118 10.84.214.228
WebApp: 
  goappdevuseopsgpt01 
    Inbound: 
      Private endpoints
        goappdevuseopsgpt01-pe
        10.84.215.6, 20.119.8.58  ((Inbound)) 
        
    Outbound:
    GOAZRVNETDEV11500/GOSNASPDEV115001 >> 10.84.214.160/27
      4.156.128.35, 4.156.128.71, 4.156.128.99, 4.156.128.113, 4.156.130.122, .....

    Network security group
      GO_NSG_GOSNASPDEV115001
      User defined route
      RT_KNET_HA_DEV_EASTUS

go0dorchapp0118
  GOAZRVNETDEV11500/GOSNBEI11510
    GO_NSG_GOSNLEGI11510

govmdevusebast1
  GOAZRVNETDEV11500/GOSNRDPDEV115101
    GO_NSG_GOSNRDPDEV115101


Security considerations
  -- Local admin access. Request submitted RITM3270147

Network configuration changes:
  -- Configure proxy settings if required
  -- Internet access, esp Azure Portal.
        Ensure firewall rules allow outbound traffic to Azure Portal endpoints
  -- NSG rules for traffic flow within RG
        Verify/Define inbound and outbound security rules for VMs within the RG
  -- Whitelisting for websites
        Whitelist domains for Microsoft, Python, and other necessary resources to the allowlist

Software installation needs:
  -- Azure Portal Access
  -- VS Code
  -- Python

Performance considerations:
  -- Monitor performance 
  -- Load testing






Steps: 
1. In KPMG DEV tenant, go to "Enterprise Application"
2. Choose application "goappdevuseopsgpt01"
3. In Users and groups, add SG "SG GO-SG ITSG OpsGPT CE Tier 3 - CLD"
4. In Properties, change Assignment Required to Yes
5.  In Properties, change Visible to Users to Yes

///////////////////////////////////////////


https://kpmggostag.service-now.com/incident_list.do?sysparm_query=&sysparm_view=

//////////////////////////////////////////////


I think another prerequisite is that you have the managers approval for the overall access (as this is required for most request)

So as soon as you know the MF iid and email request this (otherwise you loose time)





Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime

Configure your account by following the steps outlined here.
Download the agent
Download	
Create the agent
~/$ mkdir myagent && cd myagent
~/myagent$ tar zxvf ~/Downloads/vsts-agent-linux-x64-3.240.1.tar.gz
Configure the agentDetailed instructions
~/myagent$ ./config.sh
Optionally run the agent interactively
If you didn't run as a service above:
~/myagent$ ./run.sh



. General Check-In
• How are you doing?
○ How are your projects/engagements going?

Things going well. Learned a lot from OpsGPT project
Don't have a full understanding at the moment
Will get into more depth once certs are finished
Looking at more training on python

○ What has been challenging?
○ No challenges this month
○ Lots of learning coming with certification

○ What has been enjoyable?
Working on the infra side of opsgpt
Enjoyed learning, but need to learn more.
Bicep code.

○ How can I support you?
OpsRota support is still confusing
Discussed opsrota hours and handover times
Will discuss further in standup tomorrow'



2. Workload and Prioritization
• How is your workload?
○ Are you feeling overwhelmed, underwhelmed, or is it just right?
○ Ops is a bit busy sometimes - spikes some days

○ How are you managing your priorities?
○ Sprint planning is making us more organized

○ Are there any obstacles impacting your ability to manage your workload effectively?
○ Nothing, no

3. Support and Feedback
• How can I help?
○ Is there anything specific you need from me or the team to improve your work experience?
○ Shaun and Steven are very supportive as a team
○ Enjoys the work because of the team

○ Anything I should be doing differently to better support you?


4. Recognition and Accomplishments
• Recognition:
○ What accomplishments are you most proud of since our last check-in?
○ DP-900!
○ Started ball rolling on SC-900
○ Feeling more confident
○ Target end of July for MS-900

○ How have you demonstrated our firm’s values in your work recently? Leadership and values (sharepoint.com)


5. Goals and Objectives
• Goals:
○ Let's review and update your goals, considering dependencies on other teams.
○ Need to create some features/cards for Grafana dashboarding after training

○ What progress have you made toward your goals?
○

○ Are you on track to meet your goals by year-end?
○ Business goals are on track

6. Personal Development Plan
• Development Goals:
○ What progress have you made toward your near- and long-term development goals?
○ Goals progressing well.

○ Have these been captured in a Personal Development Plan?
○ yes

○ Do you feel you are on track to meet these goals? If not, what are the gaps?
○ Yes, should be complete most by the end of this quarter


7. Growth and Development
• Growth:
○ What areas are you looking to grow and learn in?
○ Completed AZ-900.
○ Next in line is the DP-900, SC-900 and MS-900

○ What steps have you taken towards your growth?
○ Doing study and test exams


• Competencies:
○ How have you demonstrated the competencies for your current and next level?


○ Which areas need further development?
○ Looking to develop IaC such as bicep and pipeline automation using powershell

8. Wellbeing
• How are you feeling overall in terms of your wellbeing?
○ Are you able to maintain a good work-life balance?
○ Yes try to

○ Is there anything that is impacting your wellbeing that we can address?
○ Everything is good


9. Career Aspirations
• Career Aspirations:
○ What are your near and long-term career aspirations?

○ How do you see your current role aligning with these aspirations?
○


10. Compliance and Professional Requirements
• Compliance:
○ Are you compliant with the relevant in-country requirements for your role?
○ Member Firm Training

○ Card created in sprint allocated to complete

○ Do you need any support or resources to maintain compliance?
○ No

11. Constructive Feedback
• Feedback Tips:
○ Provide specific examples of actions and behaviours observed.
○ Frame improvement areas as opportunities for growth.
○ Offer feedback in a timely manner.

Happy to work in the team

Notes to Discuss:
Tentative Leave - 2nd week of July 9th -12th


During this quarter, in addition to offering operational support, I worked on and completed the following sprint tasks:
-- Completed certification for Az-900 and DP-900. Started working on SC-900
-- OpsGPT MVP 1.0 delivered. Actively worked on Infra deployment, python coding and testing
-- Need to spend more time learning Bicep and Python 
-- Actively participating in the scope and design phases of the OpsGPT MVP 2.0, including reviewing and understanding codebase, attend team meetings, and collaborate with Microsoft, and provide inputs. 










New starter: Rish Jain
Division: Business Services
Position: Azure Site Reliability Engineer
Username: rjain32
Email: rjain32@kpmg.com.au
Telephone: 61732375542
Extension: 75542
go1.kworld.kpmg.com/GO1/Users/

Create GO-CLD-IID account for KPMG tenant - Rish Jain
Add GO-CLD-rjain32 account to SG GO-SG CLD KPMG Cloud Central Tier III - Rish Jain

Rish Jain is a new starter in Cloud Enterprise Tier 3 team and would require this access to perform his operational duties aligned with his role.
Approval attached.

Request submitted

Please add account of Rish Jain, rjain32 (rjain32@kpmg.com.au) to the distribution list

GO-DL ITS Global Platform Ops Cloud Enterprise Chapter - ASPAC
DLCloudEnterpriseASPAC@kpmg.com

GO-AZR AAD is not AD Integrated, accounts are invited from the KPMG tenant as guests and then converted to Member.


The VM : 'advdevazrapCheck for "Statsup145' does not support the provided new size Standard_E4s_v4

>> Contributor Role
To proceed with the request, we ask that you obtain approval for creation of go-cld account from your manager or CI Owner
Additionally, for Contributor role explicit approval is required from the CI Owner, Nadir Ahmed

The attached approval does not explicitly provide approval for Contributor role as requested in the service request.
To proceed with the request, we ask that you obtain explicit approval for contributor role from the CI Owner.

The attached approval does not explicitly authorise Contributor role as requested in the service request.
To proceed with the request, we ask that you obtain explicit approval for contributor role from the CI Owner, Brian Ott

New GO-CLD-IID account creations are now automated process. Please submit a new request using the catalog item link below

https://kpmggoprod.service-now.com/sp?id=sc_cat_item&sys_id=e8326132dbdd401416a9b1a13996198b


Harb, with the OpsGPT session with AMR tomorrow, I will refer to you during the session to talk about the differences you found between GPT 3.5 and 4 and why we chose to go with 4.  Try to keep it to a couple of minutes only unless we get questions about it.  We need to all note down any questions or feedback during the call so we can improve the presentation before presenting to EMA and then later to senior management 

As per established procedure, Contributor roles require approval from CI/Subscription owner.

Subscription Name: GO-M-DEV-AzureAD
Subscription Owner: Nirav Kumar Shah

Request for data from 1 Jan to 31 Jan 2024 - Hosting team
SCTASK6741011, SCTASK6368404 , SCTASK6049491


>> Backup Success Notification
https://portal.azure.com/#@kpmg.onmicrosoft.com/resource/subscriptions/7210b7a9-cf30-494f-a063-fa883e78d817/resourceGroups/rg-loganalytics001/providers/Microsoft.OperationalInsights/workspaces/law-backup-report-poc/Overview

>> Sprint Accepyance Criteria
As a cloud engineer

I want to submit service now request 

so that account are created for new starter.

I need to confirm. What specific role do you need? What resource groups? Contributor at the subscription level is generally not approved for OnePlatform managed services.

>> Cancel Subscription
SCTASK4881733 RITM1934860
I have verified the subscription "GO-M-DEV-GlobalAdvisoryTech" in the KPMG DEV tenant.
As per Gavin's comments in the attached approval the CI Owner Deepak Singh Amera no longer appears to be with the firm. The Deletion has been confirmed by Nebhnani, Rahul through Iraj Hastings (Director, Global Advisory Technology}.

Also checked the subscription does not have any VMs provisioned. It has network resources which will be removed by Secure Connectivity team.
MSFT will auto remove the remaining resources after 30 days.

SCTASK4891824 RITM1939949

>> CLD account security alert Incident
Soumya is a new joiner in the L3 Secure Connectivity team hence he's been added to these SGs as part of his onboarding process
New joiner added to the SG
Not required, as this is part of onboarding
Added to requested Security Group
GO-SG CLD KPMGDev Cloud Central Tier III

>> Sprint Acceptance Criteria
As a cloud engineer

I want to create and document a plan to enable AccelNet, IP Forwarding, RSS features for the VMs.

so that the plan is shared and agreed upon bu the with the UK KCw team members Brett Savill and Amit Patel for deployment in the STAGING environment in "GO-M-Audit UK"

When I raise a support ticket with Microsoft, I experience challenges with the initial and follow-up responses. I am based in Australia, but per experience the tickets are not assigned to a support engineer in the Australian time zone. Instead, are assigned to engineers in the IST time zone, which is 4.5 hours behind Australia. 
This time difference makes it difficult to collaborate and communicate with support engineers during Australian business hours.
I would like to see Microsoft assign support tickets to engineers in the Australian time zone so that I can get faster and more responsive support.

>> CR Planning
CHG0401070
I am approving this change request for now, but I would encourage you to provide a complete and detailed planning in the future. This is to ensure that the change request is implemented smoothly and efficiently, and that any potential problems can be identified and addressed in advance.
The plan should include all the step-by-step details that will be required to implement the change. It should be written in a way that someone else can follow it to implement if you are not available. 

At present, I am granting my approval to this change request. However, I strongly urge you to furnish a comprehensive and elaborate plan in the future. This is essential to ensure a seamless and efficient implementation of the change request, as well as to proactively identify and resolve any possible issues beforehand.
The plan ought to encompass meticulous, step-by-step instructions necessary for executing the change. It should be composed in a manner that enables someone else to follow it and implement the change in case you are unavailable.

I am approving this change request for now, but I would encourage you to provide a comprehensive and elaborate plan in the future. This is to ensure that the change request is implemented smoothly and efficiently, and that any potential problems can be identified and addressed in advance.
The plan ought to encompass meticulous, step-by-step instructions necessary for executing the change. It should be composed in a manner that enables someone else to follow it and implement the change in case you are unavailable.

I would encourage you to provide a comprehensive and elaborate implementation, backout and test plans. This is to ensure that the change request is implemented smoothly and efficiently, and that any potential problems can be identified and addressed in advance.
The plan ought to encompass meticulous, step-by-step instructions necessary for executing the change. It should be composed in a manner that enables someone else to follow it and implement the change in case you are unavailable.

For reference follow the link to the change management process
https://spo-global.kpmg.com/sites/GO-OI-BUS-GTK/CloudEnterprise/One%20Platform%20Change%20Management%20Process.pdf


>> Delete Subscription
Ref SCTASK5467020
Verified with CI Owner of the subscription, deletion confirmed.
Also checked the subscription does not have any VMs provisioned. It has network resources which will be removed by Secure Connectivity team.
Proceeding with cancellation.
MSFT will automatically delete the resources after 30 days.

Assigning ticket to L3 Secure Connectivity team to delete network resources

--> 
I'll be in India visiting family from 13/12/2023 to 26/01/2024. During this time, I will be working  my regular working hours from 14/12/2023 to 22/12/2023. Additionally, post this date I will be on my annual leave; however, I will remain available for any urgent matters or escalations until 26/01/2024.




{
    "provisioningState": "Succeeded",
    "resourceGuid": "cc9c2428-8541-4826-9c15-c6179a751823",
    "virtualNetworkPeerings": [
        {
            "type": "Microsoft.Network/virtualNetworks/virtualNetworkPeerings",
            "properties": {
                "provisioningState": "Succeeded",
                "resourceGuid": "884fe46d-1860-0e21-0342-61d7acc4d707",
                "remoteVirtualNetworkAddressSpace": {
                    "ipamPoolPrefixAllocations": [],
                    "addressPrefixes": [
                        "10.81.136.0/21",
                        "10.81.144.0/23",
                        "10.116.0.0/21",
                        "10.84.180.0/23"
                    ]
                },
                "doNotVerifyRemoteGateways": false,
                "allowVirtualNetworkAccess": true,
                "allowForwardedTraffic": false,
                "remoteVirtualNetwork": {
                    "id": "/subscriptions/8b253b6b-b9b6-47ef-a83e-678e15d1e0c7/resourceGroups/goazrvnetdev0100/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV0100"
                },
                "allowGatewayTransit": true,
                "remoteAddressSpace": {
                    "ipamPoolPrefixAllocations": [],
                    "addressPrefixes": [
                        "10.81.136.0/21",
                        "10.81.144.0/23",
                        "10.116.0.0/21",
                        "10.84.180.0/23"
                    ]
                },
                "peerCompleteVnets": true,
                "useRemoteGateways": true,
                "routeServiceVips": {},
                "peeringSyncLevel": "FullyInSync",
                "peeringState": "Connected"
            },
            "name": "Peered_VNET_GOAZRVNETDEV11500_DEV_GOAZRVNETDEV0100",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/virtualNetworkPeerings/Peered_VNET_GOAZRVNETDEV11500_DEV_GOAZRVNETDEV0100",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        }
    ],
    "enableDdosProtection": false,
    "subnets": [
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.96/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNAGP11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ]
            },
            "name": "GOSNAGP11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNAGP11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.128/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNHDP11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ]
            },
            "name": "GOSNHDP11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNHDP11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.0/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNPerI11500"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNPerI11500",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNPerI11500",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.32/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNShrI11500"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNShrI11500",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNShrI11500",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.192/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNFEI11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "eastus",
                            "westus",
                            "westus3"
                        ],
                        "service": "Microsoft.Storage"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNFEI11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNFEI11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.224/27",
                "ipConfigurations": [
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/NIC_GO0DORCHAPP0118/ipConfigurations/STATICIPCONFIG"
                    }
                ],
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNBEI11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "eastus",
                            "westus",
                            "westus3"
                        ],
                        "service": "Microsoft.Storage"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNBEI11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNBEI11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.215.224/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNLEGI11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "eastus",
                            "westus",
                            "westus3"
                        ],
                        "service": "Microsoft.Storage"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNLEGI11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNLEGI11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.215.0/27",
                "ipConfigurations": [
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GO-AZKV-DEV-USE-OPSGPT-PE.NIC.1294E2CA-69F0-4D09-B54E-F560670BE495/ipConfigurations/PRIVATEENDPOINTIPCONFIG.A67D8E7E-347A-47BF-9F65-D3E9ADFD8AE1"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOACRDEVUSEOPSGPT01-PE.NIC.224A48BF-5620-4F48-BCC6-1FC3A2A9203D/ipConfigurations/PRIVATEENDPOINTIPCONFIG.2744B621-0F09-4E51-A5E6-A4FFAA7E2EB3"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOACRDEVUSEOPSGPT01-PE.NIC.224A48BF-5620-4F48-BCC6-1FC3A2A9203D/ipConfigurations/PRIVATEENDPOINTIPCONFIG.687B623B-B295-415E-96ED-FCD2BA0ED0F9"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOAIDEVUSEOPSGPT01-PE.NIC.3CF38E81-3616-495B-BB26-9843D0FF7BA2/ipConfigurations/PRIVATEENDPOINTIPCONFIG.7DEFB19B-6129-4151-B164-17E628D6DDCA"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOAPPDEVUSEOPSGPT01-PE.NIC.87C82D9F-9A9C-4292-A37C-020B545C80FA/ipConfigurations/PRIVATEENDPOINTIPCONFIG.E81B07A6-B8DE-4C98-B6A1-D71B72BD92A8"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOAPPDEVUSEOPSGPT02-PE.NIC.242E313E-B842-46CB-9DA2-A7EC48951DEA/ipConfigurations/PRIVATEENDPOINTIPCONFIG.F3E1318A-9556-48B6-880C-A9E7D5E5B4EA"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOCOSMOSDEVUSEOPSGPT01-PE.NIC.AB9B1201-AC7C-470E-9887-3EE2D604E1AF/ipConfigurations/PRIVATEENDPOINTIPCONFIG.59F91F6B-F6E8-451C-B36F-33E94173386C"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOFADEVUSEOPSGPT01-PE.NIC.C54BB08C-3E4C-43BF-84EB-8B3312E4C0F3/ipConfigurations/PRIVATEENDPOINTIPCONFIG.96F20CA1-0239-4933-981F-1046F25BD6B7"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOFREDEVUSEOPSGPT01-PE.NIC.BB53E855-D977-4EBA-BD6B-CC6433FFCAEE/ipConfigurations/PRIVATEENDPOINTIPCONFIG.A98D8EBB-CD05-4F78-8A72-59BFC0F6DDCB"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOLGDEVUSEOPSGPT01-PE.NIC.3301CC4E-DE5F-46E7-8214-CEC219C32E8B/ipConfigurations/PRIVATEENDPOINTIPCONFIG.D011B2C7-8A86-49FE-9B0E-61EC766508F8"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOSADEVUSEOPSGPT01-PE.NIC.DED4453D-0B43-4D79-9B43-2CEF3B90E389/ipConfigurations/PRIVATEENDPOINTIPCONFIG.D91DCD03-1F1F-4043-B1E4-6E3CF13D2420"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOSADEVUSEOPSGPT02-PE.NIC.3DA1DB7D-73CC-4E59-BCB7-C7BEF64C8E21/ipConfigurations/PRIVATEENDPOINTIPCONFIG.04A9AA92-D16C-4C71-B0C4-6C6EF168219E"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/TEST123-NIC/ipConfigurations/PRIVATEENDPOINTIPCONFIG.61B2998E-A9C3-4168-BCB3-464ED4EC0E8D"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkInterfaces/GOAPPDEVUSEOPSGPT03.NIC.16B024BB-FC3F-4D9A-B113-2F925004D331/ipConfigurations/PRIVATEENDPOINTIPCONFIG.3FBC3046-FC14-4D1F-9AD3-92F234D771EF"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkInterfaces/GOAPPDEVUSEOPSGPT06-PE.NIC.2AF5ECA0-B91B-4E2D-954E-63367BCDD838/ipConfigurations/PRIVATEENDPOINTIPCONFIG.D923179B-19F1-4511-9CBC-772389ADCF39"
                    }
                ],
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNPEP11510"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "eastus",
                            "westus",
                            "westus3"
                        ],
                        "service": "Microsoft.Storage"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                },
                "privateEndpoints": [
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GO-AZKV-DEV-USE-OPSGPT-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOACRDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOAIDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOAPPDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOAPPDEVUSEOPSGPT02-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOCOSMOSDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOFADEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOFREDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOLGDEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOSADEVUSEOPSGPT01-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/GOSADEVUSEOPSGPT02-PE"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/privateEndpoints/TEST123"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/privateEndpoints/GOAPPDEVUSEOPSGPT03"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/privateEndpoints/GOAPPDEVUSEOPSGPT06-PE"
                    }
                ],
                "purpose": "PrivateEndpoints"
            },
            "name": "GOSNPEP11510",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNPEP11510",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.160/27",
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNASPDEV115001"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [
                    {
                        "type": "Microsoft.Network/virtualNetworks/subnets/delegations",
                        "properties": {
                            "provisioningState": "Succeeded",
                            "actions": [
                                "Microsoft.Network/virtualNetworks/subnets/action"
                            ],
                            "serviceName": "Microsoft.Web/serverFarms"
                        },
                        "name": "Microsoft.Web.serverFarms",
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNASPDEV115001/delegations/Microsoft.Web.serverFarms",
                        "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
                    }
                ],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.AzureCosmosDB"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "eastus",
                            "westus",
                            "westus3"
                        ],
                        "service": "Microsoft.Storage"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.Web"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                },
                "serviceAssociationLinks": [
                    {
                        "type": "Microsoft.Network/virtualNetworks/subnets/serviceAssociationLinks",
                        "properties": {
                            "provisioningState": "Succeeded",
                            "locations": [],
                            "enabledForArmDeployments": false,
                            "linkedResourceType": "Microsoft.Web/serverfarms",
                            "allowDelete": false,
                            "subnetId": "00000000-0000-0000-0000-000000000000",
                            "link": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OpsGPT/providers/Microsoft.Web/serverfarms/go-asp-dev-use-opsgpt02"
                        },
                        "name": "AppServiceLink",
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNASPDEV115001/serviceAssociationLinks/AppServiceLink",
                        "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
                    }
                ]
            },
            "name": "GOSNASPDEV115001",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNASPDEV115001",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        },
        {
            "type": "Microsoft.Network/virtualNetworks/subnets",
            "properties": {
                "provisioningState": "Succeeded",
                "addressPrefix": "10.84.214.64/27",
                "ipConfigurations": [
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOVMDEVUSEBAST1-NIC/ipConfigurations/IPCONFIG1"
                    },
                    {
                        "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GO-RG-M-DEV-EUS-OPSGPT/providers/Microsoft.Network/networkInterfaces/GOVMDEVUSEOPSGPT01-NIC/ipConfigurations/IPCONFIG1"
                    }
                ],
                "ipamPoolPrefixAllocations": [],
                "privateLinkServiceNetworkPolicies": "Enabled",
                "networkSecurityGroup": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/networkSecurityGroups/GO_NSG_GOSNRDPDEV115101"
                },
                "privateEndpointNetworkPolicies": "Disabled",
                "delegations": [],
                "serviceEndpoints": [
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.KeyVault"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.CognitiveServices"
                    },
                    {
                        "provisioningState": "Succeeded",
                        "locations": [
                            "*"
                        ],
                        "service": "Microsoft.Web"
                    }
                ],
                "routeTable": {
                    "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/RG_RT_DEV_KNET/providers/Microsoft.Network/routeTables/RT_KNET_HA_DEV_EASTUS"
                }
            },
            "name": "GOSNRDPDEV115101",
            "id": "/subscriptions/3b5b2af8-7f07-4eea-b01c-cd2672a3fb5b/resourceGroups/GOAZRVNETDEV11500/providers/Microsoft.Network/virtualNetworks/GOAZRVNETDEV11500/subnets/GOSNRDPDEV115101",
            "etag": "W/\"f29e530e-edc0-4309-afed-5bb66934cbfc\""
        }
    ],
    "addressSpace": {
        "ipamPoolPrefixAllocations": [],
        "addressPrefixes": [
            "10.84.214.0/23"
        ]
    },
    "dhcpOptions": {
        "dnsServers": []
    }
}

