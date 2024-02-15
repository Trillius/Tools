git clone "https://github.com/Trillius/Tools" $env:USERPROFILE

winget install JanDeDobbeleer.OhMyPosh -s winget

Install-Module -Name PowerTab
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSReadLine -Force
Install-Module -Name posh-azure
Install-Module -Name posh-git
Install-Module -Name posh-docker

oh-my-posh init pwsh | Invoke-Expression