# Recent changes

These commands list recent changes on the operating system.

## Files and directories

Using ls

```
ls -lrt
```

Using eza

```
eza -s modified -l --time-style relative
```

Using nnn

```
nnn -T t -d
```

timestamps created/modified in the last 5 minutes are highlighted

Using vifm

```
vifm -c 'set sort=-mtime,dir' -c view!
```

## Recently visited directories

zoxide

```
zoxide query -i
```

## Git

git log --pretty=format:"%h%x09%as%x09%s" --date=short

```
%h = abbreviated commit hash
%x09 = tab (character for code 9)
%ad = author date
%s = subject
```
