#!/bin/bash

echo -e "Run this script in a virtual environment to avoid conflicts with system packages\n"

log() {
    echo -e "\e[32mINFO: $1\e[0m"
}

error() {
    echo -e "\e[31mERROR: $1\e[0m"
}

git --version &>/dev/null
if [ $? -ne 0 ]; then
    error "Git is not installed. Please install git and re-run setup"
    exit 1
else
    log "Git is installed"
fi

python --version &>/dev/null
if [ $? -ne 0 ]; then
    error "Python is not installed. Please install python and re-run setup"
    exit 1
else
    log "Python is installed"
fi

pip --version &>/dev/null
if [ $? -ne 0 ]; then
    error "Pip is not installed. Please install pip and re-run setup"
    exit 1
else
    log "Pip is installed"
fi

if [ ! -d "gwkokab" ]; then
    log "Cloning GWKokab"
    git clone https://github.com/gwkokab/gwkokab.git --depth 1 --quiet --branch main
else
    log "GWKokab already cloned"
fi

if [ ! -d "asset-store" ]; then
    log "Cloning Asset Store"
    git clone https://github.com/gwkokab/asset-store.git --depth 1 --quiet --branch main
else
    log "Asset Store already cloned"
fi

log "Installing uv"
pip install --upgrade --quiet pip
pip install --upgrade --quiet uv

log "Creating virtual environment"
uv venv --python=python3.11 --quiet
source .venv/bin/activate

log "Installing dependencies"
cd gwkokab && uv pip install --upgrade ".[cuda12]"

log "Setup completed"
