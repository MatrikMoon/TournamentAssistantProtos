if (Test-Path 'TS') {
    Remove-Item 'TS' -Recurse
}
if (-Not (Test-Path 'node_modules')) {
    npm i
}
New-Item -Path 'TS' -ItemType Directory
npx protoc -I="../" "../*.proto" --ts_out="TS"