# Windows-ubuntu-tips

[Bash on Ubuntu on Windows][10] provides developers with a familiar Bash shell
and Linux environment on which to run most Linux command-line tools unmodified
without needed an entire Linux virtual machine

[10]: https://msdn.microsoft.com/en-us/commandline/wsl/about

## Slow WSL network speeds

https://answers.microsoft.com/en-us/windows/forum/all/low-internet-speed-in-wsl-2/21524829-18be-4611-bb5f-cabccd2cae31

## Setup Windows subsystem for Linux

Follow these [instructions][20]

[20]: https://docs.microsoft.com/en-us/windows/wsl/install-win10

Run these in powershell - MAY NOT be needed

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Check the version of Ubuntu

```
cat /etc/lsb-release
```

### Install Docker

#### Docker on Ubuntu 22.04

https://docs.docker.com/engine/install/ubuntu/

1. Setup pre-requisites

```
sudo apt-get update
sudo apt-get install ca-certificates curl
```

2. Add Docker's official GPG key:

```
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

3. Setup the repository

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

4. Update the package index

```
sudo apt-get update
```

5.  Install Docker and related packages

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

6. Start the Docker daemon

```
sudo service docker start
```

7. Run the hello-world image

```
sudo docker run hello-world
```

8. Check the Docker version

```
sudo docker version
```

9. Setup Docker to run without root

```
sudo usermod -aG docker $USER
```

#### Docker on Ubuntu 22.04 old

The following instructions do not work as the server does not start correctly. May have to install Docker desktop on Windows as in the previous link.

https://dev.to/luckierdodge/how-to-install-and-use-docker-in-wsl2-217l

https://dev.to/felipecrs/simply-run-docker-on-wsl2-3o8

https://stackoverflow.com/questions/60708229/wsl2-cannot-connect-to-the-docker-daemon

These instructions work but need configuration changes

https://dev.solita.fi/2021/12/21/docker-on-wsl2-without-docker-desktop.html

1. Setup pre-requisites

```
sudo apt update
# sudo apt install ca-certificates curl gnupg  # may not be needed for Ubuntu 22.04
# sudo apt install lsb-release  # may not be needed
```

2. Add Docker's official key

```
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

3. Setup the repository

```
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

4. Update the package index

```
sudo apt update
```

5. Install Docker and related packages

```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

6. Run the hello-world image

```
sudo docker run hello-world
```

7. Check the Docker version

```
sudo docker version
```

8. Setup Docker to run without root

```
sudo usermod -aG docker $USER
```

### WSL commands

#### Example wsl commands

1. List all distributions

```
wsl --list --all  # list all
```

2. List running distributions

```
wsl --list --running
```

3. Terminate a distribution, misspelled on purpose

```
wsl --terminate "Ubuntu-18.04--"
```

4. List available distributions

#### List vhdx files

1. Change to directory contaning vhdx files

```
cd %userprofile%\AppData\Local
```

2. List files

```
dir/s *.vhdx
```

#### Move Windows subsystem for Linux

http://woshub.com/move-wsl-another-drive-windows/

1. Shutdown the system

```
wsl --shutdown
```

2. Backup the WSL environment

```
mkdir d:\wsl-backup
wsl --export Ubuntu-22.04 d:\wsl-backup\Ubuntu-22.04.tar
```

3. Remove files from the original location

```
wsl --unregister Ubuntu-22.04
```

4. Create a directory for the WSL Linux image

```
mkdir d:\wsl
```

5. Import the image

```
wsl --import Ubuntu-22.04 d:\wsl d:\wsl-backup\Ubuntu-22.04.tar
```

6. Get location of wsl executable

```
dir %userprofile%\AppData\Local\Microsoft\WindowsApps\ubuntu2204.exe
```

7. Setup the default username for WSL

```
%userprofile%\AppData\Local\Microsoft\WindowsApps\ubuntu2204.exe config --default-user user-name
```

6. Start the WSL environment

