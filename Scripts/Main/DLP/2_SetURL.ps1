# Menu
Clear-Host
    Write-Host ""
Write-Host "    Cole a URL:"
    Write-Host ""
$read_URL = Read-Host "URL"

if ($read_URL -eq "") {
    do {
        Clear-Host
            Write-Host ""
        Write-Host "    Digite uma URL válida" -ForegroundColor Red
            Write-Host ""
        $read_URL = Read-Host "URL"
    } until (-not ($read_URL -eq ""))
}

        Write-Host ""
    Write-Host "    Processando link.."
        Write-Host ""

# Set-Location to 'Bin/'
Set-Location $BinPath

# Start 'yt-dlp.exe'
yt-dlp -U $read_URL --cookies cookies.txt

# Move-Items
Move-Item -Path "*" -Exclude $IgnoreFiles -Destination $currentLocal

# Set-Location to '..'
Set-Location $RootProject

# Finish
    Write-Host ""
Write-Host "    Digite qualquer tecla para reiniciar..."
    Write-Host ""
$null = [System.Console]::ReadKey($true)

. "$PSScriptRoot/2_SetURL.ps1"