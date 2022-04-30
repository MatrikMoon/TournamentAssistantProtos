#!/bin/bash
if [[ ! -d ./node_modules ]]; then
    echo "Installing dependencies..." 
    npm i
fi
if [[ -d ./TS ]]; then
    rm -rf ./TS
fi
mkdir ./TS
protoc -I=../ ../*.proto --ts_out="TS" --plugin=protoc-gen-ts=./node_modules/.bin/protoc-gen-ts --ts_opt=no_namespace