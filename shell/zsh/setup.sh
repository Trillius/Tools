#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# powerlevel10k theme for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true

# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# logo-ls
wget "https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_arm64.tar.gz" 
tar -xzf logo-ls_Linux_arm64.tar.gz
cp ~/logo-ls_Linux_arm64/logo-ls /usr/local/bin
cp ~/logo-ls_Linux_arm64/logo-ls.1.gz /usr/share/man/man1/
rm -rf ~/logo-ls_Linux_*
echo "alias lo=logo-ls" >> ~/.zshrc

# set the theme
sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" ~/.zshrc

# register plugins
sed -i "s/plugins=.*$/plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc
echo "source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
chsh -s /bin/zsh