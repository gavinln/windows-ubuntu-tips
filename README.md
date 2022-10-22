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

https://linuxconfig.org/how-to-install-docker-on-ubuntu-22-04

Older documentation

https://nickymeuleman.netlify.com/blog/linux-on-windows-wsl2-zsh-docker

#### Docker on older versions of Ubuntu

1. Update the software and install pre-requisites

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

2. Add Docker's GPG-key

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

3. Verify the key

```
sudo apt-key fingerprint 0EBFCD88
```

4. Add the Docker repo

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

5. Install Docker CE

```
sudo apt update
sudo apt install docker-ce
```

6. Start Docker

```
sudo service docker start
```

7. Add the current user to the docker group

```
sudo usermod -aG docker $USER
```

8. Run the hello-world container

```
docker run hello-world
```

This guide uses [Ansible][30] an open-source automation engine that automates
software provisioning, configuration management, and application deployment.

[30]: https://www.ansible.com/

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

[Change colors for directory list][40]

[40]: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console

## Setup the Ubuntu bash environment using Ansible

1. Start the bash environment

```
wsl
```

2. Install pip

```
sudo apt install -y python3-pip
```

### Install Ansible on Ubuntu

This MAY NOT be needed if using nix

```
# install ansible using pip3 (default on Ubuntu 18.04 or higher)
sudo pip3 install ansible
```

1. Check version or Ansible

```
ansible --version
```

2. Test the execution of Ansible on localhost

```
ansible all -i localhost, -c local -m ping
```

3. Run Ansible as sudo on localhost

```
cd ansible
sudo ansible-playbook -i localhost, -c local playbook.yml -e 'ansible_python_interpreter=python3'
```

4. Setup autojump by adding this line to your ~/.bashrc file

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
sudo apt install -y wget curl llvm libncursesw5-dev xz-utils
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

## Install graphviz - installed using nix

```
sudo apt install -y graphviz
```

## install sqlite - already available in Ubuntu 20.04

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

### Install pyright to type check Python code

```
sudo npm install -g pyright
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

1. Install neovim (not installed using nix)

```
sudo apt install neovim
```

2. Check version

```
nvim -version
```

3. Setup nvim plug

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Start nvim

```
nvim
```

5. Install plugins

```
:PlugInstall
```

6. Update remote plugins

```
:UpdateRemotePlugins
```

7. Check health

```
:checkhealth
```

### Copy from/to Windows clipboard

1. Run the following to use neovim with the Windows WSL clipboard

```
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

Notes:

https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
https://github.com/equalsraf/win32yank

## Windows source code font

Install a font designed for [source
code](https://github.com/source-foundry/Hack). Use the font in terminals by changing the settings. Use the font in vim by changing the guifont
settings.

## Windows cli-tools

### Git

[git-extras][1000] - tools for command line git

[1000]: https://github.com/tj/git-extras.git

Using choco install the following

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

```
choco install alacritty
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

### Other software

[Steampipe queries APIs using SQL][1100]

[1100]: https://github.com/turbot/steampipe

### Mutagen

[Mutagen][1110] is a remote development tool that enables local tools to work
with remove environments by offering real-time file synchronization and network
forwarding.

[1110]: https://github.com/mutagen-io/mutagen
