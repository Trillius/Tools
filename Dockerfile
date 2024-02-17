# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/powershell:preview

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV TERM=xterm-256color
ENV TERM=screen-256color

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common apt-utils curl unzip
RUN apt-get install -y git
RUN apt-get install openssh-server python3.11 -y
RUN apt-get install openssh-server -y
RUN apt-get install -y \
    nano \
    net-tools \
    libicu-dev \
    iputils-ping \
    dnsutils \
    strace \
    zsh \
    tmux

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# logo-ls
RUN cd ~ \
&& wget -q https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz \
&& tar -xzf logo-ls_Linux_x86_64.tar.gz \
&& cp ~/logo-ls_Linux_x86_64/logo-ls /usr/local/bin \
&& cp ~/logo-ls_Linux_x86_64/logo-ls.1.gz /usr/share/man/man1/ \
&& rm -rf ~/logo-ls_Linux_* \
&& echo "alias ll=logo-ls -al" >> ~/.zshrc

# set the theme
RUN sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" ~/.zshrc

# register plugins
RUN sed -i "s/plugins=.*$/plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

RUN . /etc/os-release \
&& wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb \
&& dpkg -i packages-microsoft-prod.deb \
&& rm packages-microsoft-prod.deb

RUN apt-get update
RUN apt-get install -y powershell

RUN curl -s https://ohmyposh.dev/install.sh | bash -s --
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash -s --
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 
RUN pwsh -Command Install-Module -Name Terminal-Icons -Force
RUN pwsh -Command Install-Module -Name PSReadLine -Force
RUN pwsh -Command Install-Module -Name PowerTab -Force
RUN pwsh -Command Install-Module -Name PSReadLine -Force
RUN pwsh -Command Install-Module -Name posh-azure -Force
RUN pwsh -Command Install-Module -Name posh-git -Force
RUN pwsh -Command Install-Module -Name posh-docker -Force
RUN pwsh -Command Update-Help

RUN cd ~ \
&& git clone https://github.com/Trillius/Tools.git ~/Tools \
&& ls ~/Tools \
&& mkdir ~/.config/powershell/ \
&& cp -rf ~/Tools/shell/pwsh/profiles/docker-Microsoft.PowerShell_profile.ps1 ~/.config/powershell/ \
&& cp -rf ~/Tools/shell/pwsh/profiles/PowerTabConfig.xml ~/.config/powershell/ \
&& cp -rf ~/Tools/shell/zsh/profiles/ ~/
RUN mv ~/.config/powershell/docker-Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
RUN pwsh -Command ~/.config/powershell/Microsoft.PowerShell_profile.ps1
CMD [ "pwsh" ]
