# Install nix

[Nix][10] is a package manager for Linux and other Unix like operating systems.

[10]: https://nixos.org/

###  Windows subsystem for Linux

This section is OUTDATED

1. Create the /etc/nix directory

```
sudo install -d -m755 -o $(id -u) -g $(id -g) /nix
```

2. Create & edit /etc/nix/nix.conf, add following items:

For WSL2 may not need the following

For WSL1

```
sandbox = false
use-sqlite-wal = false
```

## Setup nix

Enable systemd on Ubuntu on WSL

https://learn.microsoft.com/en-us/windows/wsl/wsl-config#systemd-support

### Install nix on the Windows subsystem for Linux

https://nix.dev/tutorials/install-nix

1. Setup Nix on WSL using the single-user installation for Linux

```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

2. Check whether this command is added to ~/.profile

```
if [ -e /home/gavin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gavin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
```

3. Display nix version

```
nix --version
```

## Ubuntu

1. Setup nix by running a script

```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```

2. Logout and login to setup environment variables

## Test a nix package without installing it

1. Find the system  pandoc

```
which pandoc
```

2. Try pandoc without installing it

```
nix-shell -p pandoc --run 'which pandoc'
```

3. Switch back to the system pandoc

```
which pandoc
```

4. Try pandoc without installing it and starting a new shell

```
nix-shell -p pandoc
```

5. Display the pandoc in the new shell

```
which pandoc
```

6. Exit the new shell

```
exit
```

7. Switch back to the system pandoc

```
which pandoc
```

8. Clean up the space used

```
nix-collect-garbage
```

## Install nix completions

### For bash shell users

1. Get help on nix-env

```
nix-env --help
```

2. List the generations of packages

```
nix-env --list-generations
```

3. Find an available package (-a), the bash completions package

```
nix-env -qa 'nix-bash.*'
```

4. Install the nix-bash-completions package

```
nix-env -i nix-bash-completions
```

5. List the installed packages

```
nix-env -q
```

6. Add to your .bashrc file

```
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
```

7. Restart your shell. Type the following to see the completions

```
nix-env -<TAB>
```

### For zsh shell users - typically on a Mac

1. Install zsh completions

```
nix-env -i nix-zsh-completions
```

2. Add to zshrc

```
# For nix completions
fpath=(~/.nix-profile/share/zsh/site-functions $fpath)
```

3. Rebuild zsh completions data

```
rm -f ~/.zcompdump; compinit  # rebuild zcompdump completions database
```

4. You may have to restart the zsh shell

## Install packages using Nix

1. Install all the packages using a nix file

```
nix-env -f default.nix -i
```

### Setup zoxide (replacement for z or autojump)

1. Add to ~/.profile after nix.sh is called (added by nix installer)

```
eval "$(zoxide init bash)"
```

2. For zsh add zoxide to plugins, typically in `~/.zshrc`

```
plugins=(git tmux zoxide)
```

https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

3. Logout and login to setup environment variables.

## Update nix-channel

```
nix-channel --update
```

## Github setup

On WSL the ssh configuration is in $HOME/.ssh

Check access to github using ssh

```
ssh -T git@github.com
```

If you have setup ssh successfully the output will be

```
You've successfully authenticated, but GitHub does not provide shell access.
```

If you have an ERROR in your ssh setup the output will be

```
git@github.com: Permission denied (publickey)
```

### Github authentication

The `gh` utility is setup automatically using nix

To login use `gh auth login` as described here:

https://cli.github.com/manual/gh_auth

### `gh` dashboard setup

The dashboard displays pull requests and issues with custom filters. Github actions are not displayed.

https://github.com/dlvhdr/gh-dash

1. Install the dashboard extension

```
gh extension install dlvhdr/gh-dash
```

2. Get help on dashboard

```
gh dash --help
```

3. Run the dashboard

```
gh dash
```

## Install packages that cannot be installed by nix

### Install nodejs & npm

```
sudo apt install node
sudo apt install npm
```

Check nodejs version

```
node --version
```

Check npm version

```
npm --version
```

### Install pyright to type check Python code

```
sudo npm install -g pyright
```

Check pyright version

```
pyright --version
```

## Install the rust toolchain

```
curl https://sh.rustup.rs -sSf | sh
```

### Install bash-it

This is also in the README.md file.

[Bash-it][30] is a collection of scripts for Bash that includes autocompletion, themes, aliases and custom functions.

[30]: https://github.com/Bash-it/bash-it

1. Install bash-it

```
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
```

2. Change theme to demula using set BASH_IT_THEME=''

```
vim ~/.bashrc
```

3. To remove any bash-it theme edit ~/.bashrc and set BASH_IT_THEME=''

#### bash-it extensions

1. Enable completions - may not be needed, check this

```
bash-it enable completion awscli bash-it cargo docker
bash-it enable completion fabric git github-cli invoke makefile notify-send
bash-it enable completion npm pip pip3 pipenv pipx rustup ssh tmux todo
```

### Tmux plugins

Install [tmux plugins][40]

[40]: https://github.com/tmux-plugins/tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Install tmux plugins

The tmux config file is `~/.tmux.conf`

Add to the tmux config file at the top

```
set -g @plugin 'tmux-plugins/tpm'  # tmux plugin manager on github
```

Add to the tmux config file at the bottom

```
run '~/.tmux/plugins/tpm/tpm'
```

Reload the tmux environment to load tpm

```
tmux source ~/.tmux.conf
```

Install the tmux plugins

Press <prefix> + I

Choose plugins from the [plugins list](https://github.com/tmux-plugins/list).

### vifm color schemes

1. Remove the default color scheme directory with only one colorscheme

```
rm -rf ~/.config/vifm/colors
```

2. Clone the colorschems

```
git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors
```

3. Change the colorscheme in vifm

```
:colorscheme solarized-light
```

### aichat

Install aichat to connect with ChatGPT

https://github.com/sigoden/aichat

1. Install aichat

```bash
cargo install --force aichat
```

2. Display configuration

```
aichat --info
```

### nnn file manager plugin configuration

1. Setup up plugin p to preview file with bat

```
export NNN_PLUG='p:_bat -p $nnn'
```

2. Setup rclone to mount remote

```
export NNN_RCLONE='rclone mount'
```

3. Pick files and send to stdout

```
nnn -p - | fpp
```

#### Setup nnn to cd on quit

This function may be in fzf-functions.sh

```
# setup nnn to cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [[ "${NNNLVL:-0}" -ge 1 ]]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The backslash allows one to alias n to nnn if desired without making an
    # infinitely recursive alias
    \nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
```

### Git extras - cannot install using nix

[Git extras][50] are additional git commands.

[50]: https://github.com/tj/git-extras.git

```
sudo apt install git-extras
```

### Microsoft fonts

```
sudo apt install -y ttf-mscorefonts-installer
```

### Setup pipx and  Python utilities (cannot be installed using nix)

1. Install pip if needed

```
sudo apt install python3-pip
```

2. For Ubuntu 23.04 or above

```
sudo apt update
sudo apt install pipx
pipx ensurepath
```

For older versions of Ubuntu

```
# python3 -m pip install --user pipx
# python3 -m pip install --user -U pipx
```

#### Install Python packages using pipx

```
pipx install gita  # manage multiple git repositories
pipx install poetry  # manage virtual environments instead of pipenv
pipx install pre-commit  # add pre-commit checks to git
pipx install speedtest-cli  # test internet bandwith
pipx install tmuxp  # manage tmux sessions
pipx install visidata  # explore tabular data
pipx install chatblade  # cli for chatgpt
pipx install aider-chat  # AI pair programming cli that integrates with git
```

```
# may not be so useful
# pipx install httpie  # user-friendly curl. e.g. http python.org
# pipx install http-prompt  # interactive httpie
# pipx install cookiecutter  # template to create projects
# pipx install kedro  # manage machine learning pipeline
# pipx install stormssh  # Manage ~/.ssh/config file. Archived on https://github.com/emre/storm
```

### fzf aliases

Add these functions to your ~/.bashrc file from the vimrc project

```
source fzf-functions.sh
```

### Manage dotfiles

Use [chezmoi](https://github.com/twpayne/chezmoi) to manage dotfiles

1. Setup chezmoi

```
# chezmoi init https://github.com/gavinln/dotfiles.git
chezmoi init git@github.com:gavinln/dotfiles.git
```

2. Apply chezmoi

```
chezmoi apply
```

#### Example chezmoi commands

```bash
echo display commands
chezmoi help
echo create a git repo in ~/.local/share/chezmoi
chezmoi init
echo add file ~/.local/share/chezmoi/dot_tmux.conf to repo
chezmoi add ~/.tmux.conf
chezmoi add ~/.config/vifm/vifmrc
echo edit file ~/.local/share/chezmoi/dot_tmux.conf
chezmoi edit ~/.tmux.conf
echo see what difference chezmoi would make
chezmoi diff
echo apply changes
chezmoi -v apply
echo change to ~/.local/share/chezmoi
chezmoi cd
echo add and commit files
echo push files to remote repository
echo display problems
chezmoi doctor
echo fail if destination state does not match target state
chezmoi verify
exit
```

### Setup direnv

Add this to the end of the `~/.profile` file

```
eval "$(direnv hook bash)"
```

### Setup alias for ls

Setup the alias in `~/.bashrc` for eza (maintained version of exa)

```
alias lg='eza -l --git'
```

## New utilities to try

### Git time metrics

https://github.com/git-time-metric/gtm

### Multiple git repo management

https://github.com/nosarthur/gita

## Links

[Reproducible setup][1000] for Linux and Mac OS

[1000]: https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html

[Nix in a development][1010] workflow

[1010]: https://medium.com/@ejpcmac/about-using-nix-in-my-development-workflow-12422a1f2f4c

Nix [use cases][1020]

[1020]: https://bgottlob.com/post/2019-05-29-nix-use-cases/

Nix [example][1030]

[1030]: https://github.com/shajra/example-nix

[Reproducible environments][1040] with Nix

[1040]: https://www.software.ac.uk/blog/2017-10-05-reproducible-environments-nix

[Nix at Shopify][1050] Youtube video

[1050]: https://www.youtube.com/watch?v=rYzjKCIqUVk

### Other links

Nix pinning

* https://nixos.wiki/wiki/FAQ/Pinning_Nixpkgs

* https://vaibhavsagar.com/blog/2018/05/27/quick-easy-nixpkgs-pinning/
