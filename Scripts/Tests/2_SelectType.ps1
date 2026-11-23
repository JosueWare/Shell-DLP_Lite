Clear-Host
    Write-Host ""
Write-Host "    Selecione o tipo de arquivo"
    Write-Host ""
Write-Host @("
    1. [ mp3 ]
    2. [ mp4 ]
    ")
$questSelectType = Read-Host
switch ($questSelectType) {
    "1" {$Type = "mp3"}
    "2" {$Type = "mp4"}
    Default {
        Clear-Host
        Write-Host @("
            Resposta inválida
        ") -ForegroundColor Red
        Start-Sleep -Seconds 1
        . "$PSScriptRoot/2_SelectType.ps1"
    }
}