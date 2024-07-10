# Rye usage

[Rye][100] is a project and package management solution for Python.

[100]: https://rye.astral.sh/

## Install rye

Rye is installed by nix. When running it for the first time it tries to install in `~/.rye`. Choose no.

## Use Rye with Python projects

### Create and setup project

1. Create a Python project called proj-test

```
rye init --virtual proj-test
```

2. Change to the project directory

```
cd proj-test
```

3. Show current state of the project

```
rye show
```

4. Show location of Python executable

```
which python3
```

5. Sync the project settings

```
rye sync
```

6. Activate the virtual environment

```
source .venv/bin/activate
```

7. Show location of Python executable

```
which python3
```

### Add package

1. Add the requests packages

```
rye add requests
```

2. List the installed packages

```
rye list
```

3. Create a get-page.py file with the following contents

```
import requests

response = requests.get("https://api.github.com")
print(response.status_code)
print(response.content)
```

4. Sync the project

```
rye sync
```

5. Run the code

```
python get-page.py
```

6. Check if code will be formatted

```
rye fmt --check
```

7. Format code

```
rye fmt
```

## Use Rye with Python libraries
