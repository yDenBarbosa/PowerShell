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

# Versão alternativa usando .Add() para construir os objetos passo a passo
# (Comentada, mas funcional caso queira usar essa abordagem)
# $nameExpr = @{}
# $nameExpr.Add("Label", "Nome")
# $nameExpr.Add("Expression", { $_.Name })

# $lengthExpr = @{}
# $lengthExpr.Add("Label", "Tamanho")
# $lengthExpr.Add("Expression", { "{0:N2}KB -f ($_.Length / 1KB)" })

# Agrupa as propriedades calculadas em um array para uso no Select-Object
$params = $nameExpr, $lengthExpr

# Lista todos os arquivos de forma recursiva
Get-ChildItem -Recurse -File |
    # Filtra os arquivos cujo nome contenha "_migrando_"
    Where-Object Name -Like "*_migrando_*" |
    # Seleciona as propriedades definidas anteriormente: Nome e Tamanho formatado
    Select-Object $params