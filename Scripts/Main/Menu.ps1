# Path's
$MainScript = Resolve-Path "Scripts/Main/Menu.ps1"
$RootProject = Resolve-Path "$PSScriptRoot/../.."
$BinPath = Resolve-Path "Bin"

# Scripts Blocks
$RestartScript = {
    . $MainScript
}

[scriptblock]$PressAnyKey = {
    $null = [System.Console]::ReadKey($true)
}

# Set-Location
Set-Location $RootProject

# ENV
$MyVideos = Join-Path -Path ([System.Environment]::GetFolderPath('MyVideos')) -ChildPath "Shell-DLP"

# Check Depedences
if (
    -not (Test-Path -Path "Bin/yt-dlp.exe") -or
    -not (Test-Path -Path "Bin/ffmpeg.exe") -or
    -not (Test-Path -Path "Bin/ffplay.exe") -or
    -not (Test-Path -Path "Bin/cookies.txt")
) {
    . "Scripts/Main/Errors/MissingFiles.ps1"
    exit
}

# Ignore files
$IgnoreFiles = @(
    "yt-dlp.exe", "ffmpeg.exe",
    "ffplay.exe", "ffprobe.exe",
    "README.txt", "yt-dlp.exe.old",
    "cookies.txt", "*.rar", "*.zip", "*.tar.gz"
)

# Startup scripts
. "Scripts/Config/DefaultFolders.ps1"
. "Scripts/Config/SetToPATH.ps1"

# Menu
Clear-Host
    Write-Host ""
Write-Host "                    Shell-DLP (Lite)"
    Write-Host ""

    Start-Sleep -Seconds 1

    Write-Host ""
Write-Host "    Pressione qualquer tecla para prosseguir..."
    Write-Host ""
. $PressAnyKey

# Next script
. "Scripts/Main/DLP/1_SetLocal.ps1"