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
