# Arrays
[string[]]$MissingFiles = @()
[string[]]$ImportantFiles = @(
    "yt-dlp.exe", "ffmpeg.exe",
    "ffplay.exe", "ffprobe.exe",
    "cookies.txt"
)

# [scriptblock] Check and add to array list
[scriptblock]$CheckAndAddToArrayList = {
    $MissingFiles = @() <# Reset #>
    if (-not (Test-Path -Path "$BinPath/yt-dlp.exe")) {
        $MissingFiles += "[ yt-dlp.exe ]"
    }
    if (-not (Test-Path -Path "$BinPath/ffmpeg.exe")) {
        $MissingFiles += "[ ffmpeg.exe ]"
    }
    if (-not (Test-Path -Path "$BinPath/ffplay.exe")) {
        $MissingFiles += "[ ffplay.exe ]"
    }
    if (-not (Test-Path -Path "$BinPath/ffprobe.exe")) {
        $MissingFiles += "[ ffprobe.exe ]"
    }
    if (-not (Test-Path -Path "$BinPath/cookies.txt")) {
        $MissingFiles += "[ cookies.txt ]"
    }
}

. $CheckAndAddToArrayList
# GUI
Clear-Host
    Write-Host ""
Write-Host "    Arquivos ausentes" -ForegroundColor Yellow
    Write-Host ""
    Start-Sleep -Seconds 1
    Write-Host ""
Write-Host "        ${MissingFiles}" -ForegroundColor Magenta
    Write-Host ""
. $PressAnyKey
(Get-Process -Id $PID).CloseMainWindow()