# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/powershell:preview

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV TERM=xterm-256color
ENV TERM=screen-256color

USER root

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y wget apt-transport-https software-properties-common apt-utils curl unzip
RUN apt-get install -y git
RUN apt-get install openssh-server python3.11 -y
RUN apt-get install -y \
    nano \
    net-tools \
    libicu-dev \
    iputils-ping \
    dnsutils \
    strace \
    zsh \
    tmux

RUN . /etc/os-release \
    && wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y powershell

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash -s --
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN useradd -rm -d /home/lab -s /bin/zsh -g root -G sudo -u 1000 lab 
RUN echo 'root:root' | chpasswd && \
    echo 'lab:lab' | chpasswd


RUN mkdir /var/run/sshd \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
    && echo "export VISIBLE=now" >> /etc/profile

RUN cd ~ \
    && wget -q https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz \
    && tar -xzf logo-ls_Linux_x86_64.tar.gz \
    && cp ~/logo-ls_Linux_x86_64/logo-ls /usr/local/bin \
    && cp ~/logo-ls_Linux_x86_64/logo-ls.1.gz /usr/share/man/man1/ \
    && rm -rf ~/logo-ls_Linux_*

RUN curl -s https://ohmyposh.dev/install.sh | bash -s --

RUN chsh --shell /bin/zsh root 
RUN chsh --shell /bin/zsh lab

USER lab

RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

RUN pwsh -Command Install-Module -Name Terminal-Icons -Force
RUN pwsh -Command Install-Module -Name PSReadLine -Force
RUN pwsh -Command Install-Module -Name PowerTab -Force
RUN pwsh -Command Install-Module -Name posh-azure -Force
RUN pwsh -Command Install-Module -Name posh-git -Force
RUN pwsh -Command Install-Module -Name posh-docker -Force
RUN pwsh -Command Update-Help

RUN cd ~ \
    && git clone https://github.com/Trillius/Tools.git \
    && ls -al \
    && mkdir ~/.config/powershell/ \
    && cp -rf ~/Tools/shell/pwsh/profiles/docker-Microsoft.PowerShell_profile.ps1 ~/.config/powershell/ \
    && cp -rf ~/Tools/shell/pwsh/profiles/PowerTabConfig.xml ~/.config/powershell/ \
    && mv ~/.config/powershell/docker-Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1 \
    && cp -rf ~/Tools/shell/zsh/profiles/.zshrc ~/.zshrc \
    && cp -rf ~/Tools/shell/zsh/profiles/.zshrc ~/.tmux.conf \
    && cp -rf ~/Tools/shell/zsh/profiles/.zshrc ~/.p10k.zsh \
    && ls -al ~

RUN cd ~ && ls
RUN sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" ~/.zshrc
RUN sed -i "s/plugins=.*$/plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
RUN pwsh -Command ~/.config/powershell/Microsoft.PowerShell_profile.ps1

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
