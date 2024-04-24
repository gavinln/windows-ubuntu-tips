# Lazygit keys

## Git setup

To use nvim as a diff tool with git temporarily

```
git -c 'diff.tool=nvimdiff' difftool
```

To use nvim permanently edit config with `git config --local -e`

```
[diff]
    tool = nvimdiff
```
## Default keys

1 - Status
2 - Files / Worktrees / Submodules
3 - Local / Remotes / Tags
4 - Commits / Reflog
5 - Stash
+ - change screen mode normal/hall/full
] - next tab
[ - previous tab

## Status

e - edit config file
<enter> - switch to a recent repo

## Files

` - toggle file tree view
<space> - stage file
<c-b> - filter
e - edit file
c - commit
C - commit using git editor
<c-t> - open external diff tool
S - stash options ...

## Local

<space> - checkout
n - new branch
W - diff options ...
d - delete branch
w - worktree options ...
r - rebase

## Commits

<c-o> - copy commit SHA
W - diff options ...
R - reword comit in editor
s - squash commit
<c-s> - filter options ...

## Stash

<space> - apply
g - pop

## Patch / Diff / Unstaged / Staged

h - previous hunk
l - next hunk
<space> - stage / unstage
