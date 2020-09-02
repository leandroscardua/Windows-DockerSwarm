param(
  [Parameter(Mandatory=$true)]
  [String]$servername
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'

Write-Host "Rename the computer to $servername"
#Rename
Rename-Computer -NewName "$servername" | Out-Null

# Update the NuGet Module
Write-Host "Updating The Nuget Package Management"
Install-PackageProvider -Name NuGet -Force | Out-Null

# Install the Windows Feature Containers on the Server
Write-Host "Installing Windows Containers Feature"
Install-WindowsFeature -Name Containers | Out-Null

# Install the Docker Engine Enterprise on the Server
Write-Host "Installing Docker Engine"
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force | Out-Null

# Install the client interface to manage the Docker Engine Enterprise
Write-Host "Installing Docker Client"
Install-Package -Name docker -ProviderName DockerMsftProvider -Force | Out-Null

# Disable the creation of Default NAT network
Write-Host "Disabling default NAT network"
New-Item -Path "C:\ProgramData\Docker\config\daemon.json" -force
Set-Content -Path "C:\ProgramData\Docker\config\daemon.json" -Value '
{
    "bridge" : "none"
}
'

pause

Write-Host "Please, Hit enter to reboot the server to complete the configuration"

Restart-Computer
