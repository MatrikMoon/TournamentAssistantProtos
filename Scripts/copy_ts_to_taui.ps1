# Define source and destination directories
$sourceDir = ".\TS"
$destinationDir = "..\..\TournamentAssistantTypescriptClient\src\models"

# Ensure the destination directory exists, create if it does not
if (-Not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir | Out-Null
}

# Copy all files from source to destination, overwriting existing files
Get-ChildItem -Path $sourceDir -File | Copy-Item -Destination $destinationDir -Force

Write-Output "Files have been copied successfully."
