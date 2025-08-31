param($diretorio)

$ErrorActionPreference = "Stop"

.\Shafile.ps1

$arquivos = Get-ChildItem $diretorio -File
foreach ($item in $arquivos | Select-Object FullName) {
    $hashItem = Get-FileSHA1 $item
    Write-Host "O hash do aequivo $item é $hashItem"
}