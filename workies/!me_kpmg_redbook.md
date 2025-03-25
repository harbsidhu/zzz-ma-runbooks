###############################################################################
Everything KPMG
Access, Commands && Random Information

###############################################################################




## P1//MIgo2azrapp03

What is the Teams MI Bridge link to connect to?
What is the ServiceNow incident number?
What is the Microsoft support ticket number?
Do we have the Microsoft ACE team engaged and on the call?
Has Cloud ops DL (go-fmoneplatformclo1@kpmg.com) been added to the support ticket?
Is there a T2 engineer on the call ?
Is the Microsoft Support ticket SEV A?
Is the Azure service still degraded?
Is there a Microsoft Support engineer joining the call?
Is the application team available?
Is the Application still degraded?
Has the application team tested the application recently?
What servers/services are impacted?
What regions are impacted?
What is the business impact?
Are there any other applications in the region impacted?
Have we reviewed all of the service degradation alerts in Azure to understand all impacted subscriptions?



## Windows Terminal Server
for RSAT tools
go2azrwts002
10.178.192.132
go2.kworld.kpmg.com

>> use local RDP with Global VPN
AMR : 
go2azrwts118    10.82.196.36  
go2azrwts119    10.82.196.37
go2azrwts120    10.82.196.38
go2azrwts121    10.82.196.39
go2azrwts122    10.82.196.40
go2azrwts123    10.82.196.41
 
EMA:
go2azrwts110    10.78.202.36  
go2azrwts111    10.78.202.37
go2azrwts112    10.78.202.38
go2azrwts113    10.78.202.39
go2azrwts114    10.78.202.40
go2azrwts115    10.78.202.41
go2azrwts116    10.78.202.42
go2azrwts117    10.78.202.43

Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object LastBootUpTime

## Squid Proxy Servers

Goazrproxy.kpmgdevcloud.kpmg.com
Port:8080
Exceptions: 10.180.*.*;10.178.*.*;10.179.*.*; 10.76.*.*,10.77.*.*;10.78.*.*; 10.79.*.*; 10.80.*.*; 10.81.*.*;10.82.*.*; *.kpmgdevcloud.kpmg.com;*.goappsdevcloud.kpmg.com;*.xxedevcloud.kpmg.com;*.goappsqacloud.kpmg.com;*.kpmgqacloud.kpmg.com;
*.goappsqacloud.kpmg.com;*.xxeqacloud.kpmg.com;*.kworld.kpmg.com
Next Action: Archiving the request.


"OpsTech Toolkit"
"The Incident Buster's Guide"
"SRE Survival Kit"
"The OpsPro Playbook"
"Techie's Troubleshooting Treasure"
"Code Red Ready Reckoner"
"The Uptime Keeper's Companion"
"Sys Admin's Secret Sauce"
"DevOps Decoder Ring"
"The On-Call Survival Guide"
"IT Crisis Crusher"
"TroubleTome"
"CrisisCracker"
"IncidentIntel"
"OpsOracle"
"TechTactician"
"AlertAlmanac"
"SysSavior"
"DevDecoder"


//////////////////////////////

so long story short
Pool Level - No Zone Redundancy enabled
SQL server level - No Failover Group configured
Database level - No replica configured 

## ADO Branching
Access the "Source Control" tab on the left side of VSCode
Click on the "three small dots" next to the refresh button
Click on the "Checkout to..." option
Choose the branch you want to switch to


## EXCEL FORMULAE

=COUNTA(G2:G918)
=COUNTIF(G2:G918, "Enabled")
=COUNTIF(G2:G918, "Disabled")
=COUNTIF(G2:G918, "No Blob Storage Found")

=COUNTA(A:A)
=COUNTIF(A:A, "GO-M*")
=COUNTIF('Total'!A:A, "GO-M*")

>Conditional Formatting. Select column beofre running
=COUNTIF(Sheet2!A:A, A1)=0
=COUNTIF(Sheet2!B:B, F1)=0 
  #compare column F in Sheet1 with column B in Sheet2, highlight cells in column F of Sheet1 that do not match any cell in column B of Sheet2

