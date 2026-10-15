# Git tips

## Git commits for a single file

Walk through git commits affecting a single file.

### Use fugitive in nvim

1. Open commits for the file in the quickfix window

```
:0Gclog
```

2. View older commit

```
:cn
```

3. Continue previous step

### Use DiffviewFileHistory in nvim

1. Open the git diff view

```
:DiffviewFileHistory
```

2. In the diffview://panels compare adjacent commits
Type <tab> to compare adjacent changes

### Use lazygit

1. Open lazygit logs and filter by path

```
lazygit log -f <filename>
```

2. Switch to two panel layout
Press +/_ multiple times as need

3. Select diff options by pressing W and enter

4. Scroll up and down to compare selected commit with others

## Git file changes

### Use lazygit

1. Open lazygit

```
lazygit
```

2. Switch to commits view by typing 4

3. Press enter to select commit

4. Scroll to file

5. Press Ctrl-t to view in external diff tool - git difftool

### Use git

```
git log --since="1day" --name-only --oneline
```

## View Git untracked files

1. Using git

```
git ls-files -o
```

2. Using eza

```
eza --git -lT
```

3. Using broot

```
broot -g -i
```

## View Git ignored files

1. Using git

```
git ls-files -o -i --exclude-standard
```

2. Using git clean

```
git clean -n -x -d
```

## Setup Difftastic

1. Add this to `~/.gitconfig` file

```
[difftool "difftastic"]
    # See `man git-difftool` for a description of MERGED, LOCAL and REMOTE.
    cmd = difft --display side-by-side "$MERGED" "$LOCAL" "abcdef1" "100644" "$REMOTE" "abcdef2" "100644"
```

2. Also turn of the prompt by changing this in the `~/.gitconfig` file

```
[difftool]
    # Run the difftool immediately, don't ask 'are you sure' each time.
    prompt = false
```

3. Add this to `~/.gitconfig` to make using difft easier

```
[diff]
    external = difft
```

4. Use the inbuilt git diff

```
# git -c diff.external=difft diff
git diff
```

5. Use the external git difftool

```
git difftool -t difftastic
```
