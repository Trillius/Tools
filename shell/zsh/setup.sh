#!/bin/bash
CONFIG_FILE="$HOME/.zshrc"
SINTAX_HIGHLIGHT_CMD="source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
AUTO_SUGGESTIONS_CMD="source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
PLUGINS_TO_ADD=( "git" "kubectl" "zsh-autosuggestions" "zsh-syntax-highlighting" )

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# powerlevel10k theme for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k || true

# auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# logo-ls
cd ~
mkdir ~/logo-ls_Linux_arm64
wget "https://github.com/Yash-Handa/logo-ls/releases/download/v1.3.7/logo-ls_Linux_x86_64.tar.gz" -O ~/logo-ls_Linux_x86_64.tar.gz
tar -xzf logo-ls_Linux_x86_64.tar.gz
sudo cp logo-ls_Linux_x86_64/logo-ls /usr/local/bin
sudo cp logo-ls_Linux_x86_64/logo-ls.1.gz /usr/share/man/man1/
rm -rf logo-ls_*


# set the theme
sed -i "s/ZSH_THEME=.*$/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/" ~/.zshrc

# register plugins

# Read the current plugins line
PLUGIN_HANDLE="^plugins=("
CURRENT_PLUGINS=$(grep "$PLUGIN_HANDLE" "$CONFIG_FILE")
echo "$CURRENT_PLUGINS"
echo "Plugins to add: ${PLUGINS_TO_ADD[*]}"

for PLUGIN in "${PLUGINS_TO_ADD[@]}"; do
    # Check if the plugin is already in the list, being careful with the structure of the plugins line
    if ! grep -Eq "^plugins=\(.*\b$PLUGIN\b.*\)" $CONFIG_FILE; then
        echo "$PLUGIN not found, adding"
        # Insert the plugin before the last parenthesis, ensuring we're modifying the plugins line
        sed -i "/^plugins=(/ s/)$/$PLUGIN )/" "$CONFIG_FILE"
    else
        echo "$PLUGIN already present"
    fi
done
if ! grep -Fxq "alias lo=logo-ls" "$CONFIG_FILE"; then
    echo "alias lo=logo-ls" >> "$CONFIG_FILE"
else
    echo "set alias already in $CONFIG_FILE"
fi

if ! grep -Fxq "$SINTAX_HIGHLIGHT_CMD" "$CONFIG_FILE"; then
    echo "$SINTAX_HIGHLIGHT_CMD" >> "$CONFIG_FILE"
else
    echo "Syntax Highlighting command already in $CONFIG_FILE"
fi

if ! grep -Fxq "$AUTO_SUGGESTIONS_CMD" "$CONFIG_FILE"; then
    echo "$AUTO_SUGGESTIONS_CMD" >> "$CONFIG_FILE"
else
    echo "Auto Suggestions command already in $CONFIG_FILE"
fi

#chsh -s /bin/zsh