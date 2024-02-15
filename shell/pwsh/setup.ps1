
#set working variables
$env:DEV_POSH_FONTS_PATH = "$env:USERPROFILE\Tools\shell\fonts"

# get dependencies
Install-Module -Name winget
Install-Module -Name PowerTab
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module -Name PSReadLine -Force
Install-Module -Name posh-azure
Install-Module -Name posh-git
Install-Module -Name posh-docker

#install oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

#install fonts
$FontList = Get-ChildItem -Path $env:DEV_POSH_FONTS_PATH -Include '*.fon', '*.otf', '*.ttc', '*.ttf'

foreach ($Font in $FontList) {
    Write-Host "Installing font - $($Font.BaseName)"
    Copy-Item $Font.FullName "C:\Windows\Fonts"
    $fontPath = Join-Path "C:\Windows\Fonts" $Font.Name
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -Name "$($Font.BaseName) (TrueType)" -Value $fontPath -PropertyType String -Force
}