```
wsl -d Ubuntu-22.04
```

#### Shrink WSL Virtual disk on Windows Home

https://writeabout.net/2021/10/14/shrink-your-wsl2-virtual-disk-on-windows-home/

1. Shutdown WSL

```
wsl --shutdown
```

2. Backup WSL to a tar file

```
wsl --export Ubuntu d:\wsl-backup\Ubuntu.tar
```

3. Change to directory containing ext4.vhdx file

```
cd %userprofile%\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState
```

3. Start disk management tool

```
diskpart
```

4. Enter path to ext4.vhdx file

```
select vdisk file=C:\Users\gavin\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\ext4.vhdx
```

5. List vdisk

```
list vdisk
```

6. Detail vdisk

```
detail vdisk
```

7. Shrink the virtual disk

```
compact vdisk
```

8. Exit

```
exit
```

#### Install WSL on a non-system (C) drive

1. Change to the folder that will contain

```
cd/d d:\wsl
```

2. List the available distributions

```
wsl --list --online
```

3. Alternatively find the amd64 wsl image

https://cloud-images.ubuntu.com/jammy/current/

4. Make a directory for the download

```
mkdir d:\ws\ubuntu-22.04\download
```

5. Download image

```
curl -O https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-wsl.rootfs.tar.gz
```

6. Install the distribution image

```
wsl --import ubuntu-22.04 D:\wsl\ubuntu-22.04\instance D:\wsl\ubuntu-22.04\download\jammy-server-cloudimg-amd64-wsl.rootfs.tar.gz
```

7. List the installed distributions

```
wsl --list --all -v
```

8. Start the distribution

```
wsl -d ubuntu-22.04
```

#### Setup the user

1.  Add a user

```
adduser gavin
```

2. Add the user to sudo group

```
usermod -aG sudo gavin
```

3. Set the user when launching WSL using a wsl.conf file

```
rm -rf /etc/wsl.conf
tee /etc/wsl.conf << EOF
# Set the user when launching a distribution with WSL.
[user]
default=gavin
EOF
```

#### Notes

1. Install Ubuntu 22.04 on WSL

https://castorfou.github.io/guillaume_blog/blog/install-ubuntu-22.04-on-WSL.html

2. Manual installation of WSL

https://docs.microsoft.com/en-us/windows/wsl/install-manual#installing-your-distro

3. Expand the size of the WSL2 virtual hard disk

Have not tried these instructions.

https://docs.microsoft.com/en-us/windows/wsl/vhd-size

## Windows ls colors

Directories in Windows are often "other writable" (ow). The default color
chosen to list them is 34;32 (blue text on green background). The code for blue
is 34 and green is 32. To change the background to black (40) use the following
LS_COLORS environment variable.

```
LS_COLORS=$LS_COLORS:'ow=34;40:'; export LS_COLORS; ls
```

Alternatively add to your .bashrc file

```
LS_COLORS=$LS_COLORS:'ow=34;40:'
```

[Change colors for directory list][30]

[30]: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console

## Setup the Ubuntu bash environment using Ansible

This guide uses [Ansible][40] an open-source automation engine that automates
software provisioning, configuration management, and application deployment.

[40]: https://www.ansible.com/

### Install Ansible on Ubuntu - MAY NOT be needed if using nix

1. Start the bash environment

```
wsl
```

2. Install pip

```
sudo apt install -y python3-pip
```

3. Install ansible

```
# install ansible using pip3 (default on Ubuntu 18.04 or higher)
sudo pip3 install ansible
```

4. Check version or Ansible

```
ansible --version
```

5. Test the execution of Ansible on localhost

```
ansible all -i localhost, -c local -m ping
```

6. Run Ansible as sudo on localhost

```
cd ansible
sudo ansible-playbook -i localhost, -c local playbook.yml -e 'ansible_python_interpreter=python3'
```

7. Setup autojump by adding this line to your ~/.bashrc file

```
source /usr/share/autojump/autojump.sh
```

