# To install all the packages type:
# nix-env -f example2.nix -i

let
  pkgs = let
    hostPkgs = import <nixpkgs> {};
    pinnedPkgs = hostPkgs.fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs-channels";
      # nixos-unstable as of 2017-11-13T08:53:10-00:00
      rev = "ac355040656de04f59406ba2380a96f4124ebdad";
      sha256 = "0frhc7mnx88sird6ipp6578k5badibsl0jfa22ab9w6qrb88j825";
    };
  in import pinnedPkgs {};
in [ pkgs.ripgrep pkgs.fzf ]
