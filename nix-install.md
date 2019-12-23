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

## Pinning nix packages

Go to the https://github.com/NixOS/nixpkgs/releases page and copy the URL of
the tar.gz file. The same page contains the commits of the release.

Then type the following

```
nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/19.09.tar.gz
```

This display the following lines with the correct sha256 hash on the last line.

```
unpacking...
[16.7 MiB DL]
path is '/nix/store/l8mm1gylamrl22c4gmy70wxgqxmi5pjk-19.09.tar.gz'
0mhqhq21y5vrr1f30qd2bvydv4bbbslvyzclhw0kdxmkgg3z4c92
```

The tar.gz archive using the commit in the name can be used and is of the form

```
https://github.com/NixOS/nixpkgs/commit/d5291756487d70bc336e33512a9baf9fa1788faf
```

If you run the same operation on the file with the commit in the name you can get the archive.

```
nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/d5291756487d70bc336e33512a9baf9fa1788faf.tar.gz
```

This displays the same sha256 hash

```
unpacking...
[16.7 MiB DL]
path is '/nix/store/cg90kd2dmv3spa1d9vsgcxz6r2b9pri0-d5291756487d70bc336e33512a9baf9fa1788faf.tar.gz'
0mhqhq21y5vrr1f30qd2bvydv4bbbslvyzclhw0kdxmkgg3z4c92
```

To specify the archive for the packages type the following

```
nix-shell -p fzf -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/19.09.tar.gz --command 'fzf --version'
nix-shell -p fzf -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/17.09.tar.gz --command 'fzf --version'
```

Different versions of the fzf utility are installed depending on the archive.

To install using channels type the following

```
nix-env -f https://github.com/NixOS/nixpkgs/archive/17.09.tar.gz -i fzf && fzf --version
nix-env -f https://github.com/NixOS/nixpkgs/archive/19.09.tar.gz -i fzf && fzf --version
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
    nix-env -q --installed
    ```

6. Add to your .bashrc file

    ```
    export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
    ```

7. Restart your shell. Type the following to see the completions

    ```
    nix-env -<TAB>
    ```

## Package dependencies

1. Display the run time dependencies of fzf

```
nix-store -qR $(which fzf)
```

2. Display the build time dependencies of fzf

```
nix-store -qR $(nix-store -qd $(which fzf))
```

To export and import a closure run these commands

1. Write a closure to a file

```
nix-store --export $(nix-store -qR $(type -p fzf)) > fzf.closure
```

2. You can then copy this file to another machine and install the closure:

```
nix-store --import < fzf.closure
```

# clean up
nix-env -e fzf && nix-collect-garbage -d

# time after clean up - 27s
time nix-env -i fzf

# time before clean up - 8s
time nix-env -i fzf

# clean up
nix-env -e fzf && nix-collect-garbage -d

# add fzf to store
```
nix-store --import < fzf.closure
```
# time after import closure to store - 24
time nix-env -i fzf

ARCHIVE=https://github.com/NixOS/nixpkgs/archive/17.09.tar.gz

# clean up
nix-env -e python3-3.7.4 && nix-collect-garbage -d

# time after clean up - 48s
time nix-env -i python3-3.4.7 -f $ARCHIVE

# time before clean up - 30s
time nix-env -i python3-3.4.7 -f $ARCHIVE

# write closure to a file
nix-store --export $(nix-store -qR $(type -p python3)) > python3-3.4.7.closure

# clean up
nix-env -e python3-3.4.7 && nix-collect-garbage -d

# add python3-3.7.4 to store
```
nix-store --import < python3-3.4.7.closure
```
# time after import closure to store - 20
time nix-env -i python3-3.4.7 -f $ARCHIVE

/nix/store/fd3y1ad57cgxgfwa9pvf8ph074zafk2r-user-environment.drv


## Generations

Generations are used in nix to rollback or forward to a different state

1. List generations

```
nix-env --list-generations
```

## Install nix packages

```
nix-env -i nix-bash-completions  # bash completions for nix
```

Add to ~/.bashrc after the `source "$BASH_IT"/bash_it.sh` command

```
export XDG_DATA_DIRS="$HOME/.nix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
```

Install other nix packages

1. Try a dry run before actuall installing

```
nix-env -i -f default.nix --dry-run
```

2. Install the packages

```
nix-env -i -f default.nix
```

3. Install these separately

```
nix-env -i git-extras  # additional git commands
nix-env -i hub  # git utilities that work with GitHub
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

## Install dot files

Run dotbot to install dot files (from vimrc repo)

```
dotbot -c install.conf.yaml
```

## Testing with a default.nix file

```
nix-env -f default.nix -i --remove-all
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
