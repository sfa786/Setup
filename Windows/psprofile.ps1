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
set-alias cat bat 
 # Define quick short aliases for productivity
 Remove-Item Alias:ls -Force -ErrorAction SilentlyContinue
 # Remove conflicting aliases if exist
Remove-Item Alias:ls -ErrorAction SilentlyContinue
Remove-Item Alias:la -ErrorAction SilentlyContinue
Remove-Item Alias:ld -ErrorAction SilentlyContinue
Remove-Item Alias:lf -ErrorAction SilentlyContinue
Remove-Item Alias:ll -ErrorAction SilentlyContinue
Remove-Item Alias:lh -ErrorAction SilentlyContinue
Remove-Item Alias:lx -ErrorAction SilentlyContinue
Remove-Item Alias:ln -ErrorAction SilentlyContinue
Remove-Item Alias:lt3 -ErrorAction SilentlyContinue
Remove-Item Alias:lt -ErrorAction SilentlyContinue
 
Set-Alias ll ll 
Set-Alias ls ls 
Set-Alias la la 
Set-Alias lf lf 
Set-Alias ld ld 
Set-Alias lh lh 
Set-Alias lx lx 
Set-Alias ln ln 
Set-Alias lt lt 
Set-Alias lt3 lt3 


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

