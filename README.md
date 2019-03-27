# Windows-ubuntu-tips

[Bash on Ubuntu on Windows][10] provides developers with a familiar Bash shell
and Linux environment on which to run most Linux command-line tools unmodified
without needed an entire Linux virtual machine

[10]: https://msdn.microsoft.com/en-us/commandline/wsl/about

## Setup Bash on Windows

    ```
    lxrun /install
    ```

This guide uses [Ansible][20] an open-source automation engine that automates
software provisioning, configuration management, and application deployment.

## Setup the Ubuntu bash environment using Ansible

Start the bash environment

    ```
    bash
    ```

### Install Ansible on Ubuntu

    ```
    # sudo apt-get install software-properties-common
    # sudo apt-add-repository ppa:ansible/ansible
    # sudo apt-get update
    # sudo apt-get install ansible

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

3. To remove any bash-it theme edit ~/.bashrc and set BASH_IT_THEME=''

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

Other tools to install on windows

* [ctags.exe][1100]: ctags utility
* [dbxcli.exe][1110]: command line client for Dropbox
* [jid.exe][1160]: json incremental debugger
* [lazygit.exe][1170]: Git terminal user interface
* [lf.exe][1180]: Terminal file manager
* [mc.exe][1190]: Minio client for cloud storage
* [rclone.exe][1200]: rsync for cloud storage
* [rg.exe][1210]: recursively search directories
* [sqlite3.exe][1220]: Sqlite database
* [wuzz.exe][1230]: Interactive cli tool for HTTP
* [xsv.exe][1240]: Command line CSV toolkit
* [ccat.exe][1250]: cat with syntax highlighting

[1100]: https://github.com/universal-ctags/ctags
[1110]: https://github.com/dropbox/dbxcli
[1160]: https://github.com/simeji/jid
[1170]: https://github.com/jesseduffield/lazygit
[1180]: https://github.com/gokcehan/lf
[1190]: https://github.com/minio/mc
[1200]: https://github.com/ncw/rclone
[1210]: https://github.com/BurntSushi/ripgrep
[1220]: https://www.sqlite.org/download.html
[1230]: https://github.com/asciimoo/wuzz
[1240]: https://github.com/BurntSushi/xsv
[1250]: https://github.com/jingweno/ccat

Python tools

* [legit][1260]
* [mycli][1270]
* [httpie][1280]
* [http-prompt][1290]
