## Setup USB boot thumb drive

Download Rufus to setup the USB boot thumb drive with
ubuntu-18.04-desktop-amd64.iso

## Setup ssh-server

TODO: Remove use of tasksel to install openssh-server

https://linuxconfig.org/how-to-install-ssh-server-on-ubuntu-18-04-bionic-beaver-linux

1. Install tasksel

```
sudo apt install tasksel
```

2. Install ssh server

```
sudo tasksel install openssh-server
```

### Change SSH server port

https://www.godaddy.com/help/changing-the-ssh-port-for-your-linux-server-7306

1. Open ssh config file

```
vim /etc/ssh/sshd_config
```

2. Change the port number (Port 22)

3. Restart the server

```
sudo systemctl restart ssh
```

### Create private/public key for ssh

https://www.ssh.com/ssh/copy-id

1. Find where git bash is installed

```
where bash
```

2. Start git bash

```
"C:\Program Files\Git\usr\bin\bash.exe"
```

3. Change to ssh directory

```
cd ~/.ssh
```

4. Copy public key to gavinsvr

```
ssh-copy-id -i id_rsa.pub -p 443 gavin@gavinsvr
```

5. Try connecting using private key

```
ssh -p 443 gavin@gavinsvr
```

### Setup ssh_config

1. Display help

```
storm -h
```

2. List configurations

```
storm list
```

3. Get help on add

```
storm add -h
```

4. Add configuration for gavinsvr

```
storm add --id_file %USERPROFILE%\.ssh\id_rsa gavinsvr gavin@gavinsvr:443
```

5. Connect to server

```
ssh gavinsvr
```

## Change password

https://askubuntu.com/questions/423942/change-password-on-root-user-and-user-account

1. Change your own password

```
passwd
```

2. Change root password

```
sudo passwd
```

## Setup git config

https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup

1. Show git configuration settings

```
git config --list --show-origin
```

2. Setup git identity

```
git config --global user.name "Gavin Noronha"
git config --global user.email gavinln@hotmail.com
```

## Partitions

1. List partitions

```
sudo fdisk -l
```

2. Mount partition

```
sudo mount /dev/sda1 /mnt
```

3. Unmount partition

```
sudo umount /mnt
```

## Things to do after install

https://fosspost.org/tutorials/things-to-do-after-installing-ubuntu-20-04

### System update

1. Update repository data

```
sudo apt update
```

2. Upgrade system

```
sudo apt -y upgrade
```

3. Major upgrades

```
sudo apt dist-upgrade
```

### Enable partner repositories & graphic drivers

Go to Software & Updates, then Other Software tab and select all the additional
repositories other than Source Code Repositories.

Launch Software & Updates and hover over to the Additional Drivers tab. Under
the Additional Drivers tab, you can choose whether to install the closed source
proprietary software or open source x.org Xerver Driver. Installing the
proprietary graphics driver is the recommended one in the list.

### UI settings

1. Install synaptic package manager
sudo apt install -y synaptic

### Other libraries

1. Install complete multimedia support
sudo apt install ubuntu-restricted-extras

4. Install Microsoft True Type fonts

https://itsfoss.com/install-microsoft-fonts-ubuntu/

```
sudo apt install ttf-mscorefonts-installer
```

5. Install Java

https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04

```
sudo apt install default-jre
```

5. Check Java version

```
java -version
```

6. Install Gimp

```
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
```

7. Install Gnome

```
sudo add-apt-repository -y ppa:gnome3-team/gnome3
```

8. Install libdvcss

```
echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -
```

0. Install essentials

```
sudo apt install -y synaptic vlc gimp gimp-data gimp-data-extras \
    bleachbit openjdk-8-jre  \
    unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview \
    mpack arj cabextract file-roller mencoder flac faac faad sox \
    ffmpeg2theora libmpeg2-4 uudeview mpeg3-utils mpegdemux liba52-dev \
    mpeg2dec vorbis-tools id3v2 mpg321 mpg123 icedax lame libmad0 \
    libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 ubuntu-restricted-extras
```

12. Install Chrome

```
if [[ $(getconf LONG_BIT) = "64" ]]
then
    echo "64bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
    sudo dpkg -i google-chrome-stable_current_amd64.deb &&
    rm -f google-chrome-stable_current_amd64.deb
else
    echo "32bit Detected" &&
    echo "Installing Google Chrome" &&
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
    sudo dpkg -i google-chrome-stable_current_i386.deb &&
    rm -f google-chrome-stable_current_i386.deb
fi
```


## Setup VNC screen sharing

Ubuntu 18.04 switched from lightdm to gdm3. VNC requires switching to lightdbm

https://itectec.com/ubuntu/ubuntu-ubuntu-18-04-connect-to-login-screen-over-vnc/

You may need to logout of Ubuntu desktop to switch

Switch to the default manager gdmb3

```
sudo dpkg-reconfigure gdm3
```

Switch to lightdm

```
sudo dpkg-reconfigure lightdm
```

Alternatively for ubuntu 20.04 see

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04

### Install VNC server

https://help.ubuntu.com/community/VNC/Servers
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04

1. Install tightvnc server

