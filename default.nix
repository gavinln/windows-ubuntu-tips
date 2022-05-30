# To install all the packages type:
# nix-env -f default.nix -i

# To display full path
# nix-env -qaP 'postgres.*'

# list the hashes for nix packages
#  git ls-remote https://github.com/nixos/nixpkgs-channels

with import <nixpkgs> {};

let
  all = [
    nix-bash-completions  # nix bash completions

    bat  # replacement for cat with syntax highlighting

    cargo  # rust package manager

    chezmoi  # manage user configurations (dotfiles) across machines

    gitAndTools.delta  # view git diff with colors

    direnv  # directory environments

    exa  # replacement for ls

    fd  # alternative to find

    fpp  # pick file paths on the command line

    # REMOVE fselect  # search for files using SQL like queries

    fzf  # fuzzy finder

    # git  # git version control, already installed ubuntu 20.04

    gh  # Gihub command line client

    graphviz  # language for drawing graphs: executable dot, neato

    imagemagick  # image view, modify tools

    jq jid  # JSON utilities

    lazygit  # alternative terminal ui for git

    gitui  # modern git terminal ui in Rust

    # REMOVE mc  # midnight commander - file manager that works with sftp

    minio  # S3 compatible server

    # minio-client  # S3 compatible client - clashes with midnight commander

    ncdu  # display disk usage

    neovim  # neovim editor

    nnn  # command line file manager

    nushell  # alternative shell

    pandoc  # convert documents into multiple formats

    pastel  # colors in the terminal

    rclone  # rsync for the cloud (like S3)

    redis  # key value store

    ripgrep  # alternative to rep

    shellcheck  # shell script static analysis tool

    sqlite  # sqlite command line interface

    tig  # terminal ui for git

    tmux  # terminal multiplexer

    tree  # directories as a tree

    unzip  # unzip files

    vifm  # text mode file manager

    vim  # terminal vim - latest version

    watchexec  # watch a path and run a command on changes (newer utility)

    watchman  # file watching service

    wuzz  # HTTP utilities

    xsv  # csv utilities: https://github.com/BurntSushi/xsv/releases/latest
  ];

in all
