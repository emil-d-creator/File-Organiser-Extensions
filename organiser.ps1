    
    
    $extensions = Get-Content -Path ".\extensions.txt"
    
    
    # @('pdf', 'png', 'txt', 'jpg', 'zip', 'rar', 'exe', 'mp4', 'doc', 'docx', 'ppt', 'pptx', 'xlsx', 'odt', 'csv', 'html', 'htm', 'rtf', 'gif', 'bmp', 'tiff', 'webp', 'aac', 'flac',
    # 'wav', 'ogg', 'm4a', 'avi', 'mov', 'mkv', 'flv', 'webm', 'gz', '7z', 'tar', 'iso', 'bat',
    # 'sh', 'msi', 'dll', 'sys', 'yml', 'yaml', 'json', 'xml', 'sql', 'java', 'cpp', 'c', 'py',
    # 'php', 'css', 'js', 'svg', 'psd', 'ai', 'ttf', 'otf', 'db', 'mdb', 'accdb', 'sqlite', 'vmdk',
    # 'vhd', 'vhdx', 'bak', 'dmg', 'srt', 'sub', 'torrent', 'log', 'swf', 'chm', 'epub', 'mobi', 
    # 'azw3', 'epub', 'bkp', 'ps1')


New-Item -path .\Archive -ItemType Directory -Force
New-Item -path .\Files -ItemType Directory -Force
foreach ($ext in $extensions) {
    try{
    New-Item -Path ".\Archive\$ext" -ItemType Directory -Force
    }
    catch{
        Write-Host "'Check your extensions.txt file probably something is wrong with that file :)
        Here is your error  ': $_"
    }
}


$files = Get-ChildItem -File -Path ".\Files"


foreach ($file in $files) {
    try {
        
        $ext = $file.Extension.TrimStart('.')
        $Folder = ".\$ext"

        

        
        Move-Item -Path $file.FullName -Destination ".\Archive\$Folder"
    }
    catch {
        Write-Host "Problem with file '$($file.Name)': $_"
    }
}

    
