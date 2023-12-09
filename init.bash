#!/bin/bash
mkdir -p tools && cd tools
git clone https://github.com/golang/vscode-go
cd vscode-go
npm install
npm run compile


echo "You need install delve manually"

mkdir ~/.virtualenvs
cd ~/.virtualenvs
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
