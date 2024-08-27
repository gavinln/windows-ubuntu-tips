# nushell

[nushell][100] is a new type of shell similar to bash, zsh or fish.

[100]: https://github.com/nushell/nushell

Nu draws inspiration from projects like PowerShell, functional programming
languages, and modern CLI tools. Rather than thinking of files and data as raw
streams of text, Nu looks at each input as something with structure. For
example, when you list the contents of a directory what you get back is a table
of rows, where each row represents an item in that directory. These values can
be piped through a series of steps, in a series of commands called a
'pipeline'.

This [blog post][110] explains why Nushell was built.

[110]: https://www.sophiajt.com/case-for-nushell/

## Quick tour

List files, sort by size, filter and reverse

```
ls | sort-by size | where size > 1kb | reverse
```

List processes where cpu usage is greater than 5

```
ps | where cpu > 5
```

Display help on the each command

```
help commands | where name == each | first
```

Get the parameter names for the each command

```
help commands | where name == each | first | get params.name
```

Alternate commands to do the same

```
help commands | where name == each | get 0.params.name
```

## Nushell features

1. Variables are immutable by default
2. Nushell's environment is scoped

## Cheat sheet

The [cheat sheet][200] has a short overview of the commands.

[200]: https://www.nushell.sh/book/cheat_sheet.html

Convert date to a different time zone

```
date now | date to-timezone "Europe/London"
```

Update a record by inserting a value if none provided

```
{"name":"nu", "stars":5, "language":Python} | upsert language Rust
```

Convert a list to yaml

```
[one two three] | to yaml
```

Create a table of data

```
[[framework, language]; [Django, Python] [Laravel, PHP]]
```

Select two columns from a table

```
[{name: 'Robert' age: 34 position: 'Designer'}
{name: 'Margaret' age: 30 position: 'Software Developer'}
{name: 'Natalie' age: 50 position: 'Accountant'}] | select name position
```

### Strings

Interpolate text

```
let name = "Alice"
$"greetings, ($name)!"
```

Split text on a delimiter

```
let string_list = "one,two,three" | split row ","
$string_list
```

Check if a string contains a substring

```
"Hello, world!" | str contains "o, w"
```

Join multiple strings

```
let str_list = [zero one two]
$str_list | str join ","
```

Slice text by indices

```
'Hello World!' | str substring 4..8
```

Parse string into columns

```
'Nushell 0.80' | parse '{shell} {version}'
```

parse comma separated values

```
"acronym,long\nAPL,A Programming Language" | from csv
```

### Lists

Insert value at index

```
[foo bar baz] | insert 1 'beeze'
```

Update value at index

```
[1 2 3 4] | update 1 10
```

Prepend value

```
[1 2 3] | prepend 0
```

Append value

```
[1 2 3] | append 3
```

Slice first two values

```
[cammomile marigold rose forget-me-not] | first 2
```

Iterate over a list

```
let planets = [Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune]
$planets | each { |it| $"($it) is a planet" }
```

Iterate over a list with index and value

```
$planets | enumerate | each { |it| $"($it.index + 1) - ($it.item)" }
```

Reduce the list to a single value

```
let scores = [3 8 4]
$"total = ($scores | reduce { |it, acc| $acc + $it })"
```

Reduce with an initial value

```
$"total = ($scores | reduce --fold 1 { |it, acc| $acc * $it })"
```

Access the third element

```
$planets.2
```

Check whether any elements starts with 'E'

```
$planets | any { |it| $it | str starts-with 'E' }
```

Slice items that satisty the condition

```
let cond = { |it| $it < 0 }; [-1 -2 9 1] | take while $cond
```

### Tables

Concatenate two tables

```
let $a = [[first_col second_col third_col]; [foo bar snooze]]
let $b = [[first_col second_col third_col]; [hex seeze feeze]]
$a | append $b
```

Remove the last column

```
let tsp = [[team score plays]; ['Boston Celtics' 11 3] ['Golden State', 24 2]]
$tsp | drop column
```

### Files

Recursively search for files

```
glob **/*.{rs,md} --depth 2
```

Run a command whenever a file changes

```
watch . --glob=**/*.rs {|| cargo test }
```

### Custom commands

Custom command with a string parameter

```
def greet [name: string] {
    $"hello ($name)"
}
```

Custom command with a default parameter

```
def greet [name = "nushell"] {
    $"hello ($name)"
}
```

Custom command with a flag

```
def greet [
    name: string
    --age: int
] {
    [$name $age]
}
```

Custom command with a shorthand flag

```
def greet [
    name: string
    --age (-a): int
    --twice
] {
    if $twice {
        [$name $age $name $age]
    } else {
        [$name $age]
    }
}
```

### Variables

Immutable variable cannot be changed

```
let val = 42
print $val
```

Mutable values cannot be accessed from closures

```
mut val = 10
$val += 12
```

Use the question mark operator to return null instead of an error

```
let files = (ls)
$files.name3?.0?
```