```
sudo apt install tightvncserver
```

2. Install xfce4 (works on VNC)

```
sudo apt install xfce4 xfce4-goodies
```

3. In ~/.vnc/xstartup add

```
xrdb $HOME/.Xresources
startxfce4 &
```

4. Start up vnc server

```
vncserver -depth 24 -geometry 1920x1080 -localhost :1
```

5. Check the vnc server process

```
ss -tlp | grep vnc
```

6. Login to the machine while redirecting the correct port

```
ssh -L 5901:localhost:5901 gavinsvr
```

7. Open the TightVNC viewer (tightVNC) to localhost::5901

See this document on disabling encryption for screen sharing

http://ubuntuhandbook.org/index.php/2016/07/remote-access-ubuntu-16-04/

## Setup software using Ansible

See the file ubuntu-ansible-setup.md for instructions using Ansible.

The manual steps below show be automated using Ansible and deleted from this
file.

### Install Ansible on Ubuntu

```
echo install ansible using pip3 (default on Ubuntu 18.04 or higher)
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

```bash
cd ansible
sudo ansible-playbook -i localhost, -c local playbook.yml -e 'ansible_python_interpreter=python3'
```

### Run Ansible as the logged in user to install user utilities

```bash
ansible-playbook -i localhost, -c local user-util-setup.yml -e 'ansible_python_interpreter=python3'
```

## Install utilities

The following utilities are installed by nix

### Utilities installed by nix

1. Install tmux

```
sudo apt install tmux
```

2. Install tree

```
sudo snap install tree
```

3. Install jq

```
sudo snap install jq
```

4. Install vifm

```
sudo apt install vifm
```

## Install git - already installed on ubuntu 20.04

https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-18-04

1. Install git

```
sudo apt update
sudo apt upgrade
sudo apt install -y git
```

## Setup pyenv - first version

This appears twice in this document

1. Install pyenv

```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

2. Install Python build dependencies

```
sudo apt-get update
sudo apt-get install --no-install-recommends make build-essential \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    wget curl llvm \
    libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
    libffi-dev liblzma-dev
```

3. Update pyenv

```
pyenv update
```

4. Add to .bashrc (may already be present)

```
export PATH="/home/gavin/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

## Install Python

1. List Python versions installed

```
pyenv versions
```

2. List Python versions available to install

```
pyenv install -l
```

3. Install Python

```
pyenv install 3.8.7
```

4. List Python versions installed

```
pyenv versions
```

5. Set a global version

```
pyenv global 3.8.7
```

## Install Python utilities

1. Install pipx

```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

2. Install tmuxp to manage tmux sessions

```
pipx install tmuxp
```

3. Install http

```
pipx install httpie
```

4. Install docker-compose

```
pipx install docker-compose
```

### Install Python utilities - old

Setup using Ansible or pipx

1. Install Python pip

```
sudo apt install python3-pip
```

2. Install tmuxp to manage tmux sessions

```
pip3 install tmuxp
```

3. Install http

```
pip3 install httpie
```

4. Install legit for git aliases

```
pip3 install legit
```

5. Install dotbot to manage dot files

```
pip3 install dotbot
```

## Setup bash-it

Install using Ansible

1. Clone the bash-it code

```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
```

2. Install bash-it

```
~/.bash_it/install.sh
```

3. Change theme to demula using set BASH_IT_THEME=''

```
vim ~/.bashrc
```

3. View bash-it details

```
bash-it show aliases
bash-it show completions
bash-it show plugins
```

## Install libdvdcss

```
echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -
```

## Install Kodi
https://linuxconfig.org/how-to-install-kodi-on-ubuntu-18-04-bionic-beaver-linux

## Install Apache

https://linuxconfig.org/install-apache-on-ubuntu-18-04-bionic-beaver-linux

1. Install apache

```
sudo apt install apache2
```

2. Visit the Apache home page at http://gavinsvr/

### Install Webdav for Zotero

https://linuxconfig.org/webdav-server-setup-on-ubuntu-linux
https://www.techrepublic.com/article/how-to-enable-webdav-on-your-ubuntu-server/

1. Make a directory for webdav

```
cd /var/www
sudo mkdir /var/www/webdav
sudo chown www-data /var/www/webdav
```

2. Update /etc/apache2/sites-enabled/000-default.conf

```
<Directory /var/www/webdav/>
    Options Indexes MultiViews
    AllowOverride None
    Order allow,deny
    allow from all
</Directory>

Alias /webdav /var/www/webdav

<Location /webdav>
    DAV On
    AuthType Basic
    AuthName "webdav"
    AuthUserFile /var/www/passwd.dav
    Require valid-user
</Location>
```

3. Create a password file

```
sudo htpasswd -c /var/www/passwd.dav gavin
```

2. Enable Webdav modules for Apache

```
sudo a2enmod dav
sudo a2enmod dav_fs
```

2. Restart Apache

```
systemctl restart apache2
```

Make sure to combine the 000-default.conf with the webdav.conf so that
there is only one file.

### When using Zotero to sync

If you start with an empty online library (not local library) you may
want to reset syncing

https://www.zotero.org/support/kb/sync_reset_options

