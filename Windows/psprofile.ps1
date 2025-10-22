# Initialize Terminal-Icons
Import-Module -Name Terminal-Icons

#Initialize starship
Invoke-Expression (&starship init powershell)

# Make addon listen to history
Invoke-Expression (& { (zoxide init powershell | Out-String) })

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
set-alias cat bat -Option AllScope
set-Alias ls get-childItem -Force

Set-Alias la la
Set-Alias ld ld
Set-Alias lf lf
Set-Alias lh lh

Set-Alias -Name "myip" -Value "PublicIp" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "p" -Value "My-Ping" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "sync" -Value "SyncProfile" # Create an alias for SyncProfile
Set-Alias -Name "ll" -Value "ListLibrary"

# Show all items (including hidden/system)
function la {
    Get-ChildItem -Force @Args
}


# Show only directories
function ld {
    Get-ChildItem -Force -Directory @Args
}


# Show only files
function lf {
    Get-ChildItem -Force -File @Args
}


# Show only hidden files and folders
function lh {
    Get-ChildItem -Force -Hidden @Args
}

function My-Ping {
    param(
        [Parameter(Mandatory=$true)]
        [string]$TargetHost
    )

    # Perform the ping command with specific parameters
    ping $TargetHost -l 2000 -t
}

function PublicIP {
         $pIp = Invoke-RestMethod -Uri "http://api.ipify.org?format=json"
         Write-Host "$($pIp.ip)"
    }

function SyncProfile{
    Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/Windows/psprofile.ps1 -OutFile $PROFILE
    Invoke-WebRequest https://raw.githubusercontent.com/sfa786/Setup/main/Common/starship.toml -OutFile  $env:USERPROFILE\.config\starship.toml
    .$PROFILE

}

function ListLibrary {
    get-childItem -Force . | Format-TerminalIcons
}