### Run Ansible as the logged in user to install user utilities

```
ansible-playbook -i localhost, -c local user-util-setup.yml -e 'ansible_python_interpreter=python3'
```

## fzf aliases - moved to nix-install.md

Add these functions to your ~/.bashrc file from the vimrc project

```
source fzf-functions.sh
```

## Install ctags

Do not install ctags using nix. Install ctags using the following command.

```
sudo apt install -y universal-ctags
```

## Install pyenv

1. Install build-essential

```
sudo apt install -y make build-essential libssl-dev zlib1g-dev
sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev
sudo apt install -y curl libncursesw5-dev xz-utils
sudo apt install -y tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

2. Install pyenv

```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

3. Add to .bashrc

```
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```

4. Update pyenv

```
pyenv update
```

5. List python versions

```
pyenv install --list
```

## Using curl, httpie

An example of using curl

```
curl -X GET "http://petstore.swagger.io/v2/pet/findByStatus?status=pending" -H  "accept: application/xml" -H  "content-type: application/json"
```

The same example using httpie

```
http petstore.swagger.io/v2/pet/findByStatus?status=pending
```

Filtering the results using jq

```
http petstore.swagger.io/v2/pet/findByStatus?status=pending | jq '.[] | {cat_id: .category.id, name: .name}'
```

## Setup git

Git is already install on the latest versions of Ubuntu

Add to ~/.bashrc
export EDITOR="/usr/bin/vim"

1. Setup git

```
git config --global user.name "Gavin Noronha"
git config --global user.email "gavinln@hotmail.com"
```

2. Check git settings

```
git config --list
```

## Install bash-it

1. Clone the repo

```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
```

2. Change theme to demula using set BASH_IT_THEME=''

```
vim ~/.bashrc
```

4. To remove any bash-it theme edit ~/.bashrc and set BASH_IT_THEME=''

```
bash-it enable completion docker
```

On WSL Ubuntu 22.04 may see the following error

```
-bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8): No such file or directory
```

To solve this error run the command below and select `en_US.UTF-8`

```
sudo dpkg-reconfigure locales
```

## Install graphviz - installed using nix

```
sudo apt install -y graphviz
```

## install sqlite

May already be available in Ubuntu 22.04 and 20.04 but not WSL

```
sudo apt update && sudo apt upgrade
sudo apt install sqlite3
```

Install the latest version instead of one in repo

```
cd ~
mkdir ~/sqlite
cd ~/sqlite
SQLITE_FILE=sqlite-autoconf-3270100
wget https://www.sqlite.org/2019/$SQLITE_FILE.tar.gz
tar xvfz $SQLITE_FILE.tar.gz
cd $SQLITE_FILE
./configure --prefix=/usr/local
make
sudo make install
sqlite3 -version
```

## Install node.js and npm

Do not install as installed using nix.

Install the latest verions of node.js and npm

https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04

1. Download the node setup script

```
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
```

2. Setup the repositories

```
sudo -E bash nodesource_setup.sh
```

3. Install nodejs and check the version

```
sudo apt install nodejs
node -v
```

4. Install npm and check the version

No need to install npm as it is automatically installed with nodejs.

### Install pyright to type check Python code - installed using nix

```
sudo npm install -g pyright
```

## Install the rust toolchain

```
curl https://sh.rustup.rs -sSf | sh
```

## vim setup


1. Setup vim plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

2. Start vim

```
vim
```

3. Install plugins

```
:PlugInstall
```

## neovim (nvim) setup

### Install neovim using tar.gz file

1. Download the latest `nvim.linux64.tar.gz` file

2. Extract it to the ~ directory as Windows share is very slow

3. Create a symbolic link

```
sudo ln -s /home/gavin/nvim-linux64/bin/nvim /usr/local/bin/nvim
```

### Install using snap - Do not as it does not work with Lunar Vim

```
sudo snap install nvim
```

### Install using appimage file

1. Find the latest version of neovim https://github.com/neovim/neovim/releases/tag/stable

