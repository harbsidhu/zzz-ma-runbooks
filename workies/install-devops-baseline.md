####################################################################
## This script is to assist with installing the following         ##
## Dev-Ops tools to any Desktop device (with Powershell 5+)       ##
##                                                                ##
## - PowerShell 7.1                                               ##
## - Az PowerShell module                                         ##
## - Git cmdlets                                                  ##
## - VsCode                                                       ##
## - VsCode Extensions (update line 163-174 to add your own)      ##
##                                                                ##
## Administrator privs should not be required to run              ##
## this script                                                    ##
##                                                                ##
## Author: D. den Braver                                          ##
## Date  : 13-04-2021                                             ##
## Version: 1.3.3                                                 ##
##                                                                ##
## Release Notes:                                                 ##
##                                                                ##
## 1.2 Update:                                                    ##
## Add SSL Bypass, (only during installation) for extensions.     ##
## This should solve the issue for the US firm restrictions.      ##
## I also added an addon (win-ca) that will use windows-ca        ##
## authoroties rather then the chromium store.                    ##
## 1.32 Update:                                                   ##
## Resolved issue with PowerShell version in VsCode               ##
## Resolved folder does not exist issue for VsCode                ##
## 1.3.3 Update:                                                  ##
## Added 2 new extensions. TODO: highlighting and trailing space  ##
## removal.                                                       ##
####################################################################

[CmdletBinding(SupportsShouldProcess)]

param (
    [Parameter(Mandatory = $false)]
    [string] $PoshInstallLocation = "$($Env:OneDrive)\PowerShell\7",

    [Parameter(Mandatory = $false)]
    [string] $DownloadLocation = $env:TEMP,

    [Parameter(Mandatory = $false)]
    [string] $VsCodeSource = 'https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user'
)

# Clearing host error messages and setting generic variables
$error.clear()
$startpath = Get-Location


# Clearing Host & Provide start notification
Clear-Host
Write-Host "[Starting Installation for: PowerShell / Git & VsCode]" -ForegroundColor Green
Write-Host "[Version 1.32]"

# Notification PowerShell
Write-Host "[Initiating Parameters]" -ForegroundColor Green

Write-Host "[Parameter]" -ForegroundColor Cyan -NoNewline
Write-Host " InstallLocation: $PoshInstallLocation"
Write-Host "[Parameter]" -ForegroundColor Cyan -NoNewline
Write-Host " DownloadLocation: $DownloadLocation"
Write-Host "[Parameter]" -ForegroundColor Cyan -NoNewline
Write-Host " VsCodeSource: $VsCodeSource"
Write-Host ""

# Notification PowerShell
Write-Host "[Installing PowerShell]" -ForegroundColor Green