=COUNTIFS(E:E, "Owner", G:G, "Subscription Level")
  #checks two conditions: it counts the cells in column E that contain the text "Owner" and simultaneously checks that the corresponding cells in column G contain the text "Subscription Level".


=COUNTIF(GOSNBEI11510!$A$1:$A$50,CONCATENATE($A1,$B1,$C1))=0


>> Match 2 Columns within the Same Sheet
    in an empty cell in Col C, enter formula below and copy to all rows
    =IF(A2=B2,"Match","No Match")       --> compares the 2 colms and displays the row values match or no match

>> Find Name in both Columns
    Select the data >> ConditionalFormatting >> Highlight Cell Rules >> Duplicate Values >> Select 'Duplicate' and formatting

>> Find Names that are in one column only
    Select the data >> ConditionalFormatting >> Highlight Cell Rules >> Duplicate Values >> Select "Unique"' and formatting

    =VLOOKUP($A2,$B$2:$B$(,1,1))

>> Prefix "global-its-ceops-" for all values in column B 
    create new column C  and copy all values from column B
    use formula below in first cell and drag down 

    ="global-its-ceops-" & B1

>> count chars
    =LEN("global-its-ceops-fa-azure-subscription-unknown-role-cleanup-durable")



  
>> List files in a folder and subfolders
Get-ChildItem -Path "E:\abcd" -Filter "*.ps1" -Recurse | 
    Select-Object @{Name='FileName';Expression={$_.Name}},
                  @{Name='FilePath';Expression={$_.FullName}},
                  @{Name='SizeInMB';Expression={[math]::Round($_.Length/1MB, 2)}},
                  LastWriteTime,
                  CreationTime |
    Export-Csv -Path "E:\ps1_files_list.csv" -NoTypeInformation

Get-ChildItem -Path "F:\" -Filter "*.ps1" -Recurse | 
    Select-Object @{Name='FileName';Expression={$_.Name}},
                  @{Name='FilePath';Expression={$_.FullName}},
                  @{Name='Size';Expression={[string]([math]::Round($_.Length/1KB, 2)) + " KB"}},
                  LastWriteTime,
                  CreationTime |
    Export-Csv -Path "E:\ps1_files_list_F_KB.csv" -NoTypeInformation


/////////////////////////////


## Reference URLs
>> GT&K
  https://spo-global.kpmg.com/sites/GO-OI-BUS-GTK/SitePages/OnePlatform.aspx

>> One Platform Architecture
  https://spo-global.kpmg.com/sites/GO-One_Platform_Architecture/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FGO%2DOne%5FPlatform%5FArchitecture%2FShared%20Documents%2FBrown%20Bag%20and%20Deepdive%20Sessions

  https://spo-global.kpmg.com/sites/GO-OnePlatform-CloudEnterpriseChapter/Shared%20Documents/Forms/AllItems.aspx?FolderCTID=0x01200054537B88A82A084D8BA6CC6B4BA04D05&id=%2Fsites%2FGO%2DOnePlatform%2DCloudEnterpriseChapter%2FShared%20Documents%2FGeneral%2FCloud%20Enterprise&viewid=894c817d%2D4cac%2D4b03%2D8b13%2D2551437f6138

>> Cloud University
  https://onedrive-global.kpmg.com/personal/rahulchoudhury_kpmg_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Frahulchoudhury%5Fkpmg%5Fcom%2FDocuments%2FCloud%20University&ga=1

>> Karthik J
  KPMG Regions and Member Firm Structure -> https://spo-global.kpmg.com/sites/go-oi-intranet/SitePages/MF-and-region-sites.aspx 
  OnePlatform Product Sheets -> https://intra.ema.kpmg.com/sites/oneplatform/Pages/Product-Sheets.aspx
	OnePlatform Page -> https://spo-global.kpmg.com/sites/GO-OI-BUS-GTK/SitePages/One-Platform-Operations-Home.aspx 
  OnePlatform -> https://spo-global.kpmg.com/sites/GO-OI-BUS-GTK/SitePages/One-Platform-FAQ.aspx 
  KPMG Marketplace Training -> https://intra.ema.kpmg.com/sites/ITSGLOBAL/productsandservices/Marketplace/_layouts/15/WopiFrame2.aspx?sourcedoc=/sites/ITSGLOBAL/productsandservices/Marketplace/Lists/KPMGDocumentLibrary/KPMG%20Marketplace%20Upgrade%20Training%20Guide.pptx&action=default
	Training Pre-requisite for access to SNOW -> https://intra.ema.kpmg.com/sites/ITSGLOBAL/departments/servicemanagementoffice/internal/Pages/Training.aspx
  Service Management -> https://intra.ema.kpmg.com/sites/ITSGLOBAL/departments/servicemanagementoffice/Pages/Process.aspx (MIM, Change Management, KM, PM, Request Management etc.,)