2. Download latest stable `nvim.appimage` file

3. Make the file executable

```
chmod u+x nvim.appimage
```

4. Create a link to the file

```
ln -s /home/gavin/nvim.appimage /usr/local/bin/nvim
```

5. Check version

```
nvim -version
```

6. Setup nvim plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

7. Start nvim

```
nvim
```

8. Install plugins

```
:PlugInstall
```

9. Update remote plugins

```
:UpdateRemotePlugins
```

10. Check health

```
:checkhealth
```

### Copy from/to Windows clipboard

To make neovim use the Windows clipboard from WSL type the following in neovim

```
:help clipboard-wsl
```

Add this to the `~/.config/nvim/init.vim` file

```
" use system clipboard
set clipboard=unnamedplus

" on WSL
" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
let g:clipboard = {
	\   'name': 'WslClipboard',
	\   'copy': {
	\      '+': 'clip.exe',
	\      '*': 'clip.exe',
	\    },
	\   'paste': {
	\      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	\      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	\   },
	\   'cache_enabled': 0,
	\ }
```

#### This section may be obsolete

1. Run the following to use neovim with the Windows WSL clipboard

```
# Update to https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

Notes:

https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
https://github.com/equalsraf/win32yank

Alternatively clip.exe is already present in windows

1. From WSL

```
pwd | clip.exe
```

2. From Windows command line

```
cd | clip.exe
```

### On Windows (not WSL) install neovim using winget

1. Search for neovim

```
winget search neovim
```

2. Install neovim using winget

```
winget install -i Neovim.Neovim
```

## Install Lunar vim (based on neovim)

https://www.lunarvim.org/docs/installation

1. Install Lunar vim

May want to install pre-requisites using nix before installing lvim

```
sudo apt install python3-pip
```

```
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
```

2. Start Lunar vim

```
lvim
```

3. Update Lunar vim

```
:LvimUpdate
```

4. Update the plugins

```
:LvimSyncCorePlugins
```

5. The configuration file is `~/.config/lvim/config.lua`


6. Uninstall LunarVim using the bundled uninstall script

```
bash ~/.local/share/lunarvim/lvim/utils/installer/uninstall.sh
```

7. Configure lvim as described here

https://www.lunarvim.org/docs/configuration

### Setup an LSP language server

1. Open a file of a type like *.py or *.rs

2. Install the LSP server for that file

```
:LspInstall

