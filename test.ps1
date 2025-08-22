
$folderPath = "C:\Scripts\Files"


if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory
}

$filesToCreate = @(
    "plik1.txt",
    "plik2.jpg",
    "plik3.png",
    "plik4.mobi",
    "plik5.html",
    "plik6.pdf"
    
)

# Tworzymy pliki z przykładową zawartością
foreach ($file in $filesToCreate) {
    $filePath = $folderPath + "\" + $file
    "Example content $file" | Out-File -FilePath $filePath -Encoding UTF8
    Write-Host "File created: $filePath"
}