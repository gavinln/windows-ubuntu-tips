# Windows-ubuntu-tips

[Bash on Ubuntu on Windows][10] provides developers with a familiar Bash shell
and Linux environment on which to run most Linux command-line tools unmodified
without needed an entire Linux virtual machine

[10]: https://msdn.microsoft.com/en-us/commandline/wsl/about

## Setup Bash on Windows

Follow these [instructions][20]

[20]: https://docs.microsoft.com/en-us/windows/wsl/install-win10

Run these in powershell

```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Check the version of Ubuntu

```
cat /etc/lsb-release
```

To install Docker on WSL2 follow these instructions

https://nickymeuleman.netlify.com/blog/linux-on-windows-wsl2-zsh-docker

### Install Docker

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

Example wsl commands

```
echo list all distributions
wsl --list --all  # list all
echo list running distributions
wsl --list --running
echo terminate a distribution, misspelled on purpose
wsl --terminate "Ubuntu-18.04--"
```

## Windows ls colors

Directories in Windows are often "other writable" (ow). The default color
chosen to list them is 34;32 (blue text on green background). The code for blue
is 34 and green is 32. To change the background to black (40) use the following
LS_COLORS environment variable.

```
LS_COLORS=$LS_COLORS:'ow=34;40:'; export LS_COLORS; ls
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
sudo apt install -y llvm libncurses5-dev libncursesw5-dev
sudo apt install -y xz-utils tk-dev libffi-dev liblzma-dev
```

2. Install pyenv

```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

3. Add to .bashrc

```
export PATH="/home/gavin/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
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

## First login setup

1. Install bash-it

```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
```

2. Change theme to demula using set BASH_IT_THEME=''

```
vim ~/.bashrc
```

4. To remove any bash-it theme edit ~/.bashrc and set BASH_IT_THEME=''

## install bash-it

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

## nvim setup

1. Change to the configuration directory

```
cd ~/.config/nvim
```

2. Create a configuration file called init.vim

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
choco install osquery pandoc zeal graphviz
```

* [osquery][1400]: query operating systems using SQL
* [pandoc][1420]: convert documents from one format to another
* [hackfont][1430]: font for source code
* [zeal][1440]: offline documentation
* [graphviz][1450]: Graph visualization
* [kubectl][1460]: control Kubernetes
* [usql.exe][1470]: command line sql tool for multiple database

[1400]: https://osquery.io/
[1420]: https://pandoc.org/
[1430]: https://github.com/source-foundry/Hack
[1440]: https://github.com/zealdocs/zeal
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

### Boostrapped confidence intervals

https://github.com/facebookincubator/bootstrapped

### shutit

Automation framework for programmers

https://github.com/ianmiell/shutit

## Use [nix](./nix-install.md) to install packages
## Docker on Windows

Issues with Docker on WSL

* Need WSL2
* May stop VirtualBox from working (may work with Virtualbox 6.x)

https://www.tcg.com/blog/yes-you-can-run-docker-and-virtualbox-on-windows-10-home/
