# definindo o caminho da pasta de origem
$origem = "C:\Users\denis\Desktop\teste"

# defininfo o caminho da pasta de destino
$destino = "C:\Users\denis\Desktop\teste2"

# copiando arquivos da pasta de origem para a pasta de destino
Copy-Item -Path "$origem\*" -Destination $destino -Recurse

# exibindo uma mensagem de conclusao
Write-Host "Arquivos copiados de $origem para $destino com sucesso!"