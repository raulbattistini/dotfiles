# Complete LunarVim Reinstall Script
# Run this in PowerShell

Write-Host "Starting complete LunarVim reinstall..." -ForegroundColor Yellow

# Function to safely remove directories
function Remove-DirectorySafely {
    param([string]$Path, [string]$Description)
    
    if (Test-Path $Path) {
        try {
            Write-Host "Removing $Description at: $Path" -ForegroundColor Green
            Remove-Item -Recurse -Force $Path -ErrorAction Stop
            Write-Host "✓ Successfully removed $Description" -ForegroundColor Green
        }
        catch {
            Write-Host "✗ Failed to remove $Description : $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    else {
        Write-Host "- $Description not found at: $Path" -ForegroundColor Gray
    }
}

# Remove ALL LunarVim and Neovim data
Write-Host "Step 1: Removing all LunarVim and Neovim data..." -ForegroundColor Cyan

Remove-DirectorySafely "C:\Users\$env:USERNAME\AppData\Local\lvim" "LunarVim Config"
Remove-DirectorySafely "C:\Users\$env:USERNAME\AppData\Local\lunarvim" "LunarVim Local Data"
Remove-DirectorySafely "C:\Users\$env:USERNAME\AppData\Roaming\lunarvim" "LunarVim Roaming Data"
Remove-DirectorySafely "C:\Users\$env:USERNAME\AppData\Local\nvim" "Neovim Config"
Remove-DirectorySafely "C:\Users\$env:USERNAME\AppData\Local\nvim-data" "Neovim Data"
Remove-DirectorySafely "C:\Users\$env:USERNAME\.local\share\lunarvim" "LunarVim Share Data"
Remove-DirectorySafely "C:\Users\$env:USERNAME\.cache\lvim" "LunarVim Cache"

Write-Host "`nStep 2: Downloading and installing fresh LunarVim..." -ForegroundColor Cyan

try {
    # Download and run the official LunarVim installer
    Invoke-RestMethod https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.ps1 | Invoke-Expression
    
    Write-Host "✓ LunarVim installation completed!" -ForegroundColor Green
}
catch {
    Write-Host "✗ Failed to install LunarVim: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Please try running the installer manually:" -ForegroundColor Yellow
    Write-Host "iwr https://raw.githubusercontent.com/LunarVim/LunarVim/master/utils/installer/install.ps1 -UseBasicParsing | iex" -ForegroundColor Yellow
}

Write-Host "`nStep 3: Next steps:" -ForegroundColor Cyan
Write-Host "1. Close this PowerShell window" -ForegroundColor White
Write-Host "2. Open a new PowerShell window" -ForegroundColor White
Write-Host "3. Run: lvim --version" -ForegroundColor White
Write-Host "4. If that works, run: lvim" -ForegroundColor White
Write-Host "5. Let LunarVim install all plugins on first run" -ForegroundColor White

Write-Host "`nReinstall complete!" -ForegroundColor Green