>> New Account Creation
Send mail to Kenny for approval of access to GO-DLCloudEnterpriseASPAC@kpmg.com --- Kenny

Azure AD Group Addition	https://kpmggoprod.service-now.com/sp?id=sc_cat_item&sys_id=7dcdc6ea37cff2006fbe359b34990ec1

>> To Create GO-CLD-<account-id> accounts
REQ1397873//RITM1416870 GO-CLD accounts - Azure Management KPMG\GO-CLD-hsidhu2 GO-CLD-hsidhu2 
REQ1397869//RITM1416866 GO-CLD accounts - Development KPMGDEVCLOUD\GO-CLD-hsidhu2 GO-CLD-hsidhu2
REQ1397865//RITM1416862 GO-CLD accounts - QA KPMGQACLOUD\GO-CLD-hsidhu2 GO-CLD-hsidhu2 
REQ1397876//RITM1416873 GO-CLD accounts - China You already have an Azure Admin user account: GO-CLD-hsidhu2 
REQ1397857//RITM1416854 GO-CLD accounts - Prod You already have an Azure Admin user account: GO-CLD-hsidhu2 
REQ1401395//RITM1420491 Have account onboarded to Azure Management tenant - GO-CLD-hsidhu2
REQ1401398//RITM1420494 Create account in Azure China tenant - GO-CLD-hsidhu2

>> For Access to Azure Subscriptions
REQ1431086//RITM1450690 Add my GO-CLD-hsidhu2 Security Group GO-SG CLD KPMG Cloud Central Tier III
REQ1431101//RITM1450705 Add my GO-CLD-hsidhu2 Security Group GO-SG CLD KPMGDev Cloud Central Tier III
REQ1431103//RITM1450707 Add my GO-CLD-hsidhu2 Security Group GO-SG CLD KPMGQA Cloud Central Tier III
REQ1431105//RITM1450709 Add my GO-CLD-hsidhu2 Security Group GO-SG CLD Cloud Central Tier III

>> Contacts && DLs
for any issues pls reach out to OPS manager DL and call them
Dey Shyaml/ Arindam Mondal/ Dev Sharma, Dharm -- Hosting team
Sai Naga katakam/ Atreye Bose  --- Linux
Vivekanand Pandey/Rahul -- Network Related
SCCM --> Punnet Naman -- SCCM
Ops manager --> go-dloneplatformopsm@kpmg.com GO-DL One Platform Ops Managers <go-dloneplatformopsm@kpmg.com>
      Bose, Atreyee <abose8@kpmg.com>; Chowdhury, Swagata Hazra <schowdhury13@kpmg.com>; Nandy, Argha <arghanandy@kpmg.com>; Sarkar, Saayan <Saayans@Kpmg.Com>
Azure T2 ops group DL --> go-dloneplatformazuretierII@kpmg.com GO-DL ITS Global Platform Operations Azure Tier 2 <go-dloneplatformazuretierII@kpmg.com>

AKS --> GO-DL ITS Global Platform Operations Azure Tier 2 - AKS <go-dlitsglobalplat2@kpmg.com>
     
Hosting --> GO-DL ITS Global Platform Operations Azure Tier 2 – Hosting <go-dlitsglobalpla@Kpmg.Com>
      
Networking --> GO-DL ITS Global Platform Operations Azure Tier 2 - Networking <go-dlitsazurenetwork@kpmg.com> 
      
IDM T2 DL --> GO-DL ITS Global Platform Operations IDM Tier 2 <go-dlitsglobalidmsup@kpmg.com>

