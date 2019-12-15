# Windows-ubuntu-tips

[Bash on Ubuntu on Windows][10] provides developers with a familiar Bash shell
and Linux environment on which to run most Linux command-line tools unmodified
without needed an entire Linux virtual machine

[10]: https://msdn.microsoft.com/en-us/commandline/wsl/about

## Setup Bash on Windows

Follow these [instructions][20]

[20]: https://docs.microsoft.com/en-us/windows/wsl/install-win10

This guide uses [Ansible][30] an open-source automation engine that automates
software provisioning, configuration management, and application deployment.

[30]: https://www.ansible.com/

### WSL commands

Example wsl commands

```
wsl --list --all  # list all distributions
wsl --list --running  # list running distribution
wsl --terminate "Ubuntu-18.04"  # terminate the distribution
```

## Setup the Ubuntu bash environment using Ansible

1. Start the bash environment

```
wsl
```

2. Install Python

```
sudo apt install python3
```

3. Install pip

```
sudo apt install python3-pip
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

2. Run Ansible as sudo on localhost

```
cd ansible
sudo ansible-playbook -i localhost, -c local playbook.yml -e 'ansible_python_interpreter=python3'
```

### Run Ansible as the logged in user to install user utilities

```
ansible-playbook -i localhost, -c local user-util-setup.yml -e 'ansible_python_interpreter=python3'
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

1. Install legit git aliases

```
legit --install
```

2. Install bash-it

```
~/.bash_it/install.sh
```

3. Change theme to demula using set BASH_IT_THEME=''

```
vim ~/.bashrc
```

4. To remove any bash-it theme edit ~/.bashrc and set BASH_IT_THEME=''

## Get Docker client binaries

```
mkdir docker
wget https://test.docker.com/builds/Linux/x86_64/docker-17.04.0-ce-rc1.tgz
tar -xvf docker-17.04.0-ce-rc1.tgz
cd docker
sudo cp docker /usr/local/bin
sudo cp completion/bash/docker /etc/bash_completion.d
```

## install bash-it

```
bash-it enable completion docker
```

## install sqlite

