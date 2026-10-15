# Nix setup

## Flakes

To enable flakes modify the file `~/.config/nix/nix.conf` and add the line.

```
experimental-features = nix-command flakes
```

https://woile.dev/posts/nix-journey-part-1-creating-a-flake/

https://mhwombat.codeberg.page/nix-book/

## Templates

View available templates

```
nix flake show templates
```

## nix python

https://toraritte.github.io/poetry-intro/

nix-shell -p python312 poetry

https://devenv.sh/

https://github.com/jetify-com/devbox
