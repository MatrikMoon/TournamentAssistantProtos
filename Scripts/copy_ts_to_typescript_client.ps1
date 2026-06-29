# Define source and destination directories
$sourceDir = ".\TS"
$destinationDir = "..\..\TournamentAssistantClient\src\models"

# Ensure the destination directory exists, create if it does not
if (-Not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir | Out-Null
}

# Copy all generated files from source to destination, preserving nested directories.
$sourceRoot = (Resolve-Path -Path $sourceDir).Path.TrimEnd([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
Get-ChildItem -Path $sourceDir -File -Recurse | ForEach-Object {
    $relativePath = $_.FullName.Substring($sourceRoot.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
    $targetPath = Join-Path $destinationDir $relativePath
    $targetDirectory = Split-Path -Path $targetPath -Parent

    if (-Not (Test-Path -Path $targetDirectory)) {
        New-Item -ItemType Directory -Path $targetDirectory | Out-Null
    }

    Copy-Item -Path $_.FullName -Destination $targetPath -Force
}

Write-Output "Files have been copied successfully."