```

## Disable Ctrl+C and Ctrl+V in Windows Terminal

1. In Windows terminal open the settings using Ctrl + ,

2. Select "Open JSON file" on the bottom left

3. Edit the file to remove only the copy and paste commands

```
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",
    "actions":
    [
        {
            "command":
            {
                "action": "copy",
                "singleLine": false
            },
            "keys": "ctrl+c"
        },
        {
            "command": "paste",
            "keys": "ctrl+v"
        }
    ]
}
```

## Windows source code font

Install a font designed for [source
code](https://github.com/source-foundry/Hack). Use the font in terminals by changing the settings. Use the font in vim by changing the guifont
settings.

1. Search for the font using winget

```
winget search HackFonts
```

2. Install the HackFonts

```
winget install --id SourceFoundry.HackFonts
```

### Patch the Hack font using nerd-fonts

1. Clone the repo

```
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/Hack
```

2. In Windows Powershell set the execution policy

```
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
```

3. Run the install script

```
./install.ps1 Hack
```

4. Select the patched Hack font in the Windows Terminal settings.

## Neovide - neovim frontend

### Install by downloading file

Do not install neovide using choco as WSL mode does not work correctly

Download neovide from https://neovide.dev/

### Install using winget

```
winget install -i Neovide.Neovide
```

### Run neovide

Use `Windows_key` + R to run

1. Run using neovim on Windows

```
neovide
```

2. Run using neovim on WSL

```
neovide --wsl
```

## Windows cli-tools

### Git

[git-extras][1000] - tools for command line git

[1000]: https://github.com/tj/git-extras.git

### Install using winget

1. Search for package

```
winget search ripgrep
```

2. Install the following

May need to restart the Terminal window after installing.

```
winget install --id sharkdp.fd
winget install --id BurntSushi.ripgrep.MSVC
winget install --id sharkdp.bat
winget install --id Git.Git
winget install --id Python.Python.3.11
winget install --id Obsidian.Obsidian
```

### Install using choco

No need to install these packages if using winget

List local packages with

```
choco list -l
```

Install these first

```
choco install git hackfont
```

### File utils

```
choco install fd 7zip fzf jq bat vifm ripgrep
```

* [fd.exe][1010]: fast find utility
* [7zip][1020]: archiving utility
* [fzf][1030]: fuzzy finder
* [jq][1040]: command line json processor
* [bat.exe][1050]: Cat with color formatting
* [vifm.exe][1060]: terminal file manager with vi like shortcuts
* [ripgrep][1070]: recursively search directories

[1010]: https://github.com/sharkdp/fd
[1020]: https://en.wikipedia.org/wiki/7-Zip
[1030]: https://github.com/junegunn/fzf
[1040]: https://github.com/stedolan/jq
[1050]: https://github.com/sharkdp/bat
[1060]: https://vifm.info/downloads.shtml
[1070]: https://github.com/BurntSushi/ripgrep

### Terminals

```
choco install microsoft-windows-terminal
```

* [microsoft-windows-terminal][1110]: Windows terminal

[1110]: https://github.com/Microsoft/Terminal

#### Alacritty terminal

[Alacritty][1120] a GUI accelerated terminal emulator

[1120]: https://github.com/alacritty/alacritty

Use "Ctrl+Shift+Space" to start VI mode

Run using the following command

```
alacritty --working-directory d:\ws
```

The config-file is stored in directory `%USERPROFILE%\%APPDATA%\alacritty\alacritty.toml`


```
winget install --id Alacritty.Alacritty
```

Install [alacritty-colorscheme][1130]

[1130]: https://github.com/toggle-corp/alacritty-colorscheme/

```
pipx install alacritty-colorscheme
```

Get colors from https://github.com/aarowill/base16-alacritty

### Git

```
choco install lazygit hub
```

* [git][1200]: Git for Windows
* [lazygit][1210]: Git terminal user interface
* [hub.exe][1220]: command line tool to work with Github

[1200]: https://gitforwindows.org/
[1210]: https://github.com/jesseduffield/lazygit
[1220]: https://github.com/github/hub

#### Lazygit config

https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md

1. Print configuration dir

```
lazygit --print-config-dir
```

2. Change to config dir

```
cd $(lazygit --print-config-dir)
```

3. List the default config dir

```
ls config.yml
```

4. Print configuration

```
lazygit -c
```

5. Overwrite default config

```
lazygit -c > config.yml
```

6. Change the `selectedLineBgColor` from `blue` to `reverse`

7. Change the `selectedRangeBgColor` from `blue` to `reverse`

### Lazydocker config

1. The config directory is ~/.config/lazydocker

2. Change to config dir

```
cd ~/.config/lazydocker
```

3. List the default config dir

```
ls config.yml
```

4. Print configuration

```
lazydocker -c
```

5. Overwrite default config

```

