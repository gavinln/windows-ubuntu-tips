# Poetry

## Python version for poetry project

1. List the python version on the PATH

```
python3 -V
```

2. View all python3 versions on the PATH

```
which -a python3
```

3. List all pyenv Python versions

```
pyenv versions
```

4. Set a local python version

```
pyenv local 3.11
```

5. Get location of local python version

```
pyenv which python3
```

6. Create a new project

```
poetry new . --name api_logic_server-samples
```

7. Update the pyproject.toml file to the correct python version

8. Set the Python version of the project

```
poetry env use /home/gavin/.pyenv/versions/3.11.9/bin/python3
```

## poetry package mode

Poetry can be operated in two different modes. The default mode is the package
mode, which is the right mode if you want to package your project into an sdist
or a wheel. Further, the project itself will be installed in editable mode when
running poetry install.

If you want to use Poetry only for dependency management but not for packaging,
you can use the non-package mode in the `pyproject.toml` file.

```
[tool.poetry]
package-mode = false
```
