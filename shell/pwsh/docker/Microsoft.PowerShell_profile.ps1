<############### Start of PowerTab Initialization Code ########################
    Added to profile by PowerTab setup for loading of custom tab expansion.
    Import other modules after this, they may contain PowerTab integration.
#>

#Import-Module "PowerTab" -ArgumentList "$($env:USERPROFILE)\Documents\WindowsPowerShell\PowerTabConfig.xml"
################ End of PowerTab Initialization Code ##########################

# set working variables
$env:VIRTUAL_ENV_DISABLE_PROMPT = 0
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1
$env:DEV_POSH_THEMES_PATH = "$HOME/Tools/shell/pwsh/themes"
$env:DEV_POSH_ALIASES_PATH = "$HOME/Tools/shell/pwsh/aliases"
$env:DEV_POSH_SCRIPTS_PATH = "$HOME/Tools/shell/pwsh/scripts"

#import dependencies
Import-Module -Name Terminal-Icons
Import-Module -Name PSReadLine
Import-Module -Name posh-git
Import-Module -Name posh-docker
Import-Module -Name posh-azure

#set aliases from files
Get-ChildItem $env:DEV_POSH_ALIASES_PATH | ForEach-Object {
    Try {
        . $_.FullName
        Write-Host "Imported $($_.FullName)"
    }
    Catch {
        Write-Error "Failed to execute $_.FullName: $_"
    }
}



#Init theme
oh-my-posh init pwsh --config "$($env:DEV_POSH_THEMES_PATH)\powerlevel10k_classic_custom.omp.json" | Invoke-Expression
