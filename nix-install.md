# Install nix

[Nix][10] is a package manager for Linux and other Unix like operating systems.

[10]: https://nixos.org/ 

## Setup nix

###  Windows subsystem for Linux

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

3. Install nix

```
curl -L https://nixos.org/nix/install | sh
```

4. Check whether this command is added to ~/.profile

```
if [ -e /home/gavin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gavin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
```

## Ubuntu

1. Setup nix by running a script

```
curl -L https://nixos.org/nix/install | sh
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

## Install packages using Nix

1. Install all the packages using a nix file

```
nix-env -f default.nix -i
```

2. Upgrade nix packages - does not work

```
nix-env -u
```

## Github setup

On WSL the ssh configuration is in $HOME/.ssh

Check access to github using ssh

```
ssh -T git@github.com
```

## Install packages that cannot be installed by nix

### Autojump

[Autojump][20] is a `cd` command that learns making navigating directories easier.

[20]: https://github.com/wting/autojump

1. Install autojump

```
sudo apt install autojump
```

2. Setup autojump by adding this line to your ~/.bashrc file

```
source /usr/share/autojump/autojump.sh
```

### Install bash-it

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

1. Enable autojump

```
bash-it enable plugin autojump
```

### Tmux plugins

Install [tmux plugins][40]

[40]: https://github.com/tmux-plugins/tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

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

1. Install pipx

```
python3 -m pip install --user pipx
python3 -m pipx ensurepath
```

2. Update pipx

```
python3 -m pip install --user -U pipx
```

#### Install Python packages using pipx

```
pipx install httpie  # user-friendly curl. e.g. http python.org
pipx install http-prompt  # interactive httpie
pipx install tmuxp  # manage tmux sessions
pipx install stormssh  # manage the ~/.ssh/config file
pipx install cookiecutter  # template to create projects
# do not install pipenv using pipx. Use the default Python
# pipx install pipenv  # manage environments using Pipenv
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
chezmoi init https://github.com/gavinln/dotfiles.git
```

2. Apply chezmoi

```
chezmoi apply
```

1. Install chezmoi

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

Setup the alias in `~/.bashrc` for exa

```
alias lg='exa -l --git'
```

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
