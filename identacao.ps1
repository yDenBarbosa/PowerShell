$nameExpr = "Name"
$lengthExpr = { "{0:N2}KB -f ($_.Length / 1KB)"}
$params = $nameExpr, $lengthExpr

# Get-ChildItem -Recurse -File | 
#     Where-Object Name -Like "*_migrando_*" | 
#     Select-Object `
#         $nameExpr, $lengthExpr 

Get-ChildItem -Recurse -File | 
    Where-Object Name -Like "*_migrando_*" | 
    Select-Object $params
        