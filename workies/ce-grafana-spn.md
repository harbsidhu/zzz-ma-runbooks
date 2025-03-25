####################################################################################

https://learn.microsoft.com/en-us/powershell/module/az.resources/get-azadserviceprincipal?view=azps-13.0.0&viewFallbackFrom=azps-12.4.0
https://learn.microsoft.com/en-us/azure/healthcare-apis/register-application

https://grafana.com/docs/grafana/latest/datasources/azure-monitor/
https://github.com/grafana/grafana-infinity-datasource
https://github.com/grafana/grafana-infinity-datasource/discussions/404
https://grafana.com/docs/plugins/yesoreyeram-infinity-datasource/latest/examples/azure/


####################################################################################


>>> Configure Infinity Datasource using SPN ((Auth Type == OAuth2))
###################RECONFIGURATION###################

https://github.com/grafana/grafana-infinity-datasource/discussions/404 

The new configuration the Infinity Data source is configured using OAuth2 instead of Bearer Token

Configuration for Sandbox environment GODEVSUITE044
Create a new service client in Azure Portal

Create Azure Service Principal
  --- Display name: ce-grafana-dashboard-sbx
--- Application (client) ID: 2753f226-c8eb-4b79-a788-5ce769c94ff8
--- Directory (tenant) ID: 0172e4fc-f229-40aa-b66b-0b6f76ba4c9c

Create a client secret for the client created above
--- Client Description: ce-grafana-dashboard-sbx
--- Value: *********

Note down the Application (Client) ID, Client Secret Value and Tenant ID

ce-grafana-dashboard-sbx | API permissions
--- Application.Read.All
--- Application.ReadWrite.All
--- Directory.Read.All

Configure infinity plugin in Grafana and add data source for the same
--- Name: ce-serviceprincipal-expiry-sbx
--- Authentication section and select
--- Auth Type: "OAuth2"
--- Grant Type: "Cllient Credentials"
--- Client ID: 2753f226-c8eb-4b79-a788-5ce769c94ff8
--- Client Secret: <secret value for "ce-grafana-dashboard-sbx">
--- Token URL: https://login.microsoftonline.com/0172e4fc-f229-40aa-b66b-b6f76ba4c9c/oauth2/v2.0/token 
--- Scopes: https://graph.microsoft.com/.default 
--- Allowed hosts: https://graph.microsoft.com , https://login.microsoftonline.com , https://management.azure.com/ 
--- Health check: https://graph.microsoft.com  ((optional)

Click Save and Test.

Click the Explore button

Configure the query
--- Type: JSON
--- Parser: Default
--- Source: URL
--- Format: Table
--- Method: GET
--- URL: https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId 
((sample query))

Click Run Query and you will see the results

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId,passwordCredentials,keyCredential
https://graph.microsoft.com/v1.0/applications?$select=displayName,appId,passwordCredentials,keyCredential

## Allowed Hosts
graph.microsoft.com
login.microsoftonline.com

>>> Sample Configure Infinity Datasource using SPN

https://github.com/grafana/grafana-infinity-datasource/discussions/404
Create a new service client in azure portal
Create a client secret for the client created above
Note down the Client ID, Client Secret and Tenant ID
Give reader/monitoring reader access to the resources/subscriptions as necessary
Install the infinity plugin in Grafana and add data source for the same
Expand Authentication section and select "OAuth2"
Select "Cllient Credentials" as OAuth2 type
Specify the Client ID
Specify the Client Secret
Specity the Token URL https://login.microsoftonline.com/<TENENT_ID>/oauth2/token. Replace <TENENT_ID> with yours
Leave the Scopes section empty
Add the following Endpoint param
Key : resource Value: https://management.azure.com/
If you are using Infinity 1.0.0+, then specify https://management.azure.com/ as an allowed URL.
Click Save and Test.
Click the Explore button
Configure the query
Specify json as query type
Specify url as source
Specify default parser ( only applicable for Infinity 1.0.0+)
Specify table as format
Method : GET
URL : https://management.azure.com/subscriptions?api-version=2020-01-01
Click Run Query and you will see the results



>>> Create SPN Sandbox
Create new connection using Infinity Data source
ce-serviceprincipal-expiry-sbx

>>> Generate Bearer Token using SPN ((if using Auth Type == Bearer Token))
Configure Azure SPN Authentication
Open Powershell to generate bearer token

`  $TenantId = "0172e4fc-f229-40aa-b66b-0b6f76ba4c9c"
    $ClientId = "2753f226-c8eb-4b79-a788-5ce769c94ff8"
    $ClientSecret = "<clientsecret>"

AuthContext="https://login.microsoftonline.com/TenantId/oauth2/v2.0/token"

$Body = @{
        client_id     = $ClientId
        scope         = "https://graph.microsoft.com/.default "
        client_secret = $ClientSecret
        grant_type    = "client_credentials"    
}

$TokenResponse = Invoke-RestMethod -Method Post -Uri $AuthContext -Body $Body

$AccessToken = $TokenResponse.access_token`

