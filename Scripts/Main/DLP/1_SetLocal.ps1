# Paths [Downloads]
$pathDownloads = Resolve-Path "Downloads"

# Script Block
[scriptblock]$CheckOption_2 = {
    if (Test-Path -Path $MyVideos) {
    $currentLocal = $MyVideos
    }
    else {
        Clear-Host
            Write-Host ""
        Write-Host "    Não foi possível encontrar a pasta 'Videos' do usuário" -ForegroundColor Red
            Write-Host ""
            Start-Sleep -Seconds 1
        Write-Host "    Por precaução o local de download foi definido em" -ForegroundColor Yellow
        Write-Host "        " -NoNewline
        Write-Host $pathDownloads
            Write-Host ""

        $currentLocal = $pathDownloads

            Start-Sleep -Seconds 1
        
            Write-Host ""
        Write-Host "    Pressione qualquer tecla para prosseguir..."
            Write-Host ""
        . $PressAnyKey

        # Next script
        . "Scripts/Main/DLP/3_SetURL.ps1"
    }
}

# GUI
Clear-Host
    Write-Host ""
Write-Host "    Selecione o local dos items baixados"
    Write-Host ""
    Start-Sleep -Milliseconds 500
Write-Host "        [1] Pasta 'Downloads' do projeto"
Write-Host "        [2] Pasta 'Vídeos' do usuário"
    Write-Host ""
$questSelectLocal = Read-Host
switch ($questSelectLocal) {

    "1" {
        $currentLocal = $pathDownloads
    }
    "2" {. $CheckOption_2}

    Default {
        do {
            Clear-Host
                Write-Host ""
            Write-Host "    Por favor, Selecione umas das alternativas" -ForegroundColor Red
                Write-Host ""
            Write-Host "        [1] Pasta 'Downloads' do projeto" -ForegroundColor Yellow
            Write-Host "        [2] Pasta 'Vídeos' do usuário" -ForegroundColor Yellow
                Write-Host ""
            $questSelectLocal = Read-Host
            switch ($questSelectLocal) {
                "1" {$currentLocal = $pathDownloads}
                "2" {. $CheckOption_2}
            }
        } until ($questSelectLocal -eq "1" -or $questSelectLocal -eq "2")
    }
}

# Check the current path [GUI]
Clear-Host
    Write-Host ""
Write-Host "    O local está correto?"
    Write-Host ""
    Start-Sleep -Milliseconds 500
Write-Host "  > " -NoNewline
Write-Host $currentLocal -ForegroundColor Cyan
    Write-Host ""
Write-Host "        [S] Sim / [N] Não"
    Write-Host ""
$questTheLocal_IS_Corret = Read-Host
switch ($questTheLocal_IS_Corret) {
    "S" {. "Scripts/Main/DLP/3_SetURL.ps1"}
    "N" {. "$PSScriptRoot/1_SetLocal.ps1"}
    Default {
        # Restart
        Clear-Host
            Write-Host ""
        Write-Host "    Resposta inválida" -ForegroundColor Red
            Write-Host ""

            Start-Sleep -Seconds 1

        . "$PSScriptRoot/1_SetLocal.ps1"
    }
}