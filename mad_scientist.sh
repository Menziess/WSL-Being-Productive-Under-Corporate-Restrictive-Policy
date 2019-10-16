#!/bin/bash
#
# Usage: curl https://pyenv.run | bash
#
# For more info, visit: https://raw.githubusercontent.com/pyenv/pyenv-installer
#
set -e

echo "> Prechecks"
if [[ -z "$http_proxy" ]]; then
    echo "Please export http_proxy variable in your ~/.bashrc" 1>&2
    exit 1
fi
if ! which git &>/dev/null; then 
    echo "Please install git"
    exit 1
fi

echo "> Setting some ~/.bashrc commands"
cat >>~/.bashrc <<EOL
export FTP_PROXY=\$http_proxy
export DNS_PROXY=\$http_proxy
export RSYNC_PROXY=\$http_proxy
export ALL_PROXY=\$http_proxy
export NO_PROXY="localhost"

# Pipenv
export PIPENV_VENV_IN_PROJECT=1

# Pyenv
export PATH="/home/$USER/.pyenv/bin:$PATH"

# For git only
git config --global http.proxyAuthMethod 'basic'
EOL

echo "> Installing pyenv"
source ~/.bashrc
curl -s -S -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
