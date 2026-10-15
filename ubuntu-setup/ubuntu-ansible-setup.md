## Setup software using Ansible

### Install Ansible

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

## Install utilities

Should setup these using Ansible

1. Install tmux

```
sudo apt install tmux
```

2. Install htop

```
sudo snap install htop
```

## Install Python utilities

Setup using Ansible

1. Install Python pip

```
sudo apt install python3-pip
```

2. Install tmuxp to manage tmux sessions

```
pip3 install tmuxp
```

## Setup pyenv

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

## Install autojump

Setup using Ansible

1. After install setup profile

```
bash-it enable plugin autojump
```

## CLI tools

Install using Ansible or using brew on Mac

Git extras

```
sudo apt-get install git-extras
```
