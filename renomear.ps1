
# Lista todos os aliases disponíveis no sistema PowerShell
Get-Alias

# Exibe o comando associado ao alias "dir" (geralmente Get-ChildItem)
Get-Alias -Name dir

# Lista todos os comandos disponíveis no PowerShell
Get-Command

# Busca comandos cujo nome contenha "rename"
Get-Command -Name *rename

# Busca comandos cujo verbo seja "rename"
Get-Command -Verb *rename

# Mostra a ajuda completa do comando Rename-Item
get-help -Name Rename-Item

# Atualiza os arquivos de ajuda do PowerShell para versão mais recente
Update-Help

# Simula a renomeação do arquivo "sha1.bat" para "sha1_migrando_denis.bat" sem alterar nada
Rename-Item sha1.bat sha1_migrando_denis.bat -WhatIf

# Lista todos os comandos que usam o substantivo "Alias"
Get-Command -Noun Alias

# Exibe ajuda sobre o comando New-Alias, que cria um novo apelido para um comando
Get-Help New-Alias

# Cria um alias chamado "rename" que representa o comando Rename-Item
New-Alias -name "rename" Rename-Item

# Verifica se o alias "rename" foi criado corretamente
Get-Alias -Name rename

# Renomeia de fato o arquivo "sha256.bat" para "sha256_migrando_denis.bat" usando o alias "rename"
rename sha256.bat sha256_migrando_denis.bat