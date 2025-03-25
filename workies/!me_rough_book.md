###############################################################################
Rough Book -- Just Some Random Bits


###############################################################################

Confluence doco
  -- https://go-oneplatform.atlassian.net/wiki/x/AgC0Ig
  
Code Repo Rename
Focus//Scope >> go-infrastructure Go OP Cloud Enterprise Operations repositories. 
  -- [function]-[line of business]-[other segments]
  -- proposed/rename global-its-<othersegment>
  -- add required files - license/update reademe

Created PS scripts
  -- export repo detials from input file
  -- export repo/pipeline from input file
  -- repo rename
  -- repo-rollback-rename
  -- repo clone for adding required files

  https://go-infrastructure.visualstudio.com/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-Psh_ScriptRepository?path=/Azure%20DevOps

  All scripts run an export at the end

Export to CSV
  -- show export

Show final repo
  -- https://go-infrastructure.visualstudio.com/Go%20OP%20Cloud%20Enterprise%20Operations/_git/global-its-ceops-Ce-Ops-Automation

Confluence doco
  -- https://go-oneplatform.atlassian.net/wiki/x/AgC0Ig





## Log internet connection outages in windows 10
      Event Viewer > Applications And Services Logs > Microsoft > Windows > UniversalTelemetryClient

Environment        : AzureCloud
Subscription       : 32d8b2c8-b605-409a-8d7c-c47fb68eda56
Tenant             : cf59843c-25a6-4e9e-a632-73d41e867a1f
TokenCache         : 
VersionProfile     : 
ExtendedProperties : {}

VM-  hundevazrweb001
Subscription  5  of Tenant  kpmgdev
WARNING: Unable to acquire token for tenant 'cf59843c-25a6-4e9e-a632-73d41e867a1f' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
'
WARNING: Unable to acquire token for tenant '' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.'
Select-AzSubscription : Please provide a valid tenant or a valid subscription.
At line:145 char:13
+             Select-AzSubscription $sub.Id
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Set-AzContext], ArgumentException
    + FullyQualifiedErrorId : Microsoft.Azure.Commands.Profile.SetAzureRMContextCommand
 
Get-AzVM : Your Azure credentials have not been set up or have expired, please run Connect-AzAccount to set up your Azure credentials.
SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
At line:146 char:29
+             foreach ($vm in Get-AzVM)
+                             ~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Get-AzVM], AzPSArgumentException
    + FullyQualifiedErrorId : Microsoft.Azure.Commands.Compute.GetAzureVMCommand
 
Subscription  6  of Tenant  kpmgdev
WARNING: Unable to acquire token for tenant 'cf59843c-25a6-4e9e-a632-73d41e867a1f' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
'
WARNING: Unable to acquire token for tenant '' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.'
Select-AzSubscription : Please provide a valid tenant or a valid subscription.
At line:145 char:13
+             Select-AzSubscription $sub.Id
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Set-AzContext], ArgumentException
    + FullyQualifiedErrorId : Microsoft.Azure.Commands.Profile.SetAzureRMContextCommand
 
Get-AzVM : Your Azure credentials have not been set up or have expired, please run Connect-AzAccount to set up your Azure credentials.
SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
At line:146 char:29
+             foreach ($vm in Get-AzVM)
+                             ~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Get-AzVM], AzPSArgumentException
    + FullyQualifiedErrorId : Microsoft.Azure.Commands.Compute.GetAzureVMCommand
 
Subscription  7  of Tenant  kpmgdev
WARNING: Unable to acquire token for tenant 'cf59843c-25a6-4e9e-a632-73d41e867a1f' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
'
WARNING: Unable to acquire token for tenant '' with error 'SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.'
Select-AzSubscription : Please provide a valid tenant or a valid subscription.
At line:145 char:13
+             Select-AzSubscription $sub.Id
+             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Set-AzContext], ArgumentException
    + FullyQualifiedErrorId : Microsoft.Azure.Commands.Profile.SetAzureRMContextCommand
 
