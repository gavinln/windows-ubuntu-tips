# Install nix

## Setup nix on Windows subsystem for Linux

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

4. Check whether this command is added to ~/.profile

```
if [ -e /home/gavinln/.nix-profile/etc/profile.d/nix.sh ]; then . /home/gavinln/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
```

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

3. Find an available package (-a)

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

## Install packages that cannot be installed by nix

### Autojump

1. Install autojump
sudo apt install autojump

2. Setup autojump by adding this line to your ~/.bashrc file

```
source /usr/share/autojump/autojump.sh
```

### fzf aliases

Add these functions to your ~/.bashrc file from the vimrc project

```
source fzf-functions.sh
```

### Install bash-it

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

### Git extras

[git-extras][https://github.com/tj/git-extras.git] - tools for command line git

Install git-extras using nix

```
nix-env -i git-extras
```

Install hub that works with Github

```
nix-env -i hub  # git utilities that work with GitHub
```

### Manage dotfiles

Use [chezmoi](https://github.com/twpayne/chezmoi) to manage dotfiles

1. Install chezmoi

```
nix-env -i chezmoi
chezmoi help  # display commands
chezmoi init  # create a git repo in ~/.local/share/chezmoi
chezmoi add ~/.tmux.conf  # add file ~/.local/share/chezmoi/dot_tmux.conf to repo
chezmoi add ~/.config/vifm/vifmrc
chezmoi edit ~/.tmux.conf  # edit file ~/.local/share/chezmoi/dot_tmux.conf
chezmoi diff  # see what difference chezmoi would make
chezmoi -v apply  # apply changes
chezmoi cd  # change to ~/.local/share/chezmoi
# add and commit files
# push files to remote repository
exit
chezmoi doctor  # display problems
chezmoi verify  # fail if destination state does not match target state
```

### Packages that cannot be installed using nix

```
nix-env -i httpie http-prompt
```

### Setup direnv

Add this to the end of the `~/.profile` file

```
eval "$(direnv hook bash)"
```

### Install Python packages

```
nix-env -i httpie  # user-friendly curl. Type: http python.org

nix-env -i http-prompt  # interactive httpie

### Install pyenv and then these Python packages use pipenv
```

### Install dot files (replaced by chezmoi)

Run dotbot to install dot files (from vimrc repo)

```
# dotbot -c install.conf.yaml
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
