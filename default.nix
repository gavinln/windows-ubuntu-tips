# To install all the packages type:
# nix-env -f default.nix -i

# To display full path
# nix-env -qaP 'postgres.*'

# list the hashes for nix packages
#  git ls-remote https://github.com/nixos/nixpkgs-channels

with import <nixpkgs> { };

let
  all = [
    nix-bash-completions # nix bash completions

    act # run github actions locally

    bat # replacement for cat with syntax highlighting

    broot # directory navigator

    btop # resources monitor https://github.com/aristocratos/btop

    carapace # shell completion, works well on nushell

    # cargo  # rust package manager

    chafa # terminal image viewer

    chezmoi # manage user configurations (dotfiles) across machines

    delta # view git diff with colors

    difftastic # semantic diff

    direnv # directory environments

    eza # maintained replacement for ls

    fd # alternative to find

    fpp # pick file paths on the command line

    fzf # fuzzy finder

    # git  # git version control, already installed on Ubuntu

    gh # Gihub command line client

    # https://github.com/kamranahmedse/git-standup
    git-standup # keep track of git commits with git-standup -s

    gitui # modern git terminal ui in Rust

    glow # terminal markdown viewer

    go # go language

    graphviz # language for drawing graphs: executable dot, neato

    gron # make JSON greppable

    hadolint # Dockerfile linter

    hugo # static site generator

    hyperfine # command line benchmarking tool

    imagemagick # image view, modify tools

    jid # JSON utility

    jq # JSON utility

    kondo # clean up projects. Supports Cargo, Python, Jupyter and others

    lazydocker # terminal ui to manage Docker

    lazygit # alternative terminal ui for git

    lf # terminal file manager

    lnav # view/search log files

    lsd # next generation ls command - ls-deluxe

    markdownlint-cli # markdown linter

    ncdu # display disk usage

    # renamed to nixfmt
    # nixfmt-rfc-style  # nix official formatter
    nixfmt

    # neovim  # neovim editor causes nix to crash

    nnn # command line file manager

    # nodejs  # do not install as cannot install npm packages globally

    nushell # alternative shell

    ollama # install and run llms

    oxfmt # javascript and typescript formatter

    oxlint # javascript and typescript linter

    pandoc # convert documents into multiple formats

    pastel # colors in the terminal

    pet # command line snippet manager https://github.com/knqyf263/pet

    nodePackages.prettier # for html/css/javascript

    pueue # command line manager for parallel/long running task

    pv # monitor the progress of data through a pipeline

    rclone # rsync for the cloud (like S3)

    redis # key value store

    ripgrep # alternative to grep

    ripgrep-all # ripgrep search through docx, pdf, zip, tar.gz ...

    ruff # Python linter replaces pyflakes, isort, pydocstyle, ...

    rust-analyzer # semantic analysis of Rust code

    shellcheck # shell script static analysis tool

    sqlite # sqlite command line interface

    stylua # https://github.com/JohnnyMorganz/StyLua

    tig # terminal ui for git

    tmux # terminal multiplexer

    tlrc # rust client for tldr. e.g. tldr tar

    tokei # count lines of code

    tree # directories as a tree

    tree-sitter # parser for programming languages

    universal-ctags # ctags

    unzip # unzip files

    usql # command line sql client

    viddy # watch replacement with history

    vifm # text mode file manager

    vim # terminal vim - latest version

    watchexec # watch a path and run a command on changes (newer utility)

    # wuzz  # HTTP utilities

    wkhtmltopdf # pandoc -t html doc1.md --pdf-engine=wkhtmltopdf -o doc1.pdf

    yamlfmt # yaml formatter from google

    yazi # terminal file manager

    ytfzf # youtube fuzzy finder. e.g. ytfzf -IL langchain

    zed-editor # code editor

    zellij # tmux alternative

    zip # zip files

    zoxide # smarter cd command like z or autojump

    # investigate pagers, alternatives for less or more
    # https://github.com/walles/moor
    # https://github.com/noborus/ov

    # find files with a sql like syntax: https://github.com/jhspetersson/fselect
  ];

in
all
