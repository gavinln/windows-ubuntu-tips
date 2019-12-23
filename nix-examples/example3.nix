# To install all the packages type:
# nix-env -f example3.nix -i

let
  pinnedPkgs = import (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixos-unstable-2018-09-12";
    # Commit hash for nixos-unstable as of 2018-09-12
    url = https://github.com/nixos/nixpkgs/archive/ca2ba44cab47767c8127d1c8633e2b581644eb8f.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "1jg7g6cfpw8qvma0y19kwyp549k1qyf11a5sg6hvn6awvmkny47v";
  }) {};
in with pinnedPkgs; [ ripgrep fzf ]
