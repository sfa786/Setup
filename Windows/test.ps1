Add-Type -AssemblyName System.Windows.Forms

# List of applications to install
$appsToInstall = @(
    @{Name = "Starship";            Package = "Starship"},
    @{Name = "BatCat";                 Package = "sharkdp.bat"},
    @{Name = "Windows Terminal";    Package = "Microsoft.WindowsTerminal"},
    @{Name = "WinRAR";              Package = "RARLab.WinRAR"},
    @{Name = "Git";                 Package = "Git.Git"},
    @{Name = "GitHub Cli";          Package = "GitHub.cli"},
    @{Name = "Logitech ";           Package = "Logitech.GHUB"},
    @{Name = "XDM";                 Package = "subhra74.XtremeDownloadManager"},
    @{Name = "GreenShot";           Package = "Greenshot.Greenshot"},
    @{Name = "RDP";                 Package = "Microsoft Remote Desktop"},
    @{Name = "PowerToys";           Package = "Microsoft.Powertoys"},
    @{Name = "Speedtest by Ookla";  Package = "9NBLGGH4Z1JC"},
    @{Name = "GreenShot";           Package = "Greenshot.Greenshot"},
    @{Name = "GreenShot";           Package = "Greenshot.Greenshot"}
)


# Function to install an app using winget silently
function Install-AppWithWingetSilent {
    param(
        [string]$AppName
    )

    $isInstalled = winget list -q $AppName
    if ($isInstalled -like "No *") {
        Write-Host "Installing $AppName..."
        Write-Host

        winget install $AppName  --verbose --accept-source-agreements --accept-package-agreements 
        $exitCode = $LASTEXITCODE
        if ($exitCode -eq "0"){ Write-Host "$AppName has been installed!"}
        
        
    }
    else {
        Write-Host "$AppName is already installed on this system."
    }
}

# Create a Windows Forms window
$form = New-Object Windows.Forms.Form
$form.Text = "Select Apps to Install"
$form.Size = New-Object Drawing.Size(500, 350)
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.StartPosition = "CenterScreen"

# Create a flow layout panel to hold the checkboxes
$flowLayoutPanel = New-Object Windows.Forms.FlowLayoutPanel
$flowLayoutPanel.Dock = "Fill"
$flowLayoutPanel.Padding = New-Object Windows.Forms.Padding(20)

# Create custom font for labels and checkboxes
$customFont = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Create checkboxes for each app and add them to the flow layout panel
$checkBoxes = @()
foreach ($app in $appsToInstall) {
    $checkBox = New-Object Windows.Forms.CheckBox
    $checkBox.Text = $app.Name
    $checkBox.Tag = $app.Package
    $checkBox.Font = $customFont
    $checkBox.ForeColor = "DarkBlue"
    $checkBox.AutoSize = $true
    $checkBoxes += $checkBox
    $flowLayoutPanel.Controls.Add($checkBox)
}

# Create an "Install" button
$installButton = New-Object Windows.Forms.Button
$installButton.Text = "Install Selected Apps"
$installButton.Font = $customFont
$installButton.ForeColor = "White"
$installButton.BackColor = "DarkBlue"
$installButton.FlatStyle = "Flat"
$installButton.Add_Click({
    $selectedApps = $checkBoxes | Where-Object { $_.Checked }
    foreach ($app in $selectedApps) {
        Install-AppWithWingetSilent -AppName $app.Tag
    }
    
})
$flowLayoutPanel.Controls.Add($installButton)

# Add the flow layout panel to the form
$form.Controls.Add($flowLayoutPanel)

# Show the form
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()