Get-AzVM : Your Azure credentials have not been set up or have expired, please run Connect-AzAccount to set up your Azure credentials.
SharedTokenCacheCredential authentication unavailable. No accounts were found in the cache.
At line:146 char:29
+             foreach ($vm in Get-AzVM)
+                             ~~~~~~~~
    + CategoryInfo          : CloseError: (:) [Get-AzVM], AzPSArgumentException


///////////////////////////////////////////////

Service Bus API Call : Success

############################

Success Condition

WARNING: Retry Attempt Catch block : '1'

Caught an exception:

Exception Message: Exception calling "GetResponse" with "0" argument(s): "The remote server returned an error: (502) Bad Gateway."


from what I can see, the actual physical ado agents are only 2 , GOAAZRAPP499 and GOAAZRAPP498, and automation team just configured 10+ ADO services on these 2 VMs, so totally around 30 services . 
they do have other 30 ADO agent services within the same pool, but looks for the Teams Creation this type of requests, the pipeline will only use services that belong to GOAAZRAPP499 and GOAAZRAPP498.  this is the configuration on the ADO pipeline itself with specific "Demand" setup, so actually half of the pool is in IDLE...
this is the summary I will send through to automation team as well

GO2-SG ITS Global Platform Operations CE Hosting Tier 3

GO-SG AAD ITS Global Platform Operations CE Tier 3
GO-SG ITS Global Platform Operations CE Hosting Tier 3


https://kpmggostag.service-now.com/cmdb_ci_computer_list.do?sysparm_first_row=1&sysparm_query=GOTOname%3e%3dgo2pazrapp015&sysparm_query_encoded=GOTOname%3e%3dgo2pazrapp015&sysparm_view=

cmdb_ci_computer.LIST
https://kpmggostag.service-now.com/cmdb_ci_computer_list.do?sysparm_first_row=1&sysparm_query=GOTOname%3e%3dgo2pazrapp015&sysparm_query_encoded=GOTOname%3e%3dgo2pazrapp015&sysparm_view=


goappdevuseopsgpt01

https://kpmggostag.service-now.com/now/nav/ui/classic/params/target/incident.do%3Fsys_id%3D7c4142ef37912e00da3804e954990eeb%26sysparm_record_target%3Dincident%26sysparm_record_row%3D1%26sysparm_record_rows%3D1651067%26sysparm_record_list%3Du_tenantsCONTAINS0a47fe703702da00e4b58f9754990e43%255EORcaller_id%253Da6af55191b82d554ee3762cce54bcbdd%255EORopened_by%253Da6af55191b82d554ee3762cce54bcbdd%255EORwatch_listCONTAINSa6af55191b82d554ee3762cce54bcbdd%255EORu_tenantsCONTAINS9584ecd4c35ace10f8684145990131ba%255EORDERBYnumber


https://kpmggostag.service-now.com/now/nav/ui/classic/params/target/incident.do
%3F
sys_id%3D7c4142ef37912e00da3804e954990eeb%26
sysparm_record_target%3
Dincident%26
sysparm_record_row%3D1%26
sysparm_record_rows%3D1651125%26
sysparm_record_list%3
Du_tenantsCONTAINS0a47fe703702da00e4b58f9754990e43%255EOR
caller_id%253Da6af55191b82d554ee3762cce54bcbdd%255EOR
opened_by%253Da6af55191b82d554ee3762cce54bcbdd%255EOR
watch_listCONTAINSa6af55191b82d554ee3762cce54bcbdd%255EOR
u_tenantsCONTAINS9584ecd4c35ace10f8684145990131ba%255EORDERBYnumber











---


---





OpsGPT Qs

what are the steps to create subscription in azure china tenant
  what administrative credentials to use to connect to create subscription in azure china tenant
  is azure china subscription created through automation
  tell me what roles are created 
  which group is added to contributor role when creating azure subscription

