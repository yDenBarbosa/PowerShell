param($tipoDeExportacao)

# Define que qualquer erro deve interromper a execução do script
$ErrorActionPreference = "Stop"

# Inicializa a variável que armazenará o resultado
$resultado

# Define uma propriedade calculada para o nome do arquivo
# "Label" define o nome da coluna que será exibida
# "Expression" define como obter o valor (neste caso, o nome do arquivo)
$nameExpr = @{
    Label = "Nome";
    Expression = { $_.Name }
}

# Define uma propriedade calculada para o tamanho do arquivo
# A expressão formata o tamanho em KB com duas casas decimais
$lengthExpr = @{
    Label = "Tamanho";
    Expression = { "{0:N2}KB -f ($_.Length / 1KB)" }
}

# Agrupa as propriedades calculadas em um array para uso no Select-Object
$params = $nameExpr, $lengthExpr

# Lista todos os arquivos de forma recursiva
# Filtra os arquivos cujo nome contenha "_migrando_"
# Seleciona as propriedades definidas anteriormente: Nome e Tamanho formatado
$resultado = 
    Get-ChildItem -Recurse -File |
        Where-Object Name -Like "*_migrando_*" |
        Select-Object $params

# Verifica o tipo de exportação solicitado
if ($tipoDeExportacao -eq "HTML") {
    # Lê o conteúdo do arquivo CSS para aplicar estilos à página HTML
    $estilos = Get-Content c:\scripts\style.css

    # Cria a tag <style> com os estilos lidos
    $styleTag = "<style> $estilos </style>"

    # Define o título da página HTML
    $tituloPagina = "Relatorio de Scripts em Migração"

    # Define o conteúdo do cabeçalho do corpo da página
    $tituloBoby = "<h1> $tituloPagina </h1>"

    # Converte os dados para HTML, aplica o estilo e salva em um arquivo
    $resultado | 
        ConvertTo-Html -Head $styleTag -Title $tituloPagina -Body $tituloBoby |
        Out-File c:\tempGui\relatorio.html

} elseif ($tipoDeExportacao -eq "JSON") {
    # Converte os dados para JSON e salva em um arquivo
    $resultado |
        ConvertTo-Json |
        Out-File c:\tempGui\relatorio.json

} elseif ($tipoDeExportacao -eq "CSV") {
    # Converte os dados para CSV e salva em um arquivo
    $resultado |
        ConvertTo-Csv -NoTypeInformation |
        Out-File c:\tempGui\relatorio.csv
}

# Exemplo de execução:
# .\convertEXEC.ps1 CSV

# Exemplo de leitura do arquivo gerado:
# Get-Content c:\tempGui\relatorio.csv