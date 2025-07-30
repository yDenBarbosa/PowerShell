# Exibe o conteúdo da variável de ambiente Path, que contém os diretórios onde o sistema procura executáveis
$env:Path

# Exibe o tipo de dado da variável Path (geralmente System.String)
$env:Path.GetType()

# Divide o conteúdo da variável Path em partes usando o ponto e vírgula como separador (cada diretório vira um item)
$env:Path.Split(';')

# Lista todos os membros (métodos, propriedades) disponíveis para o conteúdo da variável Path
$env:Path | Get-Member