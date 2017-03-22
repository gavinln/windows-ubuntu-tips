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

## Run ansible on localhost
```
ansible all -i localhost, -c local -m ping
sudo ansible-playbook -i localhost, -c local playbook2.yml
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

## setup bash-id
```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
```

## install bash-it
```
~/.bash_it/install.sh
bash-it enable completion docker
```

export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=/mnt/c/Users/gavin/.docker/machine/machines/default

