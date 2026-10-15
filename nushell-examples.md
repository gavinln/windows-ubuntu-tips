# Nushell examples

## Get number of files by extension in all sub-directories recursively

```
ls -a -f **/* | select name | path parse -c [name] | get name | get extension |group-by
```
