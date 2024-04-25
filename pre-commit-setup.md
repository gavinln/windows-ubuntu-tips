# pre-commit

To setup pre-commit

1. Check pre-commit version

```
pre-commit --version
```

2. Create a `.pre-commit-config.yaml` file in the project root

```
pre-commit sample-config > .pre-commit-config.yaml
```

3. Install the git hook script

```
pre-commit install
```

4. Run against all files

```
pre-commit run --all-files
```

5. Install appropriate hooks from https://pre-commit.com/hooks.html

## Python hooks

### black

See https://github.com/psf/black repository

See the `black/docs/integrations/source_version_control.md` file

Also add the following to the pyproject.toml file

```
[tool.black]
line-length = 79
```

## Markdown hooks

## json hooks

## yaml hooks