what is kcw automation handover 
  detailed design document for kcw
  kcw automation components
  what are the security controls for kcfc

how to get global vpn access
  do i need approval
  how do i setup rsa token
  how do i configure global vpn profiles
  give me an example of business justification

is grafana deployed
  what is mysql database configuration
  do we have a process to connect to grafana support
  summarise roles and permissions setup
  list dev security groups

how to troubleshoot issues related to FunctionWarningsAndErrors

what are the guidelines to create confluence page

how to setup ado pipeline

how to provision reader rbac for chapter heads




NMAP issue 
KPMGQA
CyberArk PTA server goqazrapp044 
goqazrapp044.kpmgqacloud.kpmg.com

RITM2363209 to reboot the server - this has been fulfilled (see attached SCTASK5669114) – Allan please provide your added confirmation for this.
  completed

RITM2365485 - provide server access details for dates and times provided
  1. RITM2365485 - provide server access details for dates and times provided
  a. The information was shared to Libbi today
  i. Essentially there are 5 accounts logged across the various points in time in the request but nothing consistent across each of those times
  1. go-svccfgxmgmt – Linux Automation Service account
  2. kpmguser – T2 Linux break glass local account – I’ve asked TCS to further comment why this account is used instead of their own domain accounts when logging in from their Ansible server
  3. go-svcdiskpmgqacloud – this appears to be the Global SNOW service account or at least stemming from that SNOW server. Perhaps SNOW discovery? I’ve Ping’d John Chui and Adrian Chan for comment.
  4. go-tdolui – Libbi stated this is a PAM team member Tamal Dolui
  b. There is a call set up for 8am ET with Libbi, Joel Rodriguez and Gertjan Koetsier (my EMA counterpart) to further discuss next actions or requests based on the info provided.
  i. I’ll share the spreadsheet with Gertjan in our handover Teams Channel so he has it for the morning call.

REQ2333868 determine if Rshift script is on server –Allan, @Chakraborty, Pranab of the Linux team is unsure how to proceed with this. He does not see a file with the rshift name. Please confer with @Taylor, Michael with assistance if needed as he was the one to point out the need to check this.
  Rejected

CE Ops
Does your team have pseudo access to the server so that you can tell me at 2023-10-02T12:37:28 (the last time the utility was run on the server) who had access to it? 

What are we looking to answer:
Why/How is NMAP getting installed?
  NMAP gets auto installed post deployment during the first patching/update. We are working with the team to introduce the process of removing NMAP during OAT post deployment
Who or what is running these commands using NMAP?
  As per the details that were shared by Pranab against RITM2365485 for “Provide access details for goqazrapp044.kpmgqacloud.kpmg.com”, we can find the users that logged in to the server and the server IPs they used to log in