```
# install latest version instead of one in repo
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

## Install exa

[exa](https://github.com/ogham/exa) replacement for ls

## nvim setup

1. Change to the configuration directory

```
cd ~/.config/nvim
```

2. Create a configuration file called init.vim

## Windows source code font

Install a font designed for [source
code](https://github.com/source-foundry/Hack). Use the font in terminals such
as cmder by changing the settings. Use the font in vim by changing the guifont
settings.

## Miscellaneous

* [fselect][900]

[900]: https://github.com/jhspetersson/fselect

## Windows cli-tools

### Git

[git-extras][1000] - tools for command line git

[1000]: https://github.com/tj/git-extras.git

Using choco install the following

* [7zip][1010]: archiving utility
* [ag][1020]: command line searcher
* [fzf][1030]: fuzzy finder
* [jq][1040]: command line json processor
* [neovim][1050]: modern version of vim
* [osquery][1060]: query operating systems using SQL
* [putty][1070]: ssh client terminal
* [kubectl][1080]: control Kubernetes
* [pandoc][1090]: convert documents from one format to another
* [fd.exe][1130]: fast find utility
* [hub.exe][1150]: command line tool to work with Github
* [bat.exe][1160]: Cat with color formatting
* [vifm.exe][1170]: terminal file manager with vi like shortcuts
* [cmder.exe][1180]: Console emulator on Windows
* [microsoft-windows-terminal][1190]: Windows terminal

[1010]: https://en.wikipedia.org/wiki/7-Zip
[1020]: https://github.com/ggreer/the_silver_searcher
[1030]: https://github.com/junegunn/fzf
[1040]: https://github.com/stedolan/jq
[1050]: https://github.com/neovim/neovim
[1060]: https://osquery.io/
[1070]: https://www.putty.org/
[1080]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[1090]: https://pandoc.org/
[1130]: https://github.com/sharkdp/fd
[1150]: https://github.com/github/hub
[1160]: https://github.com/sharkdp/bat
[1170]: https://vifm.info/downloads.shtml
[1180]: https://cmder.net/
[1190]: https://github.com/Microsoft/Terminal

Other tools to install on windows

* [ctags.exe][1200]: ctags utility
* [dbxcli.exe][1210]: command line client for Dropbox
* [jid.exe][1220]: json incremental debugger
* [lazygit.exe][1230]: Git terminal user interface
* [lf.exe][1240]: Terminal file manager
* [mc.exe][1250]: Minio client for cloud storage
* [rclone.exe][1260]: rsync for cloud storage
* [rg.exe][1270]: recursively search directories
* [sqlite3.exe][1280]: Sqlite database
* [usql.exe][1285]: command line sql tool for multiple database
* [wuzz.exe][1290]: Interactive cli tool for HTTP
* [xsv.exe][1300]: Command line CSV toolkit

[1200]: https://github.com/universal-ctags/ctags
[1210]: https://github.com/dropbox/dbxcli
[1220]: https://github.com/simeji/jid
[1230]: https://github.com/jesseduffield/lazygit
[1240]: https://github.com/gokcehan/lf
[1250]: https://github.com/minio/mc
[1260]: https://github.com/ncw/rclone
[1270]: https://github.com/BurntSushi/ripgrep
[1280]: https://www.sqlite.org/download.html
[1285]: https://github.com/xo/usql
[1290]: https://github.com/asciimoo/wuzz
[1300]: https://github.com/BurntSushi/xsv

Python tools

* conda install [legit][1400]
* [mycli][1410]
* [httpie][1420]
* [http-prompt][1430]
* conda install python-language-server[all] [python-language-server][1440]
* pip install [pre-commit][1450]

Using [pre-commit with Python][1460]

[1400]: 
[1410]: 
[1420]: 
[1430]: 
[1440]: 
[1450]: https://pre-commit.com/
[1460]: https://ljvmiranda921.github.io/notebook/2018/06/21/precommits-using-black-and-flake8/

Other

### icdiff

diff on the command line; works with git
https://github.com/jeffkaufman/icdiff

### googler

search google from the cli

https://github.com/jarun/googler

### watchexec

Execute programs when files or directories change

https://github.com/watchexec/watchexec

### shutit

Automation framework for programmers

https://github.com/ianmiell/shutit

## Using nix

### Setup nix on Windows subsystem for Linux

1. Create the /etc/nix directory

```
mkdir -p /etc/nix
```

2. Create & edit /etc/nix/nix.conf, add following items:

```
sandbox = false
use-sqlite-wal = false
```

3. Install nix

```
curl https://nixos.org/nix/install | sh
```

### Install nix completions

1. Get help on nix-env

```
nix-env --help
```

2. List the generations of packages

```
nix-env --list-generations
```

3. Find an available package (-a)

```
nix-env -qa 'nix-bash.*'
```

4. Install the `nix-bash-completions` package

```
nix-env -i nix-bash-completions
```

5. List the installed packages

```
nix-env -q --installed
```

6. Add to your `.bashrc` file

```
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
```

7. Restart your shell. Type the following to see the completions

```
nix-env -<TAB>
```

### Install nix packages

```
nix-env -i tig git-extras lazygit  # git utilities

nix-env -i fd ripgrep  # search for files and within files

nix-env -i jq unzip vifm pandoc ncdu

nix-env -i wuzz  # interactive curl

nix-env -i ctags

nix-env -i tree  # directories as a tree

nix-env -i exa  # replacement for ls

nix-env -i minio minio-client  # minio server and client

nix-env -i direnv  # create directory environments
```
### Setup direnv

TODO:

### Install Python packages

```
nix-env -i tmuxp  # Python tmux manager

nix-env -i httpie  # user-friendly curl

nix-env -i http-prompt  # interactive httpie
```

### Install pyenv and then these Python packages use pipenv

```
proselint  # linter for Prose
pipenv  # a Python package manager
stormssh  # manage the ssh config
legit  # git utils in Python
```

### Other utilities

osquery from Facebook cannot be found in nix
