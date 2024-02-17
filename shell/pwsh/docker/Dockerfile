# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/powershell:preview
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common apt-utils curl unzip
RUN apt-get install -y git

RUN . /etc/os-release \
&& wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb \
&& dpkg -i packages-microsoft-prod.deb \
&& rm packages-microsoft-prod.deb

RUN apt-get update
RUN apt-get install -y powershell

RUN curl -s https://ohmyposh.dev/install.sh | bash -s --
#RUN chmod +x install.sh
#RUN ./install.sh
 
RUN pwsh -Command Install-Module -Name Terminal-Icons -Force
RUN pwsh -Command Install-Module -Name PSReadLine -Force
RUN pwsh -Command Install-Module -Name PowerTab -Force
RUN pwsh -Command Install-Module -Name PSReadLine -Force
RUN pwsh -Command Install-Module -Name posh-azure -Force
RUN pwsh -Command Install-Module -Name posh-git -Force
RUN pwsh -Command Install-Module -Name posh-docker -Force

RUN mkdir $HOME/Tools \
&& git clone https://github.com/Trillius/Tools.git $HOME/Tools \
&& ls $HOME/Tools \
&& mkdir /root/.config/powershell \
&& ls $HOME/Tools/shell/pwsh/docker/ \
&& cp $HOME/Tools/shell/pwsh/docker/Microsoft.PowerShell_profile.ps1 /root/.config/powershell 

RUN pwsh -Interactive $false -Command ". $PROFILE"
RUN pwsh
