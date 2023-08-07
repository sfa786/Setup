Add-Type -AssemblyName System.Windows.Forms

# List of applications to install
$appsToInstall = @(
    @{Name = "Starship";            Package = "Starship"},
    @{Name = "BatCat";              Package = "sharkdp.bat"},
    @{Name = "Windows Terminal";    Package = "Microsoft.WindowsTerminal"}
    # ... (Other apps here)
)

# Function to install an app using winget silently
function Install-AppWithWingetSilent {
    param (
        [string]$AppName
    )

    $isInstalled = winget list -q $AppName
    if ($isInstalled -like "No *") {
        Write-Host "Installing $AppName..."
        Write-Host

        winget install $AppName --verbose --accept-source-agreements --accept-package-agreements
        $exitCode = $LASTEXITCODE
        if ($exitCode -eq "0") { Write-Host "$AppName has been installed!" }

    } else {
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

# Create a table layout panel to hold the checkboxes
$tableLayoutPanel = New-Object Windows.Forms.TableLayoutPanel
$tableLayoutPanel.Dock = "Fill"
$tableLayoutPanel.Padding = New-Object Windows.Forms.Padding(20)

# Create custom font for labels and checkboxes
$customFont = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Regular)

# Create checkboxes for each app and add them to the table layout panel
$rowIndex = 0
foreach ($app in $appsToInstall) {
    $label = New-Object Windows.Forms.Label
    $label.Text = $app.Name
    $label.Font = $customFont
    $label.ForeColor = "DarkBlue"

    $checkBox = New-Object Windows.Forms.CheckBox
    $checkBox.Tag = $app.Package
    $checkBox.AutoSize = $true
    $checkBox.Font = $customFont
    $checkBox.ForeColor = "DarkBlue"

    $tableLayoutPanel.Controls.Add($label, 0, $rowIndex)
    $tableLayoutPanel.Controls.Add($checkBox, 1, $rowIndex)

    $rowIndex++
}

# Create an "Install" button
$installButton = New-Object Windows.Forms.Button
$installButton.Text = "Install"
$installButton.Font = $customFont
$installButton.ForeColor = "White"
$installButton.BackColor = "DarkBlue"
$installButton.FlatStyle = "Flat"
$installButton.Add_Click({
    $selectedApps = $tableLayoutPanel.Controls | Where-Object { $_ -is [Windows.Forms.CheckBox] -and $_.Checked }
    foreach ($app in $selectedApps) {
        Install-AppWithWingetSilent -AppName $app.Tag
    }

    # Close the form when installation is complete
    $form.Close()
})

$tableLayoutPanel.Controls.Add($installButton, 0, $rowIndex, 2, 1)

# Set column styles for the table layout panel
$tableLayoutPanel.ColumnStyles.Add((New-Object Windows.Forms.ColumnStyle([Windows.Forms.SizeType]::Percent, 50)))
$tableLayoutPanel.ColumnStyles.Add((New-Object Windows.Forms.ColumnStyle([Windows.Forms.SizeType]::Percent, 50)))

# Set row styles for the table layout panel
for ($i = 0; $i -lt $appsToInstall.Count; $i++) {
    $tableLayoutPanel.RowStyles.Add((New-Object Windows.Forms.RowStyle([Windows.Forms.SizeType]::Absolute, 30)))
}

# Add the table layout panel to the form
$form.Controls.Add($tableLayoutPanel)

# Show the form
$form.ShowDialog()
