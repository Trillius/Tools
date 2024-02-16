# Use the latest Ubuntu as the base image
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC
ENV TERM=xterm-256color
RUN echo 'root:ubuntu' | chpasswd

RUN apt-get update -y && \
    apt install -y sudo
RUN apt-get install -y \
    git \
    nano \
    net-tools \
    curl \
    wget \
    libicu-dev \
    iputils-ping \
    dnsutils \
    strace \
    zsh \
    tmux


RUN useradd -rm -d /home/ubuntu -s /bin/zsh -g root -G sudo -u 1001 ubuntu
RUN echo "ubuntu ALL=(ALL) NOPASSWD: ALL" | (EDITOR="tee -a" visudo)
RUN echo 'ubuntu:ubuntu' | chpasswd
USER ubuntu
RUN
WORKDIR /home/ubuntu

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#RUN chsh -s /bin/zsh

# powerlevel10k theme for oh-my-zsh
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true

# auto suggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# highlight
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# logo-ls
RUN wget https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_arm64.tar.gz
RUN tar -xzf logo-ls_Linux_arm64.tar.gz
RUN sudo cp ~/logo-ls_Linux_arm64/logo-ls /usr/local/bin
RUN sudo cp ~/logo-ls_Linux_arm64/logo-ls.1.gz /usr/share/man/man1/
RUN rm -rf ~/logo-ls_Linux_*
RUN echo "alias lo=logo-ls" >> ~/.zshrc

# set the theme
RUN sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" ~/.zshrc

# register plugins
RUN sed -i "s/plugins=.*$/plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
RUN echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Start the zsh shell when a container is run
CMD [ "zsh" ]