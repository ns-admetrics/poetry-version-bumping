#!/usr/bin/env bash

pkg=poetry_version_bumping
python_version="3.9"

set -xe

poetry -V

poetry env use python${python_version}
poetry install
poetry version minor
poetry install
installed_versions=$(ls -d $(poetry env info -p)/lib/python${python_version}/site-packages/${pkg}*.dist-info | wc -l)
# This is unexpected!
test 2 -eq ${installed_versions}

poetry version 0.1.0
poetry install
downgraded_version=$(poetry run python -c'import poetry_version_bumping as pvb; print(pvb.__version__)')
# This is unexpected!
test "0.2.0" == "${downgraded_version}"
