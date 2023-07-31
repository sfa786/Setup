# Import the Appx module
Import-Module Appx

# Get a list of all installed apps
$apps = Get-AppxPackage

# Loop through the apps and uninstall them if they are not the Windows Store app or App Installer
foreach ($app in $apps) {
    if ($app.Name -ne "Microsoft.WindowsStore" -and $app.Name -ne "Microsoft.DesktopAppInstaller") {
        Write-Host "Uninstalling $($app.Name)..."
        try {
            Remove-AppxPackage -Package $app.PackageFullName -ErrorAction Stop
            Write-Host "Uninstall command executed for $($app.Name)"
        } catch {
            Write-Host "Failed to uninstall $($app.Name). Error: $($_.Exception.Message)"
        }
    }
    else {
        Write-Host "Skipping $($app.Name)..."
    }
}
