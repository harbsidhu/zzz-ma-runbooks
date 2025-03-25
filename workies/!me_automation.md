###############################################################################
Automation Issues



###############################################################################

## Schedule VM Shutdown & Start
https://dev.azure.com/GO-M-Product-Development/GO-M-Automation/_wiki/wikis/GO-M-Automation-Wiki/9985/Schedule-VM-shutdown-and-start-(Automated)

SCTASK6371386///RITM2758222
Schedule VM Shutdown & Start - Windows (Automated)///Scheduled start/stop of single or multiple VMs
VM == go2devazrapp062
Resource Group == GO-M-DEV-USE-MSCP-01
Subscription == GO-M-DEV-KPMG SG MSCP

Orchestrator
Tenant == KPMGDEV
Subscription == GO-M-DEV-Orchestrator
Storage account == kpmgdevorch001fexrzbsm
  storage account >> tables >> snow >> search filter "Requestid == RITM2758222"
    requestid == RITM2758222
    operation == vmpowerstateschedule
    statusmessage == Error occurred while modifying  the powerstate schedule for the VM(s). Error Message: 'Error occured while creating new Resource Group' 
    status == failed
    requestbody == {"data":{"weekdaysStartSchedule":{"Time":"11:00:00","IsAllWeekdaysSelected":"true","DaysSeleted":"Monday,Tuesday,Wednesday,Thursday,Friday"},"subscriptionId":"873b60cb-dc83-4b47-8716-eeb6679e772c","isWeekendsStopEnable":"false","isScheduleEnable":"true","emailAddresses":"parvathimani@kpmg.com.sg","businessService":"Member Firm - DEV","supportTeam":"L2 Platform Ops Cloud Enterprise - ITSG","weekdaysStopSchedule":{"Time":"22:00:00","IsAllWeekdaysSelected":"true","DaysSeleted":"Monday,Tuesday,Wednesday,Thursday,Friday"},"isWeekendFullShutDown":"true","weekendsStartSchedule":{"Time":"00:00:00","DaysSeleted":"","IsAllWeekEnddaysSelected":"false"},"environment":"DEV","vmNamesList":"go2devazrapp062","IntegrationMethodKey":"schedulevmpowerstate","isWeekdaysStopEnable":"true","isWeekdaysStartEnable":"true","taskNumber":"SCTASK6371376","isWeekendsStartEnable":"false","Schedule_Name":"user customized schedules","applicationID":"999999","ticketNumber":"RITM2758222","weekendsStopSchedule":{"Time":"00:00:00","DaysSeleted":"","IsAllWeekEnddaysSelected":"false"},"snowEndpoint":"https://kpmggoprod.service-now.com/api/75593/restapiintegrator/performOperation","timeZone":"Singapore Standard Time","RequestNumber":"RITM2758222","requesterName":"Charuhasan Chandra","Schedule_Type":"Custom Schedule","isEmailEnable":"true","approverName":"L2 Platform Ops Cloud Enterprise - ITSG","applicationFullName":"Member Firm"},"operation":"vmpowerstateschedule","Subtype":"MF"}


Application Insights == KPMGDEVORCH001 
  Transaction search filter "Requestid == RITM2758222"
  End-to-end transaction details == 
  INFORMATION: {"StatusMessage":"Error occurred while modifying  the powerstate schedule for the VM(s). Error Message: 'Error occured while creating new Resource Group' ","Status":"Failed","RequestNumber":"RITM2758222","CorrelationId":"","TaskNumber":"SCTASK6371376","IntegrationMethodKey":"schedulevmpowerstate"}

>>> Investigation
VM == go2devazrapp062
Resource Group == GO-M-DEV-USE-MSCP-01
Subscription == GO-M-DEV-KPMG SG MSCP
  Check the tenant and the subscription for which the request has been raised
    KPMGDEV
    GO-M-DEV-KPMG SG MSCP
  
  Login to that tenant in the Azure Portal
 
  Go to the subscription for which the request has been raised and search for the automation account. Please find below the naming standard of the automation account
    
  “Abbreviation of Subscription” + "-" + “Abbreviation of Location” + "-" + “Abbreviation of Environment” + "-Automation"
  For E.G. “GLB” + "-" + “EUS” + "-" + "PRD” + "-Automation" = GLB-EUS-PRD-Automation
    <<no automation account found>>



