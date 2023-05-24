$rootDir = (Get-Item $PSScriptRoot)
$root = $rootDir.FullName
$windowsDir = Join-Path $root "windows"

if ( [Version](Get-Host).Version -lt [Version]"7.0.0.0") {
    Write-Error "You must use powershell 7 or greater"
    return
}

# Install ps modules
Install-Module -Name PSReadLine -AllowPrerelease -Force
Install-Module -Name Terminal-Icons -AllowPrerelease -Force 
Install-Module -Name PsFzf

# Install windows apps
winget install JanDeDobbeleer.OhMyPosh

Copy-Item -Path (Join-Path $windowsDir "powershell" "Microsoft.PowerShell_profile.ps1") -Destination (Join-Path ([Environment]::GetFolderPath("MyDocuments")) "PowerShell") -Recurse -Force

# Copy configs to home
Get-ChildItem -Path (Join-Path $root "config") | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $ENV:UserProfile -Force -Recurse
}