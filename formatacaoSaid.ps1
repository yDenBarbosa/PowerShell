# Lista todos os arquivos recursivamente
# Filtra os arquivos cujo nome contém '_migrando_'
# Exibe o nome e o tamanho formatado em KB com duas casas decimais
Get-ChildItem -Recurse -File | Where-Object Name -Like "*_migrando_*" | Select-Object Name, { "{0:N2}KB" -F ($_.Length / 1KB) }