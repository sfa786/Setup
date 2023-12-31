winget install Starship 
#create config file
mkdir -p ~/.config && touch ~/.config/starship.toml

New-Item -Path $profile -Type File -Force
test-path $profile

#add  this to profile for starship
Invoke-Expression (&starship init powershell)


# Run the new pwrsh.exe as admin

# Install aucomplete addon
Install-Module -Name PSReadLine -AllowPrerelease

# Open the profile with an editor (e.g. Notepad)
notepad $PROFILE

# *If it throws an error, create the file:
New-Item -Path $PROFILE -Type File -Force

# Paste into file:
# Make addon listen to history
Set-PSReadLineOption -PredictionSource History

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# 
# Restart the powershell with new data:
. $PROFILE



#https://github.com/surajp/sfdx-powershell-autocomplete


Install-Module -Name Terminal-Icons -Repository PSGallery #https://github.com/devblackops/Terminal-Icons

# Initialize Terminal-Icons
Import-Module -Name Terminal-Icons

#Install BAT
winget install sharkdp.bat

#Install FiraCode:

New-Item -ItemType directory -Force -Path C:\Setup
Invoke-WebRequest -OutFile C:\Setup\FiraCode.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraCode.zip
Expand-Archive C:\Setup\FiraCode.zip -DestinationPath C:\Setup\FiraCode

$FontFolder = "C:\Setup\FiraCode"
$FontItem = Get-Item -Path $FontFolder
$FontList = Get-ChildItem -Path "$FontItem\*" -Include ('*.ttf')
foreach ($Font in $FontList)  {
    Write-Host 'Installing font -' $Font.BaseName
    $FontName = $Font.BaseName + " (TrueType)"
    Write-Host $FontName
    Copy-Item $Font "C:\Windows\Fonts"
    New-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name       
  } 

