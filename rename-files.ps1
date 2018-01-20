##get list
get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | select-object { $_.Name -replace 'old-filename', 'new-filename'}

get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | select-object {$_.DirectoryName + "\" + $_.Name -replace 'old-filename', 'new-filename'}

##rename files
get-childitem | Where-Object {$_.Name -like 'old-filename.part*'} | Rename-Item -NewName {$_.DirectoryName + "\" + $_.Name -replace 'old-filename', 'new-filename'}

##rename command2
Get-ChildItem | Rename-Item -NewName {$_.DirectoryName +"\" + $_.Name.Replace("learning-d3-","")}

##Rename files in bulk with number sequence
##cd "C:\users\faiz\Pictures\My Screen Shots\aws-sa-a-exam3"
$count = 0
Get-ChildItem | Where-Object { $_.Extension -eq ".PNG"} | Sort-Object -Property LastWriteTime -Descending |
ForEach-Object { 
    $count++
    $oldName = $_.Name
    $newName = "Q" + $count + ".PNG"
    $_ | Rename-Item -NewName { $_.DirectoryName + "\" + $_.Name.Replace($oldName, $newName) }
    }
