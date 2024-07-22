$filename = Read-Host "Please enter the name of the file name with the extension"
$OpenFiles = Get-SmbOpenFile | Where-Object -Property ShareRelativePath -Like "*$filename"

Foreach ($file in $OpenFiles) {

  Write-Host ""
  Write-Host $file.Path "is locked by" $file.ClientUserName
  
  Close-SmbOpenFile -FileId $file.FileId

}