Note down the bearer token

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId,passwordCredentials,keyCredentials


https://graph.microsoft.com/v1.0/servicePrincipals

https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId&$expand=passwordCredentials($select=keyId,endDateTime,startDateTime),keyCredentials($select=keyId,endDateTime,startDateTime,type)


















#######################################################################################################################


1. Prerequisites
Before starting, ensure you have the following:

  Self-hosted Grafana environment: Running and accessible.
  Infinity Data Source Plugin: Installed and configured in Grafana.
  Azure Service Principal (SPN): The SPN (abcd) must have permissions to read service principals in the Azure tenant (tenxx).
  Microsoft Graph API Permissions: The SPN should have the following permissions:
    Directory.Read.All (Application or Delegated permissions).
    Admin consent granted for the tenant.
  Network Access:
    Ensure your Grafana server can access the Microsoft Graph API (https://graph.microsoft.com).
    Allowed IPs in Azure AD for SPN authentication


2. Configure Azure SPN Authentication
You'll need to authenticate the SPN in your PowerShell session to retrieve an access token.

Steps:
  Open PowerShell and connect using the SPN:
    $TenantId = "<tenantid>"
    $ClientId = "<appid>"
    $ClientSecret = "<clientsecret>"
    $AuthContext = "https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token"

    $Body = @{
        client_id     = $ClientId
        scope         = "https://graph.microsoft.com/.default"
        client_secret = $ClientSecret
        grant_type    = "client_credentials"    }

    $TokenResponse = Invoke-RestMethod -Method Post -Uri $AuthContext -Body $Body
    $AccessToken = $TokenResponse.access_token

    Note down the $AccessToken for later use.

3. Grafana Infinity Data Source Setup
Set up the Infinity data source in Grafana to use the Microsoft Graph API.

Steps:
Log in to Grafana:
  Navigate to Configuration > Data Sources.
  Add a new data source and select Infinity.
Authentication:
  In the data source configuration, choose None for authentication (as tokens are passed in headers).

Allowed Hosts:
  Add https://graph.microsoft.com as an allowed host in the Infinity data source settings.

Health Check:
  Test the connectivity to https://graph.microsoft.com. Ensure no network issues exist.

4. Query Configuration in Grafana
Use the Infinity data source to query Microsoft Graph API for service principals.

Steps:
Create a New Panel:
  Go to Dashboards > New Dashboard > Add a New Panel.
Query Configuration:
  Select Infinity as the data source.
  Set the Type to JSON.
  Configure the following fields:
    URL: https://graph.microsoft.com/v1.0/servicePrincipals
    HTTP Method: GET
  Headers:
    Add Authorization as the key and Bearer <AccessToken> as the value.
    Replace <AccessToken> with the value retrieved from PowerShell.
  Query Parameters (if needed):
    ?$select=displayName,appId (to limit the fields retrieved).
  Test the Query:
    Save and test the query. Ensure it fetches service principal data.

Panel Visualization:
  Use a table visualization to display the data.
  Map JSON fields (displayName, appId, etc.) to table columns.

5. Validation and Troubleshooting
  Network:
    Ensure the Grafana server can reach https://graph.microsoft.com.
    Check firewall rules and DNS resolution.
  Headers:
    Ensure the Authorization header includes a valid token.
    Tokens expire, so regenerate as needed.
  Allowed Hosts:
    Confirm https://graph.microsoft.com is whitelisted in the Infinity data source.

6. Automate Token Retrieval (Optional)
  While this guide uses manual token retrieval, you can script the token generation using PowerShell and periodically update it in the Grafana data source.



1. Incorrect Access Token
Ensure the access token you used in the Authorization header is valid and not expired.
Validate the token using the following PowerShell command to inspect its properties:

  $DecodedToken = $AccessToken.Split('.')[1]
  $DecodedToken += "=" * ((4 - $DecodedToken.Length % 4) % 4)
  $DecodedToken | ForEach-Object { [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($_)) }

Check the aud (audience) field to ensure it includes https://graph.microsoft.com.
Verify that the token includes the necessary permissions (Directory.Read.All).

2. Invalid API Endpoint or Query
Ensure the API endpoint URL is correct:
https://graph.microsoft.com/v1.0/servicePrincipals
Add the ?$select= query parameter if only specific fields are required:
Example: https://graph.microsoft.com/v1.0/servicePrincipals?$select=displayName,appId



