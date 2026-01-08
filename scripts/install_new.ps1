# set color theme
$Theme = @{
    Primary   = 'Cyan'
    Success   = 'Green'
    Warning   = 'Yellow'
    Error     = 'Red'
    Info      = 'White'
}

# ASCII Logo
$Logo = @"
   ██████╗██╗   ██╗██████╗ ███████╗ ██████╗ ██████╗      ██████╗ ██████╗  ██████╗
  ██╔════╝██║   ██║██╔══██╗██╔════╝██╔═══██╗██╔══██╗     ██╔══██╗██╔══██╗██╔═══██╗
  ██║     ██║   ██║██████╔╝███████╗██║   ██║██████╔╝     ██████╔╝██████╔╝██║   ██║
  ██║     ██║   ██║██╔══██╗╚════██║██║   ██║██╔══██╗     ██╔═══╝ ██╔══██╗██║   ██║
  ╚██████╗╚██████╔╝██║  ██║███████║╚██████╔╝██║  ██║     ██║     ██║  ██║╚██████╔╝
   ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝     ╚═╝     ╚═╝  ╚═╝ ╚═════╝
"@

# Beautiful Output Function
function Write-Styled {
    param (
        [string]$Message,
        [string]$Color = $Theme.Info,
        [string]$Prefix = "",
        [switch]$NoNewline
    )
    $symbol = switch ($Color) {
        $Theme.Success { "[OK]" }
        $Theme.Error   { "[X]" }
        $Theme.Warning { "[!]" }
        default        { "[*]" }
    }

    $output = if ($Prefix) { "$symbol $Prefix :: $Message" } else { "$symbol $Message" }
    if ($NoNewline) {
        Write-Host $output -ForegroundColor $Color -NoNewline
    } else {
        Write-Host $output -ForegroundColor $Color
    }
}

# Show Logo
Write-Host $Logo -ForegroundColor $Theme.Primary
Write-Host "Version Development" -ForegroundColor $Theme.Info
Write-Host "Created by Amanjeet`n" -ForegroundColor $Theme.Info

# Set TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Main installation function
function Install-CursorFreeVIP {
    Write-Styled "Setting up Cursor Free VIP from source" -Color $Theme.Primary -Prefix "Setup"

    try {
        # Check if Python is installed
        Write-Styled "Checking Python installation..." -Color $Theme.Primary -Prefix "Python"
        $pythonCommand = Get-Command python -ErrorAction SilentlyContinue
        if (!$pythonCommand) {
            $pythonCommand = Get-Command python3 -ErrorAction SilentlyContinue
        }
        if (!$pythonCommand) {
            Write-Styled "Python is not installed. Please install Python 3.7+ from https://python.org" -Color $Theme.Error -Prefix "Error"
            throw "Python not found"
        }
        Write-Styled "Python found: $($pythonCommand.Source)" -Color $Theme.Success -Prefix "Python"

        # Clone or download the repository
        Write-Styled "Downloading Cursor Free VIP source code..." -Color $Theme.Primary -Prefix "Download"
        $installPath = Join-Path $env:USERPROFILE "cursor-free-vip"

        if (Test-Path $installPath) {
            Write-Styled "Source code already exists, updating..." -Color $Theme.Warning -Prefix "Update"
            Set-Location $installPath
            & git pull 2>$null
        } else {
            Write-Styled "Cloning repository..." -Color $Theme.Info -Prefix "Clone"
            & git clone https://github.com/amanjeet233/cursur-vip.git $installPath 2>$null
            Set-Location $installPath
        }

        # Install requirements
        Write-Styled "Installing Python dependencies..." -Color $Theme.Primary -Prefix "Deps"
        & $pythonCommand.Source -m pip install --user -r requirements.txt 2>$null

        # Create desktop shortcut
        Write-Styled "Creating desktop shortcut..." -Color $Theme.Primary -Prefix "Shortcut"
        $desktopPath = [Environment]::GetFolderPath("Desktop")
        $shortcutPath = Join-Path $desktopPath "Cursor Free VIP.lnk"

        $WshShell = New-Object -comObject WScript.Shell
        $Shortcut = $WshShell.CreateShortcut($shortcutPath)
        $Shortcut.TargetPath = $pythonCommand.Source
        $Shortcut.Arguments = "`"main.py`""
        $Shortcut.WorkingDirectory = $installPath
        $Shortcut.Description = "Cursor Free VIP - Bypass Cursor Pro limits"
        $Shortcut.Save()

        Write-Styled "Installation completed successfully!" -Color $Theme.Success -Prefix "Complete"
        Write-Styled "Shortcut created on desktop: Cursor Free VIP.lnk" -Color $Theme.Info -Prefix "Shortcut"
        Write-Styled "You can now run Cursor Free VIP from your desktop" -Color $Theme.Info -Prefix "Ready"

        # Ask to run now
        $runNow = Read-Host "Would you like to run Cursor Free VIP now? (y/n)"
        if ($runNow -eq 'y' -or $runNow -eq 'Y') {
            Write-Styled "Starting Cursor Free VIP..." -Color $Theme.Primary -Prefix "Launch"
            Start-Process $pythonCommand.Source -ArgumentList "`"main.py`"" -WorkingDirectory $installPath
        }

    }
    catch {
        Write-Styled $_.Exception.Message -Color $Theme.Error -Prefix "Error"
        throw
    }
}

# Execute installation
try {
    Install-CursorFreeVIP
}
catch {
    Write-Styled "Installation failed" -Color $Theme.Error -Prefix "Error"
    Write-Styled $_.Exception.Message -Color $Theme.Error
}
finally {
    Write-Host "`nPress any key to exit..." -ForegroundColor $Theme.Info
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
}