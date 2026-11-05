# ENV
$MainScript = Resolve-Path "Scripts/Main/Menu.ps1"

Start-Process -FilePath "pwsh.exe" -ArgumentList "-NoProfile", "-NoExit", "-Command . $MainScript" -Verb RunAs