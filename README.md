

# 🔧 Tools
💡 This is a repository for tools and resources that I have found useful. 💡

## Shell customizations

In this section we cover customizing the terminal looks for windows and linux:
### [💻 Powershell]()

#### Requirements
- For powershell we use oh-my-posh in combination with some extensions
- theme: powerlevel10k_custom
  - `$($env:USERPROFILE)/Tools/shell/pwsh/themes/powerlevel10k_classic_custom.omp.json`
- font: MesloLGS NF Regular
- Use the template profile
  - ```$($env:USERPROFILE)/Tools/shell/pwsh/profiles/Microsoft.PowerShell_profile.ps1```
  - ```$($env:USERPROFILE)/Tools/shell/pwsh/profiles/Microsoft.VSCode_profile.ps1```
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

#### How it looks:
![Powershell with oh-my-posh](docs\pwsh.png "PWSH")

### [📚 Zsh]()

#### Requirements
 - For zsh we use oh-my-zsh in combination with some extensions
   - (❗TODO: script extension isntall)
 - theme: powerlevel10k
 - this theme will guide you through the prefrences setup
 - font: MesloLGS NF Regular
   - (❗TODO: script font install)
 - Use the template profile 
 
   - ```~/Tools/shell/zsh/profiles```
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

#### How it looks:
![zsh with oh-my-zsh](docs\zsh.png "ZSH")





