# Windows-ubuntu-tips

[Bash on Ubuntu on Windows][1] provides developers with a familiar Bash shell and Linux environment on which to run most Linux command-line tools unmodified
without needed an entire Linux virtual machine

[1]: https://msdn.microsoft.com/en-us/commandline/wsl/about

## Setup Bash on Windows
```
lxrun /install
```


## setup ubuntu
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

## Test ansible on localhost
```
ansible all -i localhost, -c local -m ping
```

## Run ansible on localhost
```
cd ansible
sudo ansible-playbook -i localhost, -c local playbook.yml
# may need to add the following to .bashrc
# for f in /etc/profile.d/*; do source $f; done
```

## Run ansible to install user utilities
```
ansible-playbook -i localhost, -c local user-util-setup.yml
```

## First login setup

1. Install legit git aliases
```
legit install
```

2. Install bash-it
```
~/.bash_it/install.sh
```

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
~/.bash_it/install.sh
bash-it enable completion docker
```