Linux T2 DL --> GO-DL ITS Global Platform Operations Azure Linux Tier 2 <go-dlitsgloballinuxs@kpmg.com>  

SCCM --> GO-DL ITS Global Platform Operations System Center go-dlitsgblsyscentersupport@Kpmg.Com

GO-DL ITS Global Platform Operations Azure Tier 3 <go-dlitsglobaloneplatformcloudservicestieriiioperations@kpmg.com>
GO-DL ITS Global Platform Operations Azure Tier 2 <go-dloneplatformazuretierII@kpmg.com>

SGMSASPACPRDAGWETHISCSLINE01

Global VPN --> GO-DL ITS Global Connectivity and Datacenters go-dlitsglobalconne3@kpmg.com 

CE Tier 3 --> 
GO-DL ITS Global Platform Ops Cloud Enterprise Chapter <GO-DLCloudEnterpriseChapter@Kpmg.Com>
GO-DL ITS Global Platform Ops Cloud Enterprise Chapter - EMA <GO-DLCloudEnterpriseEMA@Kpmg.Com>
GO-DL ITS Global Platform Ops Cloud Enterprise Chapter - ASPAC <GO-DLCloudEnterpriseASPAC@Kpmg.Com>
GO-DL ITS Global Platform Ops Cloud Enterprise Chapter - AMR <GO-DLCloudEnterpriseAMR@Kpmg.Com>
CE tier3 FM --> GO-FM One Platform Cloud Enterprise Operations go-fmoneplatformclo1@kpmg.com


GO-SG ITS Global Platform Operations CE Azure Tier 3 - CLD

>> Proxy
10.180.8.4:8080
10.180.*.*;10.178.*.*;*.kpmgdevcloud.kpmg.com;*.goappsdevcloud.kpmg.com;*.xxedevcloud.kpmg.com;*.goappsqacloud.kpmg.com;*.kpmgqacloud.kpmg.com;*.goappsqacloud.kpmg.com;*.xxeqacloud.kpmg.com;*.kworld.kpmg.com;168.63.129.16;169.254.169.254

>>> DEV Proxy
IP 10.180.0.8
Goazrproxy.kpmgdevcloud.kpmg.com
Port:8080
Exceptions: 10.180.*.*;10.178.*.*;10.179.*.*; 10.76.*.*,10.77.*.*;10.78.*.*; 10.79.*.*; 10.80.*.*; 10.81.*.*;10.82.*.*; *.kpmgdevcloud.kpmg.com;*.goappsdevcloud.kpmg.com;*.xxedevcloud.kpmg.com;*.goappsqacloud.kpmg.com;*.kpmgqacloud.kpmg.com;
*.goappsqacloud.kpmg.com;*.xxeqacloud.kpmg.com;*.kworld.kpmg.com.



>> KT Sessions
  5 tenants--> kpmg prod,kpmg qa, kpmgdev, go azrmgmt, china
  domains --> kpmg.com, kpmgqa.com, kpmgqa.com, goapps

  tier3 ops >> tier2 ops
	
https://ea-reports.kworld.kpmg.com/APM/powerbi/Portfolio%20Reports/Services%20Details?filter=TechnologyServiceFamiliesCatalog%2FID%20eq%20%27800091%27&rs:Command=Render&rc:Toolbar=false

types of services
global hosting
  - aspac, ema, amr (actual azure dcs) 
  - hub/spoke

satellite hosting
  - global regional site confined to a country

country hosting
	- just a subscription under the global kpmg tenant
	- separate logically using mgmt groups

	- internet proxy firewall is shared

	total 4 tenants + 1 china
	KPMG - Prd, GOAZRMANAGEMENT - Prd, KPMGQA - QA, KPMGDEV - Dev, CN Tenant - Prd
	prod
	goprod
	qa
	dev

	tenant > subscriptions > resource groups > resources
	mgmt groups

intake bring projects
one platform

https://kpmggoprod.service-now.com/nav_to.do?uri=%2Fchange_request.do%3Fsys_id%3D9aa2aa051bff9d94e8c521fde54bcb43%26sysparm_stack%3D%26sysparm_view%3D

