# To install all the packages type:
# nix-env -f example1.nix -i

let
  pkgs = import <nixpkgs> {};
in [ pkgs.ripgrep pkgs.fzf ]
