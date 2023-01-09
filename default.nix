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

    bottom  # htop replacement, command btm

    # cargo  # rust package manager

    chezmoi  # manage user configurations (dotfiles) across machines

    gitAndTools.delta  # view git diff with colors

    direnv  # directory environments

    difftastic  # semantic diff

    exa  # replacement for ls

    fd  # alternative to find

    fpp  # pick file paths on the command line

    fzf  # fuzzy finder

    # git  # git version control, already installed ubuntu 20.04

    gh  # Gihub command line client

    go  # go language

    graphviz  # language for drawing graphs: executable dot, neato

    gron  # make JSON greppable

    hadolint  # Dockerfile linter

    helix  # vim like modal terminal editor with lsp support

    hyperfine  # command line benchmarking tool

    imagemagick  # image view, modify tools

    jq jid  # JSON utilities

    lazygit  # alternative terminal ui for git

    gitui  # modern git terminal ui in Rust

    kondo  # clean up projects. Supports Cargo, Python, Jupyter and others

    # REMOVE mc  # midnight commander - file manager that works with sftp

    lnav  # view/search log files

    minio  # S3 compatible server

    # minio-client  # S3 compatible client - clashes with midnight commander

    ncdu  # display disk usage

    # neovim  # neovim editor causes nix to crash

    nnn  # command line file manager

    nodejs  # install nodejs

    nodePackages.pyright  # Python type checker

    nushell  # alternative shell

    pandoc  # convert documents into multiple formats

    pastel  # colors in the terminal

    pueue  # command line manager for parallel/long running task

    pv  # monitor the progress of data through a pipeline

    rclone  # rsync for the cloud (like S3)

    redis  # key value store

    ripgrep  # alternative to grep

    rust-analyzer  # semantic analysis of Rust code

    shellcheck  # shell script static analysis tool

    sqlite  # sqlite command line interface

    taplo-cli  # rust toml parser used by helix editor

    tig  # terminal ui for git

    tmux  # terminal multiplexer

    tokei  # count lines of code

    tree  # directories as a tree

    tree-sitter  # parser for programming languages

    unzip  # unzip files

    usql  # command line sql client

    viddy  # watch replacement with history

    vifm  # text mode file manager

    vim  # terminal vim - latest version

    watchexec  # watch a path and run a command on changes (newer utility)

    # wuzz  # HTTP utilities

    xsv  # csv utilities: https://github.com/BurntSushi/xsv/releases/latest

    zellij  # tmux alternative

    zoxide  # smarter cd command like z or autojump
  ];

in all
