

# 🔧 Tools
💡 This is a repository for tools and resources that I have found useful. 💡

## Shell customizations

### [💻 Powershell]()

#### Requirements
- For Powershell we use oh-my-posh in combination with some extensions
- theme: powerlevel10k_custom
  - `$($env:USERPROFILE)/Tools/shell/pwsh/themes/powerlevel10k_classic_custom.omp.json`
- font: MesloLGS NF Regular
- Use the template profile
  - ```$($env:USERPROFILE)/Tools/shell/pwsh/profiles/Microsoft.PowerShell_profile.ps1```
  - ```$($env:USERPROFILE)/Tools/shell/pwsh/profiles/Microsoft.VSCode_profile.ps1```
  - (❗TODO: script template profile install)

#### Local Installation
1. Clone the repo:
   ```powershell
   git clone "https://github.com/Trillius/Tools" "$($env:USERPROFILE)/Tools"
   ```
   
2. Run the setup script:
   ```powershell
   "$($env:USERPROFILE)\Tools\pwsh\setup.ps1"
   ```

#### How it looks:
![Powershell with oh-my-posh](docs/pwsh.png "PWSH")

### [📚 Zsh]()

#### Requirements
 - For ZSH we use oh-my-zsh in combination with some extensions
   - (❗TODO: script extension install)
 - theme: powerlevel10k
   - this theme will guide you through the preferred setup
 - font: MesloLGS NF Regular
   - (❗TODO: script font install)
 - Use the template profile 
 
   - ```~/Tools/shell/zsh/profiles```
   - (❗TODO: script template profile install)
#### Local Installation
1. Clone the repo:
   ```bash
   git clone https://github.com/Trillius/Tools ~/Tools
   ```
   
2. Run the setup script:
   ```bash
   ~\Tools\zsh\setup.sh
   ```

#### How it looks:
![zsh with oh-my-zsh](docs/zsh.png "ZSH")

### Docker Setup

The provided dockerfile will be based on ubuntu and run both zsh and pwsh:

#### Docker build + run (prefered) SSH
```powershell

cd ~/Tools/shell/

docker build -t trillius/pwsh-zsh-posh .

docker run -d -p 2222:22 --name pwsh-zsh-posh trillius/pwsh-zsh-posh:v2.0

#ssh to container
ssh -p 2222 lab@localhost

```
#### Docker pull + run SSH

```powershell
docker pull trillius/pwsh-zsh-posh

docker run -d -p 2222:22 --name pwsh-zsh-posh trillius/pwsh-zsh-posh:v2.0

#ssh to container
ssh -p 2222 lab@localhost
```
#### Docker pull + run attached

```powershell
#pull latest image
docker pull trillius/pwsh-zsh-posh

# run attached to container
docker run -ti "trillius/pwsh-zsh-posh$($version.tag)" /bin/pwsh
```




