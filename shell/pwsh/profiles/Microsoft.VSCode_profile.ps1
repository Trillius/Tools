Import-Module -Name Terminal-Icons
Import-Module -Name posh-git
Import-Module -Name posh-docker
Import-Module -Name posh-azure

$env:DEV_POSH_THEMES_PATH="$env:USERPROFILE\Tools\shell\pwsh\themes"
oh-my-posh init pwsh --config "$env:DEV_POSH_THEMES_PATH\powerlevel10k_classic_custom.omp.json" | Invoke-Expression