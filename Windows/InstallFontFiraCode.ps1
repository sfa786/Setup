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