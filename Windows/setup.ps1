Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Set-PSRepository -Name "PSGallery" -InstallationPolicy Trusted
Install-Module -Name PSReadLine -Force
Install-Module -Name Terminal-Icons -Force

Install-Winget

winget install Starship --accept-source-agreements --accept-package-agreements
#winget install Microsoft.Powertoys --accept-source-agreements --accept-package-agreements # Can Ignore
winget install sharkdp.bat --accept-source-agreements --accept-package-agreements
winget install Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements
#winget install "Microsoft Remote Desktop" --accept-source-agreements --accept-package-agreements
winget install RARLab.WinRAR --accept-source-agreements --accept-package-agreements
#winget install Greenshot.Greenshot --accept-source-agreements --accept-package-agreements
winget install Git.Git --accept-source-agreements --accept-package-agreements
winget install GitHub.cli --accept-source-agreements --accept-package-agreements
winget install Logitech.GHUB --accept-source-agreements --accept-package-agreements
winget install subhra74.XtremeDownloadManager --accept-source-agreements --accept-package-agreements

#Enable Some Required Feature Telnet Client, SSH client
dism /online /Enable-Feature /FeatureName:TelnetClient
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

New-Item -ItemType directory -Force -Path  $env:USERPROFILE\.config
Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/Common/starship.toml -OutFile  $env:USERPROFILE\.config\starship.toml

New-Item -ItemType directory -Force -Path  $env:USERPROFILE\Setup
#New-Item -ItemType  -Force -Path  $env:USERPROFILE\Setup\psprofile.ps1
New-Item -Path $PROFILE -Type File -Force
Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/Windows/psprofile.ps1 -OutFile $PROFILE



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
    Set-ItemProperty -Name $FontName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name       
  } 

  function Install-Winget {
    # Check if winget is already installed
    if (-not (Get-Command winget.exe -ErrorAction SilentlyContinue)) {
        Write-Host "Installing winget..."
        
        # Get the latest download URL from GitHub release API
        $URL = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
        $URL = (Invoke-WebRequest -Uri $URL).Content | ConvertFrom-Json |
                Select-Object -ExpandProperty "assets" |
                Where-Object "browser_download_url" -Match '.msixbundle' |
                Select-Object -ExpandProperty "browser_download_url"

        # Download the .msixbundle
        Invoke-WebRequest -Uri $URL -OutFile "Setup.msix" -UseBasicParsing

        # Install the .msixbundle using Add-AppxPackage
        Add-AppxPackage -Path "Setup.msix"

        # Delete the downloaded file
        Remove-Item "Setup.msix"

        Write-Host "winget has been installed!"
    }
    else {
        Write-Host "winget is already installed on this system."
    }
}