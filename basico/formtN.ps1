# Define o valor correspondente a 1 Megabyte em bytes
1MB

# Define o valor correspondente a 1 Gigabyte em bytes
1GB

# Define o valor correspondente a 1 Terabyte em bytes
1TB

# Divide o valor 456465564321565 (em bytes) por 1GB, resultando em tamanho em GB
456465564321565 / 1GB

# Obtém o tipo do resultado da divisão anterior (normalmente será Double)
(456465564321565 / 1GB).GetType().Name

# Formata o resultado da divisão com 2 casas decimais (ex: 424937.56)
(456465564321565 / 1GB).ToString("N2")

# Mesma coisa, mas adiciona a unidade "GB" ao final
(456465564321565 / 1GB).ToString("N2") + "GB"

# Usa o operador de formatação -F para aplicar o formato "N2" diretamente no resultado
"N2" -F (456465564321565 / 1GB)  # Esta linha está incorreta. "N2" não funciona sozinho com -F.

# Correção da anterior: aqui sim é válido — formata com 2 casas decimais
"{0:N2}" -F (456465564321565 / 1GB)

# Exibe dois valores formatados: em GB e em MB
"{0:N2} = {1:N2}" -F (456465564321565 / 1GB), (456465564321565 / 1MB)

# Adiciona unidade nas strings formatadas: GB e MB
"{0:N2}GB = {1:N2}MB" -F (456465564321565 / 1GB), (456465564321565 / 1MB)