lazydocker -c > config.yml
```

6. Change the `selectedLineBgColor` from `blue` to `reverse`

### Cloud tools

```
choco install rclone
```

* [rclone][1300]: rsync for cloud storage

[1300]: https://github.com/ncw/rclone

### Miscellaneous

```
choco install osquery pandoc graphviz
```

* [osquery][1400]: query operating systems using SQL
* [pandoc][1420]: convert documents from one format to another
* [hackfont][1430]: font for source code
* [chezmoi][1440]: manage dot files
* [graphviz][1450]: Graph visualization
* [kubectl][1460]: control Kubernetes
* [usql.exe][1470]: command line sql tool for multiple database

[1400]: https://osquery.io/
[1420]: https://pandoc.org/
[1430]: https://github.com/source-foundry/Hack
[1440]: https://github.com/twpayne/chezmoi
[1450]: https://emden.github.io/
[1460]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[1470]: https://github.com/xo/usql

Other tools to install on windows

* [ctags.exe][1500]: ctags utility
* [dbxcli.exe][1510]: command line client for Dropbox
* [sqlite3.exe][1520]: Sqlite database
* [jid.exe][1530]: json incremental debugger
* [wuzz.exe][1540]: Interactive cli tool for HTTP
* [xsv.exe][1550]: Command line CSV toolkit
* [gimp][1560]: Image manipulation tool - like Photoshop
* [imagemagick][1570]: CLI image tool

[1500]: https://github.com/universal-ctags/ctags
[1510]: https://github.com/dropbox/dbxcli
[1520]: https://www.sqlite.org/download.html
[1530]: https://github.com/simeji/jid
[1540]: https://github.com/asciimoo/wuzz
[1550]: https://github.com/BurntSushi/xsv
[1560]: https://www.gimp.org/
[1570]: https://imagemagick.org/index.php

### Python tools

* [mycli][1610]
* [httpie][1620]
* [http-prompt][1630]
* conda install python-language-server[all] [python-language-server][1640]
* pip install [pre-commit][1650]

Using [pre-commit with Python][1660]

[1610]:
[1620]:
[1630]:
[1640]:
[1650]: https://pre-commit.com/
[1660]: https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/

Other

### icdiff

diff on the command line; works with git
https://github.com/jeffkaufman/icdiff

### watchexec

Execute programs when files or directories change

https://github.com/watchexec/watchexec

### watchman

Watch for file changes and trigger actions

https://github.com/facebook/watchman

### PathPicker - fpp

Choose files from bash output

https://github.com/facebook/PathPicker

### Refactor code with human intervention

https://github.com/facebook/codemod

### shutit

Automation framework for programmers

https://github.com/ianmiell/shutit

## Install Windows GUI apps

### Lapce GUI modal editor with LSP support and remote editing via SSH

winget install lapce

https://github.com/lapce/lapce

## Install packages

Use [nix](./nix-install.md) to install packages

## Docker on Windows

Issues with Docker on WSL

* Need WSL2
* May stop VirtualBox from working (may work with Virtualbox 6.x)

https://www.tcg.com/blog/yes-you-can-run-docker-and-virtualbox-on-windows-10-home/

## Links

Configuration files

1. .wslconfig - for WSL2 only
2. wsl.conf - for WSL 1 or WSL 2

https://docs.microsoft.com/en-us/windows/wsl/wsl-config

## Powershell

### Equivalent commands

* pwd - Get-Location
* cd - Set-Location
* grep - Select-String
* which - Get-Command

To get the Powershell version

`$PSVersionTable`

To copy the current directory to the clipboard

```
Set-Clipboard -Path .
```

### Enable PSReadLine

```
https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-5.1
```

1. Enable PSReadLine

```
Install-Module -Name PSReadLine -AllowClobber -Force
```

2. Enable the emacs key bindings

```
Set-PSReadLineOption -EditMode Emacs
```

### Install Visual Studio Code

1. Download Visual Studio Code from https://code.visualstudio.com/download#

2. Install Remote Development extension pack. https://code.visualstudio.com/docs/remote/wsl

3. Setup Python in VSCode https://code.visualstudio.com/docs/languages/python

### Other software

[Steampipe queries APIs using SQL][1100]

[1100]: https://github.com/turbot/steampipe

### Mutagen

[Mutagen][1110] is a remote development tool that enables local tools to work
with remove environments by offering real-time file synchronization and network
forwarding.

[1110]: https://github.com/mutagen-io/mutagen

#### notify-send for WSL

https://stuartleeks.com/posts/wsl-github-cli-windows-notifications-part-1/

### Most popular repositories on Github

https://github.com/EvanLi/Github-Ranking
