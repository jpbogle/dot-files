#!/bin/bash
ROOT="$(pwd)"

set -e

main () {
    "$ROOT/config-common.sh"

    if [[ $(uname -s) == "Darwin" ]]; then
        echo 'hello'
#        "$ROOT/config-osx.sh"
#       "$ROOT/config-git.sh"
    elif [[ $(uname -s) == "Linux" ]]; then
        "$ROOT/config-linux.sh"
    fi

}

main

echo All Done!
echo Restarting shell
