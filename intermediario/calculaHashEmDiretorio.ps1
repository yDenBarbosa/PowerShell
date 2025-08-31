param($diretorio)

$ErrorActionPreference = "Stop"

.\Shafile.ps1

$arquivos = Get-ChildItem $diretorio -File
#foreach ($item in $arquivos | Select-Object FullName) {
#foreach ($item in $arquivos | ForEach-Object { $_.FullName }) {
foreach ($item in $arquivos.FullName ) {
    $hashItem = Get-FileSHA1 $item
    Write-Host "O hash do aequivo $item é $hashItem"
}

# # Define um parâmetro chamado $diretorio, que será passado ao script
# param($diretorio)

# # Configura o tratamento de erros para parar a execução em caso de falha
# $ErrorActionPreference = "Stop"

# # Executa o script Shafile.ps1, que presumivelmente contém a função Get-FileSHA1
# .\Shafile.ps1

# # Obtém todos os arquivos (não diretórios) dentro do diretório especificado
# $arquivos = Get-ChildItem $diretorio -File

# # Itera sobre cada arquivo encontrado
# foreach ($item in $arquivos | Select-Object FullName) {
#     # Calcula o hash SHA1 do arquivo usando a função definida em Shafile.ps1
#     $hashItem = Get-FileSHA1 $item

#     # Exibe o caminho completo do arquivo e seu hash no console
#     Write-Host "O hash do aequivo $item é $hashItem"
# }