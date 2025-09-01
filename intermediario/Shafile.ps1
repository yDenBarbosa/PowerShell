function Get-FileSHA1 {

    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string] $filePath
    )

    begin {
        $sha1 = New-Object System.Security.Cryptography.SHA1Managed
        $prettyHashSB = New-Object System.Text.StringBuilder
    }

    process {
        $fileContent = Get-Content $filePath
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    
        $hash = $sha1.ComputeHash($fileBytes)
        
        foreach ($byte in $hash) {
            $hexaNotation = $byte.ToString("X2")
            # $prettyHashSB.Append($hexaNotation) | Out-Null
            $prettyHashSB.Append($hexaNotation) > $null
        }
    
        $prettyHashSB.ToString()
        $prettyHashSB.Clear() > $null
    }

    end {
        $sha1.Dispose()
    }

}

# function Get-FileSHA1($filePath){
#     # Lê o conteúdo do arquivo como texto (atenção: isso pode não funcionar corretamente com arquivos binários)
#     $fileContent = Get-Content $filePath

#     # Converte o conteúdo de texto para um array de bytes usando codificação UTF8
#     $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

#     # Cria uma instância do algoritmo SHA1
#     $sha1 = New-Object System.Security.Cryptography.SHA1Managed

#     # Calcula o hash SHA1 dos bytes do arquivo
#     $hash = $sha1.ComputeHash($fileBytes)
    
#     # Cria um StringBuilder para montar a string hexadecimal do hash
#     $prettyHashSB = New-Object System.Text.StringBuilder

#     # Itera sobre cada byte do hash
#     foreach ($byte in $hash) {
#         # Converte o byte para uma string hexadecimal com dois dígitos
#         $hexaNotation = $byte.ToString("X2")

#         # Adiciona a string hexadecimal ao StringBuilder
#         # A linha abaixo está comentada, mas usa Out-Null para suprimir saída
#         # $prettyHashSB.Append($hexaNotation) | Out-Null

#         # Esta linha ativa usa redirecionamento para $null, que também suprime saída
#         $prettyHashSB.Append($hexaNotation) > $null
#     }

#     # Retorna o hash como uma string hexadecimal
#     $prettyHashSB.ToString()
# }

# $arquivo = "C:\Users\denis\Desktop\PowerShell\intermediario\Shafile.ps1"
# $hashDoArquivo = Get-FileSHA1 $arquivo 
 
# Write-Host "O hash do arquivo $arquivo eh $hashDoArquivo" -BackgroundColor Red -ForegroundColor Yellow

function Get-FileSHA256 () {

}
function Get-FileSHA384 () {

}
function Get-FileSHA512 () {

}