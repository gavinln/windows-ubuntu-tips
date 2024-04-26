# Makefile to shell script

To convert a Makefile used as a task runner to a shell script view the `run` shell script in the root of this repository.

https://github.com/nickjj/docker-flask-example

## Example run.sh script

The bash script below is an example of a task runner

```bash
#!/usr/bin/env bash

set -o errexit
set -o pipefail

# -----------------------------------------------------------------------------
# Helper functions start with _ and aren't listed in this script's help menu.
# -----------------------------------------------------------------------------

function _poetry_run {
  poetry run "${@}"
}

# -----------------------------------------------------------------------------

function py:lint {
  # Lint Python code
  _poetry_run flake8 "${@}"
}

function py:format {
  # Format Python code
  _poetry_run black . "${@}"
}

function py:test {
  # Test Python code
  _poetry_run pytest "${@}"
}

function help {
  printf "%s <task> [args]\n\nTasks:\n" "${0}"

  compgen -A function | grep -v "^_" | cat -n

  printf "\nExtended help:\n  Each task has comments for general usage\n"
}

TIMEFORMAT=$'\nTask completed in %3lR'
time "${@:-help}"
```
