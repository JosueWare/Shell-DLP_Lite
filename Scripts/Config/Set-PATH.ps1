if (($env:PATH -split ";") -notcontains $BinPath) {
    $env:PATH += ";${BinPath}"
}