go-svccfgxmgmt >> id is used for patching purposes and to get the server security updates from Red Hat & Microsoft every Tuesday
kpmguser >> automation scripts running on Ansible for fetching reports and the automation scripts automatically uses the “kpmguser” account to login to the servers and fetch the reports from the servers
  Now, the 2 IDs that are highlighted in yellow are used by One Platform Linux team but if you check, all the login(s) that happened using these 2 IDs are from the IP 10.180.6.14, which is that of the Ansible server (if any Linux team member would have used these IDs to log in, their Terminal server IPs would have shown here and not the Ansible server IP

go-svcdiskpmgqacloud
go-tdolui


########################################################

As per MS recommendations, Memory Dump was configured and VMs rebooted day before yesterday
VMs unresponsive again today
Actions taken
goaazrdb556 > 
  started collection of memory dump > VM rebooted
  dump failed for lack of free disk space %systemroot% C:\ , availabe free space was 38GB where requird was >128GB (higher tham Memory size)
  reconfigured memory dump file to H:\Memory_Dump\memory.dmp
  during arraging a outage window to reboot, VM became unresponsive
  engaging MS to collect memory dump

goaazrdb557 > 
  performed a normal reboot > services back up and running. Confirmed by Vishnu

------------
Before we go into detail, I first want to check if everything is ok? Are there any personal issues that are impacting your work currently Harb? If there is, is there anything I can do to help or support you? Do you want me to pickup on daily handovers?

My observations today are: 

What was discussed on the handover call? 
Handover was an hour a ago, can I ask why there are no handover notes?
The handover spreadsheet hasn't been updated
No update for me post handover  
I see the P1 KcW Swiss Server incident has no details updated in it since yesterday 
What is the update on the KcW retention issue
There are pending approvals in the queue
How did the AU member firm change go last night, have the intermittent internet issues been resolved?
What is the status of the AU Azure outage? are all service back online?

We need to keep track of what we are supporting, hence the use of the spreadsheet until we come up with a better solution.  I am open to suggestions on how we do things better.  We are operational support and need to stay on top of all the issues that we are involved in.

---------------------------------------

AMR Handover

KCw Retention Server issue
- Last update shared by Shery in the group chat
- Progress during ASPAC timezone

Suisse DB Servers
- Memory dump was created for goaazrdb556
- Uploaded the dump file to MSFT through secure file transfer
- Uploaded dump files broken at each attempts (3)
- MSFT recommends two options
  - reduce the VM memory size to 64GB to reduce dump file size and genearted dump file 
  - generate new dump file 
- Waiting for confirmation from Sumendu Roy to confirm downsizing of the VM

Azure AU Region Service
- All Azure Services are green as per Azure Portal

AU Member Firm change
- 

Re: PBAT VM - Upgrade Edge / Chrome browser Drivers to v116
- 
- this is an fyi being handled by T2



Action:

Creating Memory Dump for the VMs and then will perform a reboot

goaazrdb556 > collecting memory dump > once memory dump is complete VM will be rebooted
goaazrdb557 > to follow after 556


MS Case Raised: 2308290040002055
 * KCW swiss DB servers goaazrdb556 and goaazrdb557 unresponsive multiple times since yesterday until we reboot each time.
 * In the Event logs SSAS and Windows Defender advance Threat Protections servers went to hung state on starting. 
*  SSMS.exe stopped interacting with Windows and was closed
*  Started seeing osrdt SQL errors on these Vm's. There seems to be issue with SQL
*  MS Team mentioned that Symantec is still running on these VM'. Symantec got uninstalled on 26th August and  request MS to share more details of the Symantec Services 
*  No Spike observed in  CPU and Memory 
*  MS suggest to configure Full Memory Dumb for further analysis.
*  Received the approval from business to reboot the VM's to Prepare the Memory Dumb.
 

Next Actions 
VM's will reboot between 1:00 AM CET to 2:00 AM CET i.e. 4.30 AM IST to 5.30 AM IST and  will share the logs to MS (Tier 2 Ops) 

 Thanks for the detailed clarification. It is really helpful and does clear the confusion.
 Much appreciated.

 

 One more thing, "when dealing with app teams and customers" all sub

Since there has been no response from the requester, we are proceeding with rejection as per our established process.

As per procedure all subscription access require approval from the subscription owner, in this instance is Mick Taylor, Michael.Taylor@kpmg.co.uk
Please provide approval for the same.

As per procedure all subscription access require approval from the subscription owner, in this instance is Mick Taylor, Michael.Taylor@kpmg.co.uk
Please attach approval from the subscription owner

Subscription

GO-M-QA Advisory AMR
Business Justification

goauewebdevcepline02.azurewebsites.net

Customer Requirement
Enable notification for successful backups for all VM in a Subscription

So far 
We have created a Log Analytics workspace to capture the metrics. Recovery Service Vaults have the relevant diagnostic settings enabled.
I have created a KQL query for full VM backup

Associated alerts and Action groups have been created to send emails. I am receiving the alerts but the they are using a standard format, see attached, does not provide a VM name, time etc.

Need assistance in creating email alerts which is more expllicit

  7 pm fir uk time to 4 am monday uk time >>> staging

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

I also require your clarification on approvals. Is my understanding correct,     for requests where "Azure Roles == Contributor roles"", approval from Subscription owner ((CI Owner)) mandatoryfor requests where "Subscription access required == Yes", approval from Subscription owner ((CI Owner)) man…


Hi Harbrinder, this is for T2 support engineer so its  a bit different than a giving an app support or customer access to a subscription.

if you look into AAD you will see that they will get their subscription access by adding them to the T2 hosting SG

: GO-SG ITS Global Platform Operation Azure Tier 2 Hosting – CLD for Subscription access

in AAD that SG has rights which will provide T2 owner rights across all the subscriptions in the Global subscription MG

i beleive the MP item mandates a subscription be selected.  so Sayanti likely just selected a subscription from the list

I also require your clarification on approvals. Is my understanding correct,     for requests where "Azure Roles == Contributor roles"", approval from Subscription owner ((CI Owner)) mandatoryfor requests where "Subscription access required == Yes", approval from Subscription owner ((CI Owner)) man…

But when dealing with app teams and customers, yes this is correct.  The subscription owner (typically Global or Function subscriptions) or Technical contact (typically member firm subscriptions) are required to provide that approval.  In this case its to onboard a T2 OP support engineer who is responsible for managing the customer Iaas and Paas resources.  We add them to a SG that is permissioned above all the managed subscriptions.  Does that help clarify?

happy to chat, i can stay a bit late if you'd like and sync up if that would be helpful as well.
thats the part im referrign to where once the CLD admin account is created in each tenant, they will add it to that SG.
$$$$$$$$$$$$$$$$$$$$$$$$$$$

goaazrapp1493
GO-M-AUDIT EMA
account admin -- GO-SvcAZRSubMgmt@goazrmanagement.onmicrosoft.com
service admin -- GO-SvcAZRSubMgmt@goazrmanagement.onmicrosoft.com

##################################
## KRDS Deployments

f16a3a17-1516-4761-b888-4bca708636b8  GO-SG AAD GISG KRDS Pentest Users
b61bc899-0405-41a1-bd64-cffb5d5e65db  GO-SG ITS Global Platform Cloud Services Automation - CLD
3f112818-cfe4-4826-9190-249035ab0635  GO-SG AAD ITS Global Platform Operations CE Tier 3

f19499c2-3293-424c-afaa-d11afe91056f  GO-DL TCS Vulnerability Management Support  Mail enabled security
go-dltcsvulnerabilit@kpmg.com

SCTASK4856536 ((RITM1918691))
go2azrprdavd001, go2azrprdavd002 and go2azrprdavd003
These VMs have been created based on SCTASK4856536 with the KRDs automation however this automation doesn't install the qualys agents on KRDs VMs as of yet and the automation team is working on it. For a GISG pen test on KRDs instances see parent RITM for this. Will discuss with Gertjan what the best way is to move forward on this.
    "taskNumber": "SCTASK4856536",
    "countryCode": "GO",
    "description": "GISG01",
    "environment": "PRD",
    "region": "ASPAC",
    "offering": "M",
    "vnetName": "GOAZRVNET16700",
    "vnetSubnetName": "GOSNBEI16741",
    "vnetResourceGroupName": "GOAZRVNET16700",
    "domainFqdn": "go2dev.kpmgdevcloud.kpmg.com",
    "domainNetbiosName": "go2dev",

SCTASK4906469 ((RITM1948185)) Install Qualys agents
go2azrprdavd001, go2azrprdavd002 and go2azrprdavd003

SCTASK4884751 ((RITM1917804))
go2azrdevavd001.go2dev.kpmgdevcloud.kpmg.com, go2azrdevavd002

  "taskNumber": "SCTASK4884751",
    "countryCode": "GO",
    "description": "Advisory01",
    "environment": "DEV",
    "offering": "M",
    "vnetName": "GOAZRVNETDEV2800",
    "vnetSubnetName": "GOSNBEI2820",
    "vnetResourceGroupName": "GOAZRVNETDEV2800",
    "domainFqdn": "go2dev.kpmgdevcloud.kpmg.com",
    "domainNetbiosName": "go2dev",

########################################

GO-AZRMGMT
UK Audit Subscription GO-M-Audit UK.

##########################################################################

GO-M-KPMG Audit Switzerland 997d6e3d-c903-41c6-842c-630676fbee3c
GOAZRVNET20300
GOAZRVNET20400

GO - PRD Platform Maturity Program - CCR  19efd616-850f-449f-9d34-b073fe5ee10b

Hi there, I need to confirm. What specific role do you need? What resource groups? Contributor at the subscription level is generally not approved for OnePlatform managed services.

CHG0398040


Vulnerability & Threat Management Platform (VTM) - PROD
GO-M-Audit UK
da118ea4-880a-4c0f-acf7-61d21431484f

Appiication Stopped!!!!
go-sg aad its global platform ops ce tier 3 for go-m-automation access


############################
P1 - INC02540271 Many Staging and Prod r1 ASPAC DB and application Servers are restarted unexpectedly. 
???
clearer picture
list of servers that have updated SEP
how did this happen - was it the SEP/Broadcom patch or human error
any uupdatefrom SEP/Broadcom

T2 backup around 2:30 pm
T2Ops Mgr AB till 11:30 am
conact is arindam mondal

P1 - INC02540271 Many Staging and Prod r1 ASPAC DB and application Servers are restarted unexpectedly.

SEP is phasing out, and MDAV is replacing it. 
There was a vulnerability reported on the ISB agents.
Nikolov, Todor said As of 31st of March there are ~3500 VMs affected with high severity vulnerability in SEP (CVE-2022-25631 with CVSS Base Score: 7.1)
T2 security team (Uttiya Datta) wasnt sure whether to upgrade the agents or not since MDAV was replacing it anyways. 
	
Punkaj recommended migrating to MDAV at the earliest while reaching out to SEP support for mitigation steps. (Shoubhick is actually involved in the MDAV project and has been sending CRs for Batch releases that have been successful so far)
	
So what the team was doing is they tried placing the Symantec agent executable file on the server in preparation for the upgrade per PRB0254758 | Problem | KPMG Global Service Desk (service-now.com)
	
However, security engineer accidentally executed the file on the servers. 
	
There are 167 ASPAC servers/agents that got upgraded, and 56 of these 167 are WVDs (windows virtual desktops used by associates to log in to kpmg environment) arent high impact. The process was stopped immediately so the remaining 2k+ servers encompassing Dev/QA/Prod (out of the 3500 mentioned earlier) arent impacted.

Just got of the call with Karthik and Shaun. We need the list of servers that were rebooted//upgrdaedde

#############################################

yyazrprx067



>> USER STORY 23791

New Starter -- Account Creation

Go-CLD Accounts for Azure Tenants
KPMG
KPMGDev
KMPG QA
GO-AZRManagement
China

DLs
ASPAC CE Group “GO-DL ITS Global Platform Ops Cloud Enterprise Chapter - ASPAC <GO-DLCloudEnterpriseASPAC@Kpmg.Com>

Functional Mailbox
go-fmoneplatformclo1@kpmg.com

Security Groups
Add G)-CLD accounts
GO-SG CLD KPMG Cloud Central Tier III
GO-SG CLD KPMGDev Cloud Central Tier III
GO-SG CLD KPMGQA Cloud Central Tier III
GO-SG CLD Cloud Central Tier III


