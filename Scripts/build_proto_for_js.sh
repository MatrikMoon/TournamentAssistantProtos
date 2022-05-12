#!/bin/bash
if [[ ! -d ./node_modules ]]; then
    echo "Installing dependencies..." 
    npm i
fi
if [[ -d ./JS ]]; then
    rm -rf ./JS
fi
mkdir ./JS
protoc -I=../ ../*.proto --js_out="JS"