###############################################################################
Everything Cloud Enterprise Scrum 


###############################################################################


### USER STORY 26019 ASPAC RDS - Enable Backup Jobs Notifications on VMs
https://learn.microsoft.com/en-us/azure/backup/move-to-azure-monitor-alerts
https://techcommunity.microsoft.com/t5/azure-storage-blog/monitor-your-backups-effectively-using-azure-monitor-alerts-for/ba-p/2755670
https://techcommunity.microsoft.com/t5/azure/recovery-services-vault-backup-alerts-configure-notifications/m-p/1208466


https://learn.microsoft.com/en-us/azure/backup/backup-center-overview#next-steps
https://www.youtube.com/watch?v=j_1zBGk3LWY
https://www.youtube.com/watch?v=pFRMBSXZcUk

https://azure.microsoft.com/en-us/blog/backup-explorer-now-available-in-preview/

### Accelerated Networking

Driver versions are based on size of VM and the backend host
not reccomended to upgrade



### FY23.ASPAC.02.05
23791 [SPIKE] Update the Mellanox drivers for UK KCW
https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_sprints/taskboard/ASPAC/Go%20OP%20Cloud%20Enterprise%20Operations/ASPAC/FY23.ASPAC.Q2.05?workitem=23791

>>
Some of the Mellanox drivers are old so they require an update.
Mellanox ConnectX-4Lx Virtual Ethernet Adapter v2.0.19824.0 released in 2018.

>>
Create an overview of machines to be patches
work out how those machines can be patched
Work on a plan to implement with minimal impact
Obtain timing information from the UK
Advise implementation approach.

The Guidance from the UK (Brett Savill and Amit Patel) is that only for 
critical or
breakfix will be plan this upgrade in the freeze period
If outside the freeze period it is expected that that this work is already planned so it it not lost

>>>
If possible to execute: create work items to do the upgrade
RSS is another setting that should be considered in context of Accelerated Networking.  Ops have enabled Accelerated networking following recommendations from Microsoft following a KCw incident but we need to agree best practice with Product

>>>
Appropiate KCW VMs can be upgraded to Melanox drivers version 2.70.24728.0
Proposed implementation plan for all KCW subscriptions including:
Overview of machines to be updated (reporting the Melanox version)
Overview of machines to have the Melanox drivers installed for the first time
architecture (coming from the product team)
implementation approach

https://learn.microsoft.com/en-us/azure/virtual-network/accelerated-networking-overview
https://learn.microsoft.com/en-us/azure/virtual-network/accelerated-networking-how-it-works

The overview of the requirement is as below, requested by Gertjan
  Create List of VMs with Mellanox NICs ((Accelarted Networking Enabled))
  Determine the version of Mellanox drivers
  Create an overview of machines to be patched, upgraded to Mellanox drivers version 2.70.24728.0
  Work out how those machines can be patched
  Work on a plan to implement with minimal impact
  Obtain timing information from the UK
  Advise implementation approach.
  Enable Receive Side Scaling, as per Microsoft recommendations
  
  Currently, this is to plan the upgrade only. 


Create List of VM with Accelarted Networking Not Enabled
Create an overview of machines to be enable Accelerated Networking
Work on a plan to implement with minimal impact
Obtain timing information from the UK
Advise implementation approach.
Enable Receive Side Scaling, as per Microsoft recommendations


### Shaun
Sidhu, Harbrinder can you please review incidents with regards to operational stability and do the same, come up with a top 10 list of re-occurring stability issues.  Anything from failed backups, failed deployments, patching issues, version compliance etc etc
Kamalapuri, Raviteja can you please review incidents and requests from Tier 2 support for the last 6 months and identify some key areas that we could look at automating?  If you could please create a top 10 list of re-occurring requests/incidents so we can discuss as a team.  Please let me know if you need further scope/clarification cheers

