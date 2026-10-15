# Github actions

[GitHub Actions][100] is an automation tool integrated within GitHub that enables automation of software workflows directly in your repository.

[100]: https://docs.github.com/en/actions

## Create an action

1. Create a yaml file in the .github/workflows directory of your repository

2. In the yaml file (any name can be used) define the actions as in the example below

```yaml
name: Example Workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - name: Run a one-line script
      run: echo Hello, world!
    - name: Run a multi-line script
      run: |
        echo Add other commands you need
        echo This is a multi-line script
```

## Starter workflows

The starter workflows are in the repository:

https://github.com/actions/starter-workflows

Run the commands below in the repository to find python workflow files.

```
# run one of the two commands
rg --type yaml --files | rg python
find . \( -name '*python*.yaml' -or -name '*python*.yml' \)
```

## Github command line - gh

To view the action run use the gh command line utility.

1. Help on action workflow runs

```
gh help run
```

2. List workflow runs

```
gh run list
```

3. View run summary

```
gh run view RUN_ID
```

4. View run detail

```
gh run view -v RUN_ID
```

5. View jobs associated with the run

```
gh run view RUN_ID --json jobs --jq .jobs[].databaseId
```

6. To view a job

```
gh run view --job JOB_ID
```

7. To view the full log of a job

```
gh run view --job JOB_ID --log
```
