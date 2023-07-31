Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Install-Module -Name PSReadLine -Force
Install-Module -Name Terminal-Icons -Force

winget install Starship --accept-source-agreements --accept-package-agreements
winget install Microsoft.Powertoys --accept-source-agreements --accept-package-agreements
winget install sharkdp.bat --accept-source-agreements --accept-package-agreements


New-Item -ItemType directory -Force -Path  $env:USERPROFILE\.config
Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/starship.toml -OutFile  $env:USERPROFILE\.config\starship.toml

New-Item -ItemType directory -Force -Path  $env:USERPROFILE\Setup
#New-Item -ItemType  -Force -Path  $env:USERPROFILE\Setup\psprofile.ps1
New-Item -Path $PROFILE -Type File -Force
Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/psprofile.ps1 -OutFile $PROFILE



Invoke-WebRequest -OutFile $env:USERPROFILE\Setup\FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
Expand-Archive  $env:USERPROFILE\Setup\FiraCode.zip -DestinationPath  $env:USERPROFILE\Setup\FiraCode

$FontFolder = "$env:USERPROFILE\Setup\FiraCode"
$FontItem = Get-Item -Path $FontFolder
$FontList = Get-ChildItem -Path "$FontItem\*" -Include ('*.ttf')
foreach ($Font in $FontList)  {
    Write-Host 'Installing font -' $Font.BaseName
    $FontName = $Font.BaseName + " (TrueType)"
    Write-Host $FontName
    Copy-Item $Font "C:\Windows\Fonts"
    New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name       
  } 

