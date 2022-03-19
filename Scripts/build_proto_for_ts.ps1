if (Test-Path 'TS') {
    Remove-Item 'TS' -Recurse
}
New-Item -Path 'TS' -ItemType Directory
protoc -I="../" "../*.proto" --ts_out="TS" --plugin=protoc-gen-ts=.\\node_modules\\.bin\\protoc-gen-ts.cmd --ts_opt=no_namespace