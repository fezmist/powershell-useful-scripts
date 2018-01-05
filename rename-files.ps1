##get list
get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | select-object { $_.Name -replace 'old-filename', 'new-filename'}

get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | select-object {$_.DirectoryName + "\" + $_.Name -replace 'old-filename', 'new-filename'}

##rename files
get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | Rename-Item -NewName {$_.DirectoryName + "\" + $_.Name -replace 'old-filename', 'new-filename'}
