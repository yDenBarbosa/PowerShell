# Lista os itens (arquivos e diretórios) no diretório atual
Get-ChildItem

# Lista todos os itens (arquivos e diretórios) recursivamente em subdiretórios
Get-ChildItem -Recurse

# Obtém todos os itens recursivamente (arquivos e diretórios)
$todosOsItem = Get-ChildItem -Recurse

# Tenta acessar o tamanho de todos os itens, mas nem todos têm a propriedade Length (apenas arquivos possuem)
$todosOsItem.Length

# Obtém apenas os arquivos recursivamente
$todosOsItem = Get-ChildItem -Recurse -File

# Acessa o tamanho total em bytes dos arquivos
$todosOsItem.Length

# De todos os scripts nos queremos
# SELECIONAR o nome dos Scripts
# ONDE cada um destes scripts possui um nome PARECIDO com *_migrando_*
# Correção: "Selecionar arquivos cujo nome contenha '_migrando_'"

# Lista todos os arquivos e seleciona apenas a propriedade Name
Get-ChildItem -Recurse -File | Select-Object Name

# Filtra os arquivos cujo nome contém '_migrando_', mas o filtro está sendo aplicado após o Select-Object
# Correção: menos eficiente, pois o objeto já foi reduzido antes do filtro
Get-ChildItem -Recurse -File | Select-Object Name | Where-Object {$_ -like "*_migrando_*"}

# Filtra arquivos pelo nome contendo '_migrando_' e exibe nome e tamanho
# Forma mais eficiente: o filtro é aplicado antes da seleção das propriedades
Get-ChildItem -Recurse -File | Where-Object Name -Like "*_migrando_*" | Select-Object Name, Length