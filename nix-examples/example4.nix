# To install all the packages type:
# nix-env -f example4.nix -i

let
  pinnedPkgs = import (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixos-2019-10-09";
    url = https://github.com/NixOS/nixpkgs/archive/17.09.tar.gz;
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "0kpx4h9p1lhjbn1gsil111swa62hmjs9g93xmsavfiki910s73sh";
  }) {};
in with pinnedPkgs; [ ripgrep fzf ]