### Test Webdav

https://uvacollab.screenstepslive.com/s/7291/m/52584/l/611578-how-do-i-set-up-webdav-for-windows-10-or-8

1. Install program to test webdav

```
sudo apt-get install cadaver
```
2. Connect to webdav server

```
cadaver http://server/webdav
```

## Install virtualbox

1. Download Virtual box from https://www.virtualbox.org/wiki/Linux_Downloads

2. Install the package
sudo dpkg -i virtualbox-5.2_5.2.20-125813~Ubuntu~bionic_amd64.deb

## Install vagrant

1. Install the package
sudo apt install vagrant

## Install kubernetes

1. Install kubectl

```
sudo snap install kubectl --classic
```

2. Check kubectl version

```
kubectl version
```

3. Download Minikube https://github.com/kubernetes/minikube/releases

4. Install Minikube

```
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-linux-amd64
chmod +x minikube
sudo cp minikube /usr/local/bin/
```

5. Start a minikube cluster if needed

```
# delete old cluster if needed: minikube delete
minikube start
```

6. Setup kubectl to use minikube

```
kubectl config use-context minikube
```

7. Display the cluster details

```
kubectl cluster-info
```

8. List Virtualbox vms

```
VBoxManage list runningvms
# map from host port 58443 to guest port 8443 (kubernetes port)
VBoxManage controlvm minikube natpf1 rule1,tcp,0.0.0.0,58443,,8443
```

## Install Docker

1. Install docker

```
sudo apt install docker.io
```

2. Check whether the docker group exists

```
getent group | grep docker
```

3. Add current user to Docker group

```
sudo usermod -aG docker $USER
```

### Install Docker - old

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

1. Install Docker pre-requisites

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

2. Add GPG key

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

3. Add Docker repository to APT sources

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
```

4. Install Docker

```
sudo apt install docker-ce
```

5. Check whether Docker is running

```
sudo systemctl status docker
```

## Dropbox

1. Install 64 bit dropbox cli

```
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
```

2. Execute the dropbox command

```
~/.dropbox-dist/dropboxd
```

3. Visit the web link on any commputer to connect the system with your account

4. The ~/Dropbox folder on your computer will be synchronized

5. Start dropbox sync

```
nohup .dropbox-dist/dropboxd &
```

6. List jobs

```
jobs
```

## [Taskwarrior](https://taskwarrior.org/docs/)

1. Install taskwarrior

```
sudo apt install taskwarrior
```

2. Setup taskwarrior to synchronize using Dropbox

```
task config data.location ~/Dropbox/taskwarrior
```

3. List taskwarrior commands

```
task commands
```

3. To setup [vim-taskwarrior](https://github.com/blindFS/vim-taskwarrior)
add to ~/.vimrc

```
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'blindFS/vim-taskwarrior'

" Initialize plugin system
call plug#end
```

4. Run :PlugInstall in vim

5. Type :TW to view task report

## Miscellaneous

1. Install apache2 with webdav for zotero

2. Change port forwarding to point to gavinsvr web server

4. Copy video files to new machine

5. Copy workspace files we to new machine

6. Setup ssh key login

7. Update ssh config file to simplify ssh login

## Setup pyenv - second version

See aws-vm or eb-lambda for pyenv setup using Ansible

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

3. Update pyenv

```
pyenv update
```

4. Add to .bashrc

```
export PATH="/home/gavin/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

## Install Postgres driver pre-requisite

1. Install pg_config need for Postgres driver

```
sudo apt install -y libpq-dev
```

## Install autojump

Setup using Ansible

1. Install autojump

```
sudo apt install autojump
```

2. After install setup profile

```
bash-it enable plugin autojump
```

## CLI tools

Install using Ansible

Git extras

```
sudo apt-get install git-extras
```

## Install tmux plugins

### Install [tmux plugin manager](https://github.com/tmux-plugins/tpm)

1. Clone the tmux plugin manager

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Add this at the bottom of the .tmux.conf file

```
# Initialize TMUX plugin manager (keep this line at the bottom of tmux.conf)
run -b '~/.tmux/plugins/tpm/tpm'
```

### Install [tmux resurrect](https://github.com/tmux-plugins/tmux-resurrect)
plugin to save & restore session

1. Add this to the list of tmux plugins

```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
```

2. Restart tmux

3. Install the plugin manager by typing prefix + I (capital letter)

## Links

[20 things to do after installing Ubuntu 20.04][1000]

[1000]: https://fosspost.org/tutorials/things-to-do-after-installing-ubuntu-20-04

[24 things to do after installing Ubuntu 20.04][1010]

[1010]: https://fossbytes.com/things-to-do-after-installing-ubuntu/

[16 things to do after installing Ubuntu 20.04][1020]

[1020]: https://itsfoss.com/things-to-do-after-installing-ubuntu-20-04/

[Play DVD in Ubuntu 20.04][1030]

[1030]: https://itsfoss.com/play-dvd-ubuntu-1310/

[How to upgrade][1040] from 18.04 to 20.04

[1040]: https://ubuntu.com/blog/how-to-upgrade-from-ubuntu-18-04-lts-to-20-04-lts-today
