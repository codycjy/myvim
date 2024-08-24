#!/bin/bash

# Create directories
mkdir -p tools && cd tools

# Clone the vscode-go repository
git clone https://github.com/golang/vscode-go
cd vscode-go/extension

# Install dependencies and compile
npm install
npm run compile
cd ../..

# Create directory for cpptools
mkdir -p cpptools && cd cpptools

# Get latest release info
latest_release=$(curl -s https://api.github.com/repos/microsoft/vscode-cpptools/releases/latest)

# Parse version number
version=$(echo $latest_release | jq -r .tag_name)

# Construct download URL
download_url="https://github.com/microsoft/vscode-cpptools/releases/download/${version}/cpptools-linux-x64.vsix"

# Download the file
curl -L -o cpptools-linux-x64.vsix $download_url

# Unzip the file
unzip cpptools-linux-x64.vsix -d cpptools
rm cpptools-linux-x64.vsix

# Set execute permissions
chmod +x cpptools/extension/debugAdapters/bin/OpenDebugAD7


echo "You need install delve manually"

mkdir ~/.virtualenvs -p
cd ~/.virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy


