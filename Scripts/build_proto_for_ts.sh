#!/bin/bash
if [[ ! -d ./node_modules ]]; then
    echo "Installing dependencies..." 
    npm i
fi
if [[ -d ./TS ]]; then
    rm -rf ./TS
fi
mkdir ./TS
npx protoc -I="../" "../*.proto" --ts_out="TS"