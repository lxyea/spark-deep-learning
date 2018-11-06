#!/bin/bash

set -euxo pipefail

dev/run.py env-setup -d -c > ./python/.setup.sh && source ./python/.setup.sh

cd ./python
sphinx-apidoc -f -o docs sparkdl

cd ../docs
SKIP_SCALADOC=1 PRODUCTION=1 jekyll build
