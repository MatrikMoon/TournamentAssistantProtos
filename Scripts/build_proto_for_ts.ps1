if (Test-Path 'TS') {
    Remove-Item 'TS' -Recurse
}
New-Item -Path 'TS' -ItemType Directory
protoc -I="../" "../*.proto" --js_out="import_style=commonjs,binary:TS" --ts_out="TS" --plugin=protoc-gen-ts=.\\node_modules\\.bin\\protoc-gen-ts.cmd