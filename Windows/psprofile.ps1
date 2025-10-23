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
 Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
 
Set-Alias ll ll -Option AllScope
Set-Alias la la -Option AllScope
Set-Alias lf lf -Option AllScope
Set-Alias ld ld -Option AllScope
Set-Alias lh lh -Option AllScope
Set-Alias lx lx -Option AllScope
Set-Alias ln ln -Option AllScope
Set-Alias lt lt -Option AllScope
Set-Alias lt3 lt3 -Option AllScope


Set-Alias -Name "myip" -Value "PublicIp" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "p" -Value "My-Ping" # Create an alias for My-Ping function with the name "mping"
Set-Alias -Name "sync" -Value "SyncProfile" # Create an alias for SyncProfile


    # --- eza aliases & functions ---
    function ls  { eza --icons --color=always --group-directories-first @args }
    function la  { eza --icons --all --color=always --group-directories-first @args }
    function ld  { eza --icons --color=always --group-directories-first -D @args }
    function lf  { eza --icons --color=always -f @args }
    function ll  { eza --icons --long --color=always --group-directories-first --sort=modified --reverse @args }
    function lh  { eza --long --icons --color=always --group-directories-first --sort=size --total-size --reverse @args }
    function lx  { eza --long --icons --color=always --group-directories-first --sort=extension @args }
    function ln  { eza --icons --color=always --group-directories-first --sort=name @args }
    function lt3 { eza --icons --level=3 --long --color=always --group-directories-first --sort=modified --reverse @args }
    
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

