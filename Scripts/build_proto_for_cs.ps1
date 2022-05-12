if (Test-Path 'CS') {
    Remove-Item 'CS' -Recurse
}
New-Item -Path 'CS' -ItemType Directory 
protoc -I="../" "../*.proto" --csharp_out="CS"