### Knox
26019 ASPAC RDS - Enable Backup Jobs Notifications on VMs
https://dev.azure.com/go-infrastructure/Go%20OP%20Cloud%20Enterprise%20Operations/_sprints/backlog/ASPAC/Go%20OP%20Cloud%20Enterprise%20Operations/ASPAC/FY23.ASPAC.Q2.05?workitem=26019

maybe the details can be updtaed in SNOW and queried via an API / pipeline to update



////////////////////////////////////////////////////////////////////////////////////////////////

## FY23.ASPAC.Q1.07
  Conceptualise Azure VM Image Builder
  Key Takeaways
  SPIKE: investigate scope and approach to create a golden image for virtual machines (RHEL)

why

what
The idea is to create a standardised golden image for Azure VMs with baseline custom configurations, hardening for security and predefined softwrae like agents. This will ensure consistency across deployments.
The servie used will be Azure VM Image Builder 
https://learn.microsoft.com/en-us/azure/virtual-machines/image-builder-overview?tabs=azure-powershell

Supported OS Linux and Windows


////////////////////////////////////////////////////////////////////////////////////////////////
## FY23.ASPAC.Q1.06

>> 20444 - Update existing operational documents
  for each document:
  review a documents for accuracy
  ensure it is approved
  ensure it is use correct naming for departments
  If scripts are used ensure they are migrated to a repository and create a link to the repository in the document
  Correct typos
  get it signed of
  update the information on this document in the ISMS library
  Note that sometimes the ISMS library contains links to another library. Owner will be different but still validate the document.

  Please review the documents from the attached Excel file from line  030 - 035

  stakeholders are:
  product owner
  OPS leads
  TCS tier 2

  reference
  ISMS library 20221205.xls 
    https://spo-global.kpmg.com/sites/GO-One-Platform/003%20ISMS%20Applicable%20Documents/Forms/ISO%2027k%20Tracker%20Public.aspx?cid=ef3b1fd5%2D0dee%2D419a%2Db789%2D5260e4ef6c20

    
    A.13.1.1	ITSG_A13_203	Azure VM Squid Proxy Configuration.docx
    A.13.1.1	ITSG_A13_204	Squid Proxy Administration and Operation Guide.docx
    A.13.1.1	ITSG_A13_207	Squid infrastructure v1.0.docx
    A.13.1.1	ITSG_A13_307	Internet Palo Alto Administration, Configuration and Operation Guide.docx
    A.13.1.2	ITSG_A13_205	Azure Application Gateway Deployment Guide.docx
    A.13.1.3	ITSG_A13_303	Virtual Network Peering.docx

    A.13.1.3	ITSG_A13_311	Backup and Restore Procedure.docx
    A.13.1.3	ITSG_A13_311	VNET and Subnet creation Operation Guide.docx
    A.13.1.5	ITSG_CLD13_302	Resource Tagging.docx
    A.17	ITSG_A17_401	One Platform Disaster Recovery - Recovery Procedures, Redbooks & Process Flows.url
    A.17	ITSG_A17_NEW_1	Cloud Services Disaster Recovery Plan - Connectivity and Firewall Services.docx
    A.17.1.1, A.17.1.2, A.17.1.3, A.17.2.1	ITSG_A17_201	One Platform Disaster Recovery Plan.docx

    A.17.1.1, A.17.1.2, A.17.1.3, A.17.2.1	ITSG_A17_201	Draft One Platform Disaster Recovery Plan.docx
    A.17.1.1, A.17.1.2, A.17.1.3, A.17.2.1	ITSG_A17_201	One Platform Disaster Recovery Plan.url
    A.17.2.1	ITSG_A17_301	Internal and External Load Balancer Deployment Guide.docx
    A.6.1.1, A.6.1.2, CLD.6.3.1	ITSG_A6_202	Operations_and_Delivery_Responsibility_Matrix_CC V1.2.xlsx
    A.7.3.1	ITSG_A7_204	TCS Resource onboarding and offboarding process.docx
    A.8.1.1	ITSG_A8_503	Asset Register(AR)_OnePlatform_v1.1.xlsx

    

