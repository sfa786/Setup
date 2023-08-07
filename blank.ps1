$FontName1="timeline-small-black-ani"
Invoke-WebRequest -OutFile $env:USERPROFILE\Setup\$FontName1.zip http://www.rw-designer.com/cursor-downloadset.php?id=$FontName1
Expand-Archive  $env:USERPROFILE\Setup\$FontName1.zip -DestinationPath  %SystemRoot%\$FontName1





$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)

$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)

$RegCursors.SetValue(“”,”$FontName1”)

$RegCursors.SetValue(“AppStarting”,”%SystemRoot%\cursors\$FontName1\Working in background.ani'”)

$RegCursors.SetValue(“Arrow”,”%SystemRoot%\cursors\$FontName1\Normal.ani”)

$RegCursors.SetValue(“Crosshair”,”%SystemRoot%\cursors\$FontName1\Precision.ani”)

$RegCursors.SetValue(“Hand”,”%SystemRoot%\cursors\$FontName1\Link.ani”)

$RegCursors.SetValue(“Help”,”%SystemRoot%\cursors\$FontName1\Help.ani.cur”)

$RegCursors.SetValue(“IBeam”,”%SystemRoot%\cursors\$FontName1\Text.ani”)

$RegCursors.SetValue(“No”,”%SystemRoot%\cursors\$FontName1\Unavailable.ani”)

$RegCursors.SetValue(“NWPen”,”%SystemRoot%\cursors\$FontName1\Handwriting.cur”)

$RegCursors.SetValue(“SizeAll”,”%SystemRoot%\cursors\$FontName1\Move.ani”)

$RegCursors.SetValue(“Person”,”%SystemRoot%\cursors\$FontName1\Person.ani”)

$RegCursors.SetValue(“Pin”,”%SystemRoot%\cursors\$FontName1\Location.ani”)

$RegCursors.SetValue(“SizeNESW”,”%SystemRoot%\cursors\$FontName1\Diagonal resize 2.cur”)

$RegCursors.SetValue(“SizeNS”,”%SystemRoot%\cursors\$FontName1\Vertical resize.cur”)

$RegCursors.SetValue(“SizeNWSE”,”%SystemRoot%\cursors\$FontName1\Diagonal resize 1.cur”)

$RegCursors.SetValue(“SizeWE”,”%SystemRoot%\cursors\$FontName1\Horizontal resize.cur”)

$RegCursors.SetValue(“UpArrow”,”%SystemRoot%\cursors\$FontName1\Alternate.ani”)

$RegCursors.SetValue(“Wait”,”%SystemRoot%\cursors\$FontName1\Busy.ani”)

$RegCursors.Close()

$RegConnect.Close()