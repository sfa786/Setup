$FontName1="timeline-black-red"
Invoke-WebRequest -OutFile $env:USERPROFILE\Setup\$FontName1.zip http://www.rw-designer.com/cursor-downloadset.php?id=$FontName1
Expand-Archive  $env:USERPROFILE\Setup\$FontName1.zip -DestinationPath  C:\Windows\Cursors\$FontName1





RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)

$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)

$RegCursors.SetValue(“”,”Windows Black”)

$RegCursors.SetValue(“AppStarting”,”%SystemRoot%\cursors\wait_r.cur”)

$RegCursors.SetValue(“Arrow”,”%SystemRoot%\cursors\arrow_r.cur”)

$RegCursors.SetValue(“Crosshair”,”%SystemRoot%\cursors\cross_r.cur”)

$RegCursors.SetValue(“Hand”,””)

$RegCursors.SetValue(“Help”,”%SystemRoot%\cursors\help_r.cur”)

$RegCursors.SetValue(“IBeam”,”%SystemRoot%\cursors\beam_r.cur”)

$RegCursors.SetValue(“No”,”%SystemRoot%\cursors\no_r.cur”)

$RegCursors.SetValue(“NWPen”,”%SystemRoot%\cursors\pen_r.cur”)

$RegCursors.SetValue(“SizeAll”,”%SystemRoot%\cursors\move_r.cur”)

$RegCursors.SetValue(“SizeNESW”,”%SystemRoot%\cursors\size1_r.cur”)

$RegCursors.SetValue(“SizeNS”,”%SystemRoot%\cursors\size4_r.cur”)

$RegCursors.SetValue(“SizeNWSE”,”%SystemRoot%\cursors\size2_r.cur”)

$RegCursors.SetValue(“SizeWE”,”%SystemRoot%\cursors\size3_r.cur”)

$RegCursors.SetValue(“UpArrow”,”%SystemRoot%\cursors\up_r.cur”)

$RegCursors.SetValue(“Wait”,”%SystemRoot%\cursors\busy_r.cur”)

$RegCursors.Close()

$RegConnect.Close()