# Get latest PowerShell Version
try {

    $posh_url = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
    Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
    Write-Host "Obtaining latest version of PowerShell" -NoNewline
    $asset = Invoke-RestMethod -Method Get -Uri $posh_url | ForEach-Object assets | Where-Object name -Like "*win-x64.zip"
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Download PowerShell
try {
    $WebClient = New-Object System.Net.WebClient
    Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
    Write-Host "Downloading from source [$($asset.browser_download_url)]" -NoNewline
    $WebClient.DownloadFile("$($asset.browser_download_url)", "$DownloadLocation\PowerShell.zip")
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Check for previous version of PowerShell
Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
Write-Host "Checking for previous installation of PowerShell 7" -NoNewline
if (Test-Path $PoshInstallLocation) {
    Write-Host " [found] " -ForegroundColor Yellow

    try {
        # Clean up old Installation
        Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
        Write-Host "Removing previous installation of PowerShell" -NoNewline
        Remove-Item -Path $PoshInstallLocation -Recurse -Force
        Write-Host " [done] " -ForegroundColor Green
    }
    catch {
        Write-Host " [failed] " -ForegroundColor Red
    }

}
else {
    Write-Host " [not found] " -ForegroundColor Green
}

# Unpack and 'Install' PowerShell
try {
    Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
    Write-Host "Unpacking package to [$PoshInstallLocation]" -NoNewline
    Expand-Archive -Path "$DownloadLocation\PowerShell.zip" -DestinationPath $($PoshInstallLocation) -Force
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Obtain current path variables
Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
Write-Host "Scanning for installation folder in PATH variable" -NoNewline
$currentenv = ($env:Path).split(';')
if ($currentenv -contains $PoshInstallLocation) {
    # If found skip
    $PathVariableAdded = $false
    Write-Host " [found] " -ForegroundColor Green
}
else {
    # If not found add Path variable
    $PathVariableAdded = $true
    $newenv = (($currentenv | Sort-Object -Unique) -join ';') + ";$PoshInstallLocation;"
    Write-Host " [not found] " -ForegroundColor Yellow
    try {
        # Write user path variable
        Write-Host "[PowerShell] " -ForegroundColor Cyan -NoNewline
        Write-Host "Writing [$PoshInstallLocation] to User PATH variable" -NoNewline
        [Environment]::SetEnvironmentVariable("Path", $newenv, "User")
        Write-Host " [done] " -ForegroundColor Green
    }
    catch {
        Write-Host " [failed] " -ForegroundColor Red
    }
}
Write-Host ""

# Install Az module for PowerShell 7
Write-Host "[Installing Az PowerShell Module]" -ForegroundColor Green
Set-Location $PoshInstallLocation
.\pwsh.exe -Command {
    try {
        $Package = Find-Package -Name "Az"
        Write-Host "[Az] " -ForegroundColor Cyan -NoNewline
        Write-Host "Installing Az Module version $($Package.Version)" -NoNewline
        $Null = $Package | Install-Package -Scope CurrentUser -Force
        Write-Host " [done] " -ForegroundColor Green
    }
    catch {
        Write-Host " [failed] " -ForegroundColor Red
    }
}
Write-Host ""

# Notification Git
Write-Host "[Installing Git]" -ForegroundColor Green

# Get latest Git SCM
try {
    $git_url = "https://api.github.com/repos/git-for-windows/git/releases/latest"
    Write-Host "[Git] " -ForegroundColor Cyan -NoNewline
    Write-Host "Obtaining latest version of git scm" -NoNewline
    $asset = Invoke-RestMethod -Method Get -Uri $git_url | ForEach-Object assets | Where-Object name -Like "*64-bit.exe"
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Download Git SCM
try {
    $WebClient = New-Object System.Net.WebClient
    Write-Host "[Git] " -ForegroundColor Cyan -NoNewline
    Write-Host "Downloading from source [$($asset.browser_download_url)]" -NoNewline
    $WebClient.DownloadFile("$($asset.browser_download_url)", "$DownloadLocation\GitSCM.exe")
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Write Git configuration
try {
    Write-Host "[Git] " -ForegroundColor Cyan -NoNewline
    Write-Host "Writing Setup Configuration to [$DownloadLocation\GitConfig.inf]" -NoNewline

    "[Setup]
Lang=default
Dir=$Env:LOCALAPPDATA\Programs\Git
Group=Git
NoIcons=0
SetupType=default
Components=ext,ext\shellhere,ext\guihere,gitlfs,assoc,autoupdate
Tasks=
EditorOption=VIM
CustomEditorPath=
PathOption=Cmd
SSHOption=OpenSSH
TortoiseOption=false
CURLOption=WinSSL
CRLFOption=LFOnly
BashTerminalOption=ConHost
PerformanceTweaksFSCache=Enabled
UseCredentialManager=Enabled
EnableSymlinks=Disabled
EnableBuiltinInteractiveAdd=Disabled
" | Out-File -FilePath "$DownloadLocation\GitConfig.inf" -Force
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Install Git SCM
try {
    Write-Host "[Git] " -ForegroundColor Cyan -NoNewline
    Write-Host "Installing from source [$DownloadLocation\GitSCM.exe]" -NoNewline
    $install_args = "/SP- /VERYSILENT /SUPPRESSMSGBOXES /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LOADINF=""$DownloadLocation\GitConfig.inf"""
    Start-Process -FilePath "$DownloadLocation\GitSCM.exe" -ArgumentList $install_args -Wait
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Install PowerShell Git
try {
    Write-Host "[Git] " -ForegroundColor Cyan -NoNewline
    Write-Host "Installing PowerShell Git helper" -NoNewline
    $null = Find-Package -Name posh-git | Install-Package -Force -Scope CurrentUser
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}
Write-Host ""

# Notification VsCode
Write-Host "[Installing VsCode]" -ForegroundColor Green

# Download VSCode
try {
    $WebClient = New-Object System.Net.WebClient
    Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
    Write-Host "Downloading from source [$VsCodeSource]" -NoNewline
    $WebClient.DownloadFile("$VsCodeSource", "$DownloadLocation\VsCodeInstaller.exe")
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Install VS Code
try {
    Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
    Write-Host "Installing from source [$DownloadLocation\VsCodeInstaller.exe]" -NoNewline
    Start-Process -FilePath "$DownloadLocation\VsCodeInstaller.exe" -Argument "/VERYSILENT /MERGETASKS=addcontextmenufiles,addcontextmenufolders,addtopath,!runcode" -Wait
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Update Code settings file
try {
    Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
    Write-Host "Generating VsCode Settings.json" -NoNewline
    $SettingsLocation = "$env:APPDATA\Code\User\settings.json"
    $VsCodeSettings = @{
        # editor
        "editor.quickSuggestionsDelay"                       = 1
        "editor.tabCompletion"                               = "on"
        "files.defaultLanguage"                              = "powershell"

        # default shell
        "powershell.powerShellAdditionalExePaths"            = @(
            @{
                "exePath"     = "$PoshInstallLocation\pwsh.exe"
                "versionName" = "PowerShell Core"
            }
        )
        "powershell.powerShellDefaultVersion"                = "PowerShell Core"
        # Windows
        # PowerShell 7
        # "terminal.integrated.shell.windows"                  = "$PoshInstallLocation\pwsh.exe"
        "shellLauncher.shells.windows"                       = @(
            @{
                "shell" = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe"
                "label" = "PowerShell 5.1"
            },
            @{
                "shell" = "$PoshInstallLocation\pwsh.exe"
                "label" = "PowerShell 7.1"
            }
        )
        # powershell settings changes
        "powershell.codeFormatting.preset"                   = "Stroustrup"
        "powershell.startAutomatically"                      = $true
        "powershell.scriptAnalysis.enable"                   = $true
        "powershell.integratedConsole.showOnStartup"         = $true
        "powershell.integratedConsole.focusConsoleOnExecute" = $true
        "http.proxyStrictSSL"                                = $false
    } | ConvertTo-Json
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

try {
    Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
    Write-Host "Updating Settings file in VsCode to use PowerShell 7" -NoNewline
    $null = New-Item -ItemType Directory -Path "$env:APPDATA\Code\User\" -Force
    $VsCodeSettings | Out-File $SettingsLocation -Force -Encoding utf8
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Create a list of extensions to add when installing
try {
    Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
    Write-Host "Generating list of Extensions to be installed" -NoNewline
    $Extensions =
    'ukoloff.win-ca',
    'ms-vscode.PowerShell',
    'ms-azuretools.vscode-azureresourcegroups',
    'msazurermtools.azurerm-vscode-tools',
    'ms-azure-devops.azure-pipelines',
    'ms-azuretools.vscode-logicapps',
    'ms-azuretools.vscode-azurefunctions',
    'ms-azuretools.vscode-bicep',
    'ms-vscode.azurecli',
    'ms-vscode.azure-account',
    'bencoleman.armview',
    'argutec.argutec-azure-repos',
    'eamodio.gitlens',
    'waderyan.gitblame',
    'shardulm94.trailing-spaces',
    'wayou.vscode-todo-highlight',
    'Azurite.azurite',
    'DavidAnson.vscode-markdownlint',
    'wayou.vscode-todo-highlight'
    Write-Host " [done] " -ForegroundColor Green
}
catch {
    Write-Host " [failed] " -ForegroundColor Red
}

# Install extensions
Set-Location "$Env:LOCALAPPDATA\Programs\Microsoft VS Code\bin"
Foreach ($Extension in $Extensions) {
    try {
        Write-Host "[VsCode] " -ForegroundColor Cyan -NoNewline
        Write-Host "Installing extension [$Extension]" -NoNewline
        $null = .\code.cmd --install-extension $Extension --force --ignore-certificate-errors
        Write-Host " [done] " -ForegroundColor Green
    }
    catch {
        Write-Host " [failed] " -ForegroundColor Red
    }
}
Set-Location $startpath
Write-Host ""

if ($error) {
    Write-Host "One or more errors occurred during the installation `nPlease review the errors below to troubleshoot:" -ForegroundColor Red
    $i = 0
    Foreach ($message in $error) {
        $i++
        Write-Output "Error[$i] - $($message.exception.message)"
    }
}
else {
    Write-Host "All packages have been installed succesfully!" -ForegroundColor Green
    if ($PathVariableAdded) {
        Write-Host "Please reboot your computer to finalize the installation!" -ForegroundColor Yellow
    }
}

Pause