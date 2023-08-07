$CursorName="timeline-small-black-ani"
Invoke-WebRequest -OutFile $env:USERPROFILE\Setup\$CursorName.zip http://www.rw-designer.com/cursor-downloadset.php?id=$CursorName
Expand-Archive  $env:USERPROFILE\Setup\$CursorName.zip -DestinationPath  C:\Windows\cursors\$CursorName
