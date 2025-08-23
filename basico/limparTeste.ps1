# caminho da pasta teste
$testePath = "C:\Users\denis\Desktop\teste\*"

# removendo arquivos temporarios
Remove-Item -Path $testePath -Recurse -Force

# exibindo uma mensagem de conclusao
Write-Host "Arquivos temporarios removidos com sucesso!"