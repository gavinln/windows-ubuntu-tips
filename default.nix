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

    direnv  # directory environments
    
    exa  # replacement for ls
    
    bat  # replacement for cat with syntax highlighting
    
    pandoc  # convert documents into multiple formats
    
    ripgrep  # alternative to rep
    
    fd  # alternative to find
    
    fselect  # search for files using SQL like queries
    
    vifm  # text mode file manager
    
    tmux  # terminal multiplexer
    
    tmuxp  # manage tmux sessions
    
    fzf  # fuzzy finder
    
    tig  # terminal ui for git
    
    lazygit  # alternative terminal ui for git

    git  # git version control

    jq jid  # JSON utilities
    
    ncdu  # display disk usage
    
    xsv  # csv utilities: https://github.com/BurntSushi/xsv/releases/latest
    
    ctags  # tags in source files
    
    tldr  # brief documentation on usage
    
    wuzz  # HTTP utilities
    
    unzip  # unzip files
    
    tree  # directories as a tree
    
    minio minio-client  # S3 compatible server and client
  ];
in all