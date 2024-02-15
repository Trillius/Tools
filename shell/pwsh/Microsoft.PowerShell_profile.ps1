$env:POSH_AZURE_ENABLED = $true

Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine
Import-Module -Name posh-git
Import-Module -Name posh-azure
Import-Module -Name posh-docker

#Set alias
Set-Alias -Name k -Value kubectl
Set-Alias -Name k9s -Value "$($env:UserProfile)\.psComm\k9s.exe"
Set-Alias -Name b64 -Value "$($env:UserProfile)\.psComm\b64.ps1"

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/cloud-native-azure-custom.omp.json" | Invoke-Expression

oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/powerlevel10k_classic.omp.json | Invoke-Expression

