# Terminal software

## Terminal

* alacritty - does not support ligatures and difficult to setup
* kitty - does not run on windows
* wezterm - runs on windows - TODO: try it

## File explorer

* vifm - 2.6k stars
* nnn - 18.2k stars
* yazi - 8k stars
* lf - 7.2k stars
* broot - 10.1k stars

### vifm file manager

#### View a list of files

1. View a list of python files in the left pane

```
fd -t f -g '*.py' | vifm - -c view!
```

2. Disable view in the right pane

```
:view
```

3. Change right pane directory to file in the left pane

```
:sync %c:h
```

### lf file explorer

1. Create a config file

touch ~/.config/lf/lfrc

2. Use lfrc example from https://github.com/gokcehan/lf/blob/master/etc/lfrc.example

#### Tips

F1 - help

To view the documentation type lf -doc

## Python command line

* click
* fire
* rich

## Terminal user interfaces

* textualize
