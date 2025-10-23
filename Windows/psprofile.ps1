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
 # Define quick short aliases for productivity
 Set-Alias ls ls
 Set-Alias la la
 Set-Alias lf lf
 Set-Alias ld ld
 Set-Alias lx lx
 Set-Alias lt lt
 Set-Alias ln ln
 Set-Alias lh lh
 Set-Alias lt3 lt3

Set-Alias -Name "myip" -Value "PublicIp" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "p" -Value "My-Ping" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "sync" -Value "SyncProfile" # Create an alias for SyncProfile
Set-Alias -Name "ll" -Value "ListLibrary"

# Base list 1
    function ls { eza --icons --color=always --group-directories-first  @args }

    # All (including hidden)
    function la { eza --icons --all --color=always --group-directories-first @args }

    # Only directories
    function ld { eza --icons --color=always --group-directories-first -D @args }

    # Only files
    function lf { eza --icons --color=always -f @args }

    # Long format (with size, date)
    function ll {  eza --icons --long --color=always --group-directories-first --sort=modified --reverse @args  }

    # Long + human readable size
    function lh { eza --long --icons --color=always --group-directories-first --sort=size --total-size --reverse  @args }

    # Sort by type (folders first, then files by type)
    function lx { eza --long --icons --color=always --group-directories-first --sort=extension  @args }

    # Sort by name
    function ln { eza --icons --color=always --group-directories-first --sort=name @args }


    # Show tree view (recursive up to 2 levels)
    function lt3 {eza --icons --level=3 --long --color=always --group-directories-first --sort=modified --reverse @args}


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
