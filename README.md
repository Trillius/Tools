

# 🔧 Tools
💡 This is a repository for tools and resources that I have found useful. 💡

## Shell customizations

In this section we cover customizing the terminal looks for windows and linux:
### [💻 Powershell](shell/pwsh/PWSH_README.md)

#### Requirements
- For powershell we use oh-my-posh in combination with some extensions
- theme: powerlevel10k_custom
- font: MesloLGS NF Regular
- Use the template profile
  - ```./pwsh/profiles```
  - (❗TODO: script template profile install)

#### Instalation
1. Clone the repo:
   ```powershell
   git clone "https://github.com/Trillius/Tools" "$($env:USERPROFILE)/Tools
   ```
   
2. Run the setup script:
   ```powershell
   "$($env:USERPROFILE)\Tools\pwsh\setup.ps1"
   ```
### [📚 Zsh](shell/Zsh/ZSH_README.md)

#### Requirements
 - For zsh we use oh-my-zsh in combination with some extensions
   - (❗TODO: script extension isntall)
 - theme: powerlevel10k
 - this theme will guide you through the prefrences setup
 - font: MesloLGS NF Regular
   - (❗TODO: script font install)
 - Use the template profile 
 
   - ```./zsh/profiles```
   - (❗TODO: script template profile install)

#### Instalation
1. Clone the repo:
   ```bash
   git clone https://github.com/Trillius/Tools ~/Tools
   ```
   
2. Run the setup script:
   ```bash
   ~\Tools\zsh\setup.sh
   ```





