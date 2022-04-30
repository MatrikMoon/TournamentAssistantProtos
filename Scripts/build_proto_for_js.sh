#!/bin/bash
if [[ -d ./JS ]]; then
    rm -rf ./JS
fi
mkdir ./JS
protoc -I=../ ../*.proto --js_out="JS"