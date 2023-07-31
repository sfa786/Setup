# Initialize Terminal-Icons
Import-Module -Name Terminal-Icons

#Initialize starship
Invoke-Expression (&starship init powershell)

# Make addon listen to history
Set-PSReadLineOption -PredictionSource History

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#Allias
Set-Alias np notepad
Set-Alias c cls

function My-Ping {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TargetHost
    )

    # Perform the ping command with specific parameters
    ping $TargetHost -l 2000 -t
}

# Create an alias for My-Ping function with the name "mping"
New-Alias -Name "p" -Value "My-Ping"



function PublicIp 
{
	$ip = Invoke-WebRequest -Uri "https://ifconfig.me" -UseBasicParsing | Select-Object -ExpandProperty Content
Write-Host $ip

}

# Create an alias for My-Ping function with the name "mping"
New-Alias -Name "myip" -Value "PublicIp"