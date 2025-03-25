###############################################################################
Everything Azure Admin Technical
Access, Commands && Random Information

###############################################################################

>> Windows Terminal Server ((for 
T tools))
go2azrwts002
10.178.192.132
go2.kworld.kpmg.com

>> Azure AD Tenant IDs
QA  : 38aab37e-88cc-4b73-9098-cbebfcd5960d
DEV : cf59843c-25a6-4e9e-a632-73d41e867a1f
GOAZ: 10c56508-287b-4e6c-b256-8a3f70c191fb
KPMG: deff24bb-2089-4400-8c8e-f71e680378b2

>> Azure Portal
Tools/Portal/Sites  URL Links	                  Information
Azure Portal	      https://portal.azure.com	  login to PROD,QA,DEV,GOAZRMGMT Tenant
Azure Portal	      https://portal.azure.cn	    login to CHINA Tenant

>> MFA Setup
https://aka.ms/mfasetup

>> AD Domains
there are many domains distributed according to environments
Prod  -- kworld.kpmg.com, go2.kworld.kpmg.com, go1.kworld.kpmg.com, goapps.kpmg.com, XX.local and XXE.local that  are managed by global
      -- apart from these 4 there are several other child domains of kworld.kpmg.com that belongs to their respective member firms.

DEV   -- goappsdevcloud.kpmg.com, kpmgdevcloud.kpmg.com, go2dev.kpmgdevcloud.kpmg.com, ccdev.kpmgdevcloud.kpmg.com, xxedevcloud.kpmg.com

QA    -- goappsqacloud.kpmg.com, kpmgqacloud.kpmg.com. go2qa.kpmgqacloud.kpmg.com, ccqa.kpmgqacloud.kpmg.com, xxeqacloud.kpmg.com, xxqacloud.kpmg.com

>> Squid Proxy
https://blog.ashiny.cloud/2018/04/28/squid-proxy-quickref/

  # get the basic status of Squid
  squid -k check | echo $?
  # check the squid configuration for errors
  squid -k parse
  # test connectivity to the chosen site
  squidclient -h <squidendpoint> -p3128 http://<testurl>
  # get list of recent attempts to reach forbidden sites
  grep -nR '/403' /var/log/squid/access.log
  # get real-time list of sites forbidden by Squid
  tail -f /var/log/squid/access.log | grep '/403'
  # get useful information about the proxy process and tail logs
  systemctl status squid
  # if you change the squid config and want to run it on the existing server
  systemctl reload squid
  # restart the proxy
  systemctl restart squid
  # get the feed of Squid logs
  journalctl -u squid 

The status of a few Squid proxies listed in the document is as below, obtained for SNOW CMDB and Azure Portal

YYAZRPRX056 West Europe PROD PRIMARY 10.178.7.4 52.233.163.105 ==> Decommissioned
YYAZRPRX057 North Europe PROD DR 10.79.6.5 40.69.192.83 ==> Deployed Status//Stopped
YYAZRPRX34 East Us Prod PROD PRIMARY 10.180.8.4 52.179.4.30 ==> Deployed Status//Stopped
YYAZRPRX049 West US PROD DR 10.80.12.4 104.40.90.138 ==> Deployed Status//Stopped
YYAZRPRX050 Southeast Asia PROD PRIMARY 10.179.7.4 52.163.116.87 ==> Deployed Status//Stopped
YYAZRPRX051 East Asia PROD DR 10.77.6.4 13.75.40.241 ==> Deployed Status//Stopped
YYQAAZRPRX022 East Us QA and DEV PRIMARY 10.180.0.8 52.179.5.245 ==> Deployed Status//Stopped
YYAZRPRXJP01 Japan East PRD PRIMARY 10.101.97.4 40.115.138.28 ==> Deployed Status//Stopped
YYAZRPRX086 Canada Central PRD PRIMARY 10.140.1.5 52.156.15.36 ==> Deployed Status//Running
YYAZRPRX085 West Europe(KCW) PRD PRIMARY 10.78.16.4 51.144.134.181 ==> Deployed Status//Running
YYAZRPRX087 West Europe(KCW ) PRD PRIMARY 10.78.16.5 13.81.170.50 ==> Deployed Status//Running
YYAZRPRXCN01 China East 2 PRD PRIMARY 10.119.1.7 40.73.103.129 ==> Deployed Status//Running

Check squid configuration for errors
  squid -k parse

>> SquaredUp
https://globalmonitoringportal.kworld.kpmg.com/SquaredUpv3/page/kpmgclaraworkflow1-dashboard-kcw-prod

>> Commands
(get-date) - (gcim Win32_OperatingSystem).LastBootUpTime


>> KRDS Deployment
  Recordings >> https://spo-global.kpmg.com/sites/GO-LeapfrogFY23/Shared%20Documents/Forms/AllItems.aspx?id=%2Fsites%2FGO%2DLeapfrogFY23%2FShared%20Documents%2FKPMG%20Remote%20Desktop%2F7%2E%20Recordings&p=true&ga=1
  NOTE:: Work on the main branch
  GO-SG AAD ITS Global Platform Operations CE Tier 3

  KPMGDEVCLOUD\\GO-SG ITS Global Platform Cloud Services Automation - CLD
  KPMGDEVCLOUD\\GO-SG CLD KPMGDev Cloud Central Tier III

  SCTASK4884751 ((RITM1917804))

  Need to know the info in regards to security groups of DEV and QA tenants with their domain information
    GO-SG CLD KPMGDev Cloud Central Tier III -- kpmgdev domain
    GO-SG CLD KPMGQA Cloud Central Tier III  -- kpmgqa domain
  Ops need to validate the pre reqs as mentioned in Ops documentation, such as VMname, subnet, available IPs etc
    Subscription  >> GO-M-DEV-Global remote access
    vnetResourceGroupName >> goazrvnetdev2800     //Resource Group
    vnetName  >>  GOAZRVNETDEV2800      //VNet Nmae
    vnetSubnetName  >>  GOSNBEI2820   10.81.224.48/28     //VNet Subsnet
      Available IPs 7 IPs, Reqd IPs 2 ((for 2 VMs)), Spare IPs are available for scaleout//os upgrades
    vmName  >>  go2azrdevavd902/903     // VMName to Start
    always have spare IPs cos if scale out or os upgrade (during os upgrade new VM are created and then old ones deleted)

    https://learn.microsoft.com/en-us/previous-versions/azure/devops/all/java/vscode-extension?view=tfs-2017

    vscode >> git pull        ## before making changes to local env
      comment SCTASK in the Commit <<SCTASK4884751>>
    ADO >> Commits  >> Delpoyment SCTASK
    ADO >> Pipelines >> KRDS-GlobaRequests
      Branch >> Main, Deploment Env >> DEV, SCTASK Number >> <<SCTASK4884751>>, ServiceBus Subs <<PROD/DEV//QA>>



  https://client.wvd.microsoft.com/arm/webclient/index.html



>> Linux Hardening Build
\\GO2AZRSRV150\Share010

>> Ansible VMs
ansible-dev 10.180.4.69
ansible-prod 10.180.6.15
ansible-qa 10.180.6.14




