#!/usr/bin/env sh

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"

cd "$SCRIPT_DIR/../server"
./node_modules/.bin/sequelize db:migrate
