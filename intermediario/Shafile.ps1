function Get-FileSHA1($filePath){
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed

    $hash = $sha1.ComputeHash($fileBytes)
    
    $prettyHashSB = New-Object System.Text.StringBuilder

    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        # $prettyHashSB.Append($hexaNotation) | Out-Null
        $prettyHashSB.Append($hexaNotation) > $null
    }

    $prettyHashSB.ToString()
}

# $arquivo = "C:\Users\denis\Desktop\PowerShell\intermediario\Shafile.ps1"
# $hashDoArquivo = Get-FileSHA1 $arquivo 
 
# Write-Host "O hash do arquivo $arquivo eh $hashDoArquivo" -BackgroundColor Red -ForegroundColor Yellow

function Get-FileSHA256 (){

}
function Get-FileSHA384 (){

}
function Get-FileSHA512 (){

}