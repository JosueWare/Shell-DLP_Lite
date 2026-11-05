$isAdmin = ([Security.Principal.WindowsPrincipal] `
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (($PSVersionTable.PSEdition) -eq "Core") {
    if ($isAdmin) {
        . "$PSScriptRoot/Scripts/Main/Menu.ps1"
    }
    else {
        Write-Host "Execute no modo adminstrador" -ForegroundColor Red
        Write-Host ""
        Start-Sleep -Seconds 1
        Write-Host "Deseja executar? (s/n)"
        $questExecutePWSH = Read-Host
        switch ($questExecutePWSH) {
            "S" {. "$PSScriptRoot/Scripts/Config/Start.ps1"}
            Default {Write-Host ""}
        }
    }
}
else {
    Write-Host "Execute com o PowerShell Core" -ForegroundColor Red
    Write-Host ""
    Start-Sleep -Seconds 1
    Write-Host "Deseja executar? (s/n)"
    $questExecutePWSH = Read-Host
    switch ($questExecutePWSH) {
        "S" {
            if (Get-Command "pwsh.exe" -ErrorAction SilentlyContinue) {
                . "$PSScriptRoot/Scripts/Config/Start.ps1"
            }
            else {
                Write-Host "Comando 'pwsh.exe' nao foi encontrado" -ForegroundColor Red
            }
        }
        Default {Write-Host ""}
    }
}