Review and Update - 
Review and Update Operations documents in ISMS Library
Name - 
ISO Control - A.13.1.1
Document ID - 
Link - 
Author - 


////////////////////////////////////////////////////////////////////////////////////////////////

## FY23.ASPAC.Q1.05
>> 19704 - Globerunner - Review for GISG

As requested, the servers for Globerunner are as follows:

Tenant  GOAZ: 10c56508-287b-4e6c-b256-8a3f70c191fb
Sub ID  GO-M-ClientReady: 1f29e8f4-8def-47ce-980a-ec10d291134b

Staging - grazrstgweb001
  RG    --> GOMCLTRDY_STG_GLOBERUNNER
  Virtual network/subnet  --> GOAZRVNET3300/GOSNFEI3330
  NSG   --> GO_NSG_GOSNFEI3330
  Disk
    OS disk grazrstgweb001-osdisk-20210412-073737
    Encryption at host Disabled
    Azure disk encryption  Not enabled
    Ephemeral OS disk N/A
    Data disks 0
  Availability + scaling
    Availability zone -
    Availability set EMASTGWEBGRGLOBERUNNERSTGAS01
    Scale Set -
    Fault domain 0

2)
grazrstgweb001-osdisk-20210412-073737
Standard HDD LRS
32
500
60
SSE with PMK

Staging - grazrstgdb001
  RG    --> GOMCLTRDY_STG_GLOBERUNNER
  Virtual network/subnet  --> GOAZRVNET3300/GOSNLEGI3330
  Disk
    OS disk gopweb0001-osdisk-20220927-193433
    Encryption at host Disabled
    Azure disk encryption Not enabled
    Ephemeral OS disk N/A
    Data disks 0
  Availability + scaling
Availability zone -
Availability set EMASTGDBGRGLOBERUNNERSTGAS01
Scale Set -
Fault domain 0

Production - gopweb0001
  RG    --> GOMCLTRDY_PRD_GLOBERUNNER
  Virtual network/subnet  --> GOAZRVNET3300/GOSNFEI3330
  Disk
    OS disk gopweb0001-osdisk-20220927-193433
    Encryption at host Disabled
    Azure disk encryption Not enabled
    Ephemeral OS disk N/A
    Data disks 0
  Availability + scaling
    Availability zone -
    Availability set -
    Scale Set -

Production - gopdb0001
  RG    --> GOMCLTRDY_PRD_GLOBERUNNER
  Virtual network/subnet  --> GOAZRVNET3300/GOSNLEGI3330
  Disk
    OS disk gopdb0001_OsDisk_1_dde75ae23df54bc09a30e687c9e631bf
    Encryption at host Disabled
    Azure disk encryption Not enabled
    Ephemeral OS disk N/A
    Data disks 0
  Availability + scaling
    Availability zone -
    Availability set EMAPDBGRGLOBERUNNERPRDAS01
    Scale Set -
    Fault domain 0

Virtual network  --> GOAZRVNET3300 -->> All 4 samevnet

Subnet --> GOSNFEI3330//10.178.59.128/25 -->> grazrstgweb001//gopweb0001
NSG --> GO_NSG_GOSNFEI3330

Subnet --> GOSNLEGI3330//10.178.61.128/25 -->> grazrstgdb001//gopdb0001
NSG --> GO_NSG_GOSNLEGI3330

Staging - grazrstgweb001 
Staging - grazrstgdb001
Production - gopweb0001
Production - gopdb0001

In terms of remaining questions, we just need the following:
1)	What network-based security is there? 
  The Web and DB servers are implemented in a VNet and separated by Subnets and Network Security Groups 

2)	Confirm data at rest
  OSDisks of all the servers are encrypted with SSE with PMK

3)	What redundancy is in place?

4)	How long are logs retained for?

5)	Are VLANs used to separate front end, application and database? Are they logically separated?
  The Web and DB servers are implemented in a VNet and separated by Subnets

