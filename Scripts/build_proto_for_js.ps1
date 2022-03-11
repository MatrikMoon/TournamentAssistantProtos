if (Test-Path 'JS') {
    Remove-Item 'JS' -Recurse
}
New-Item -Path 'JS' -ItemType Directory 
protoc -I="../" "../*.proto" --js_out="JS"