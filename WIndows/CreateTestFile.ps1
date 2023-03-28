$file = [System.IO.File]::Create("C:\users\$env:username\Desktop\test.txt") #input path here
$file.SetLength([double]500MB) #Change file size here (MB is MegaBytes)
$file.Close()