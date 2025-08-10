$nameExpr = @{
    Label = "Nome";
    Expression = { $_.Name }
}

$lengthExpr = @{
    Label = "Tamanho";
    Expression = { "{0:N2}KB -f ($_.Length / 1KB)" }
}

# $nameExpr = @{}
# $nameExpr.Add("Label", "Nome")
# $nameExpr.Add("Expression", { $_.Name })

# $lengthExpr = @{}
# $lengthExpr.Add("Label", "Tamanho")
# $lengthExpr.Add("Expression", { "{0:N2}KB -f ($_.Length / 1KB)" })

$params = $nameExpr, $lengthExpr


Get-ChildItem -Recurse -File | 
    Where-Object Name -Like "*_migrando_*" | 
    Select-Object $params
        