https://kpmggoprod.service-now.com/nav_to.do?uri=%2Fsc_req_item.do%3Fsys_id%3D293da5241b582954d078653ce54bcb2b%26sysparm_stack%3D%26sysparm_view%3D

>> Microsoft POD ((People on Demand))
  utliise them for any azure questions/help/guidance
  kpmgazurepod@microsoft.com


>> RITM1695689///SCTASK4428912
Mail Subj: Machine is at 100 percent CPU and will not login - TrackingID#2302070040007641
Set up Log Analytics in Canadian KCw Satellite and attach goaazrapp1473 and 1480 to the workspace
Availibility Set > audcaprdkcwapp006
Log Analytics Workspace > law-audprdca-kcwoa1
Monitor > Data Collection Rules >> dcr-audprdca-kcwoa1

Log into the Prod KPMG tenant
Go to Azure Monitor
Open DCR
  dcr-audprdca-kcwoa1
Go to resources
Add servers
  goaazrapp1473
  goaazrapp1480

https://portal.azure.com/?feature.msaljs=false#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/metrics



## KRDS Deployment 
SCTASK4884751 ((RITM1917804))
https://kpmggoprod.service-now.com/sc_task.do?sys_id=2467ea801b762d90789062cce54bcb18&sysparm_view=&sysparm_domain=null&sysparm_domain_scope=null&sysparm_record_row=2&sysparm_record_rows=2&sysparm_record_list=assignment_group%3d970cfdf31b5b4c1491fcedb7bd4bcbc5%5eapproval!%3drejected%5eactive%3dtrue%5enumberSTARTSWITHSCTASK%5eORDERBYnumber


1. Need to know the info in regards to security groups of DEV and QA tenants with their domain information
    GO-SG CLD KPMGDev Cloud Central Tier III -- kpmgdev domain
    GO-SG CLD KPMGQA Cloud Central Tier III  -- kpmgqa domain
2. Ops need to validate the pre reqs as mentioned in Ops documentation, such as VMname, subnet, available IPs etc
    

## Grafana
[6:10 am] O'Donnell, MikeGrafana URL Design Decision
    Current Plan
Host Grafana on https://grafanadev.kpmg.com, https://grafanaqa.kpmg.com, https://grafana.kpmg.com.

The Problem
In order to run Grafana internal to KPMG and not exposed to the public, we need to run Grafana on kworld.kpmg.com.  

Potential Solution 1
Update the Grafana licenses again to the URLs below.
https://grafanadev.kworld.kpmg.com
https://grafanaqa.kworld.kpmg.com
https://grafana.kworld.kpmg.com

This would allow us to run Grafana as intended.  We can then create DNS records to point the container app.  The downside is that we'd need separate SSL certs for each URL.  Could potentially add some admin overhead.

Potential Solution 2

Update the Grafana licenses again to the URLs below.
https://dev.grafana.kworld.kpmg.com
https://qa.grafana.kworld.kpmg.com
https://prd.grafana.kworld.kpmg.com

This would allow us to run Grafana as intended.  The advantage of these URLs is that we could then use a wildcard cert *.grafana.kworld.kpmg.com for all environment.  Less management overhead.

We could then create a CNAME record for grafana.kpmg.com or grafana.kworld.kpmg.com that points to https://prd.grafana.kworld.kpmg.com so that we have a friendly URL while taking advantage of wild card certs.

The Ask
White, Kenny Molnar, Shaun Throop, David W can you please provide feedback on the solutions and let us know if you have any preference or other ideas before we go back to Grafana and ask them to update the Root URL on the license again?

<https://teams.microsoft.com/l/message/19:68887fda4ffc429ca7c8c14fa2a1897f@thread.tacv2/1684267853649?tenantId=deff24bb-2089-4400-8c8e-f71e680378b2&amp;groupId=0e812702-8a04-4714-b422-00b432f9d691&amp;parentMessageId=1684267853649&amp;teamName=GO - One Platform - Cloud Enterprise Chapter&amp;channelName=Grafana Project&amp;createdTime=1684267853649&amp;allowXTenantAccess=false>






















#######################################################################################################################################
###################################################################################################################################