Go Accounts
kpmg
goapps
go2
ccdev	
KPMGDEVCLOUD
GOAPPSDEVCLOUD
go2dev
ccqa
KPMGQACLOUD
GOAPPSQACLOUD
go2qa

Account Reference

Azure DevOps
https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_wiki/wikis/Go-OP-Cloud-Enterprise-Operations.wiki/3368/Request-Azure-DevOps-Access-and-License

Global VPN
Create account for Global VPN access in GO1 domain

KRDS Access
"KPMG\GO-SG AAD WVD Platform Ops" for KRDS

SquaredUp ((Use Chrome))
Require access to SqauredUp global monitoring application.
https://globalmonitoringportal.kworld.kpmg.com/SquaredUpv3

Microsoft Teams
GO - One Platform - Cloud Enterprise Chapter
GO - OnePlatform - Operations
GO - One Platform - Observability


>> One Platform

Today
Layer 1 - Infra Services --> Connectivity, Hosting, !AM, Security
Layer 2 - Productivity Tools --> EUC, Info Mgmgt,unified Comms
Layer 3 - Shared Services --> Data Mgmgt, Development, Integrated Services, Portal Services, Reporting & Analtics
Layer 4 - Business Applications --> Cleint-facing solutions, Internal applications
canada, aus, uk are satellite
fav sport is football (it's not soccer, )
Go OP Cloud Enterprise Operations
Require Azure DevOps Basic license to access the projects in go-infrastructure organisation
As a member of the ITS Global Cloud Enterprise team I require access to repos, pipelines, artifacts and other features in go-infrastructure organisation which requires a Basic license in Azure DevOps.
MI
what is done
what is being 

Marketplace Subscription - Business Function View
Marketplace Subscription - ITS Global Member firm Helpdesk View
L3 Platform Ops Cloud Enterprise - ITSG
APPR Business - ITSG Platform Ops Cloud Enterprise

TB --> APPR Technical - ITSG One Platform AKS
RK --> APPR Technical - ITSG Platform Ops Cloud Enterprise

Technical Onboarding to CE technologies and processes
Walkthrough sessions for
- Service-Now, access sorted and KT 
- Linux RHEL, KT 
- Ops Rota, understnding incidents, major incidents, and related tasks
- SNOW task management, approvals, updates, filters
- Access to functional mailbox
- 
sandbox
some info that needs to be provided to GISG, for Globerunner
update mobile in contacts for ops

GO-FM One Platform Cloud Enterprise Operations <go-fmoneplatformclo1@kpmg.com>
go-fmoneplatformclo1@kpmg.com 

kcw suuport group go-dltcskcwswatsuppo@kpmg.com

Next Training - Subhajit - Architecture references (explained)

Microsoft Escalation details - Shalini Bawa (Sr. CSAM), Darwin Abustan (SML), Chuck Shao (Incident Manager).

Escalation via MS Services Hub (verify access with Karthik), Azure Portal ticket
monitoring, Kenna, AppMon

KPMGI NITSO - Leonardo Botha ((Global IT Security))

Centralizing Reporting
Dashboarding
AI Pattern mapping. - Data Lake Phase 2 

>> Handover Agenda
Agenda:
Please be sure to cover the following topics daily:

Active problems or incidents
	
Incidents: Confirm that each open incident has a well understood plan and who is doing the actions, and if Chapter Leads need to be aware of any of them.
	
Approvals that have been waiting for more than 1 day (excluding the first day back from a weekend or holiday)
	
Problem tickets that have not been updated in 24 hours or longer
  Try to understand why problem tickets haven't been updated in more than 24 hours
  T3 Ops Rota engineers should be able to speak intelligently about open items on the problem report call
    Confirm who will speak to each L3 owned Problem ticket on the Problem management call.
	
Discuss work items that have the potential to be automated and create user stories 
	
Key infrastructure change request alignment
  It's important that all regions are aware of any key change potentially service impacting One Platform change requests occurring in the upcoming weekend. 
	I suggest a quick review on Thurs or Fri handovers would be a good practice.  
    Example: Mike T yesterday was unaware if the planned DDOS testing in W. Europe timing of 1am CET was correct or not.

