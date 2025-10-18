Get-ChildItem *.tar.gz | ForEach-Object {
    $filename = $_.BaseName  # Gets the file name without extension
    $targetPath = Join-Path -Path $PWD -ChildPath $filename
    New-Item -ItemType Directory -Path $targetPath -Force
    tar -xvzf $_.FullName -C $targetPath
}

