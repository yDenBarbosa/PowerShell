# Define uma expressão para selecionar o nome do arquivo
$nameExpr = "Name"

# Define uma expressão para calcular e formatar o tamanho do arquivo em KB com duas casas decimais
$lengthExpr = { "{0:N2}KB" -f ($_.Length / 1KB) }

# Agrupa as expressões em um array para facilitar o uso no Select-Object
$params = $nameExpr, $lengthExpr

# Lista todos os arquivos de forma recursiva a partir do diretório atual
Get-ChildItem -Recurse -File |
    # Filtra apenas os arquivos cujo nome contenha "_migrando_"
    Where-Object Name -Like "*_migrando_*" |
    # Seleciona os campos definidos anteriormente: nome e tamanho formatado
    Select-Object $params