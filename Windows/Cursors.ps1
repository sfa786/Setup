$FontName1="timeline-black-red"
Invoke-WebRequest -OutFile $env:USERPROFILE\Setup\$FontName1.zip http://www.rw-designer.com/cursor-downloadset.php?id=$FontName1
Expand-Archive  $env:USERPROFILE\Setup\$FontName1.zip -DestinationPath  %SystemRoot%\$FontName1


$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)

$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)

$RegCursors.SetValue(“”,”$FontName1”)

$RegCursors.SetValue(“AppStarting”,”%SystemRoot%\cursors\$FontName1\Working in background.ani”)


$RegCursors.Close()

$RegConnect.Close()