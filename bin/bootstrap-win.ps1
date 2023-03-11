# This sciprt assumes that winget is already installed.

# Define array of applications to install using winget
$applications = @(
    "7zip.7zip",
    "Anki.Anki",
    "AgileBits.1Password",
    "Discord.Discord",
    "FastStone.Capture",
    "Git.Git",
    "Microsoft.PowerToys",
    "Microsoft.VisualStudioCode",
    "NeoVim.Neovim",
    "PeterPawlowski.foobar2000",
    "qBittorrent.qBittorrent",
    "Spotify.Spotify",
    "Starship.Starship",
    "Valve.Steam",
    "WireGuard.WireGuard" 
)

# Define array of buckets to add using scoop
$scoopbuckets = @(
    "extras",
    "nerd-fonts"
)

# Define array of applications to install using scoop
$scoopapps = @(
    "mpv",
    "terminal-icons",
    "gcc", 
    "Cascadia-Code",
    "FiraCode",
    "JetBrains-Mono"
)

# Install applications using winget
foreach ($app in $applications) {
    Write-Host "[INFO] Starting to install $app..." 
    winget install $app -e
    Write-Host "[INFO] Finished installing $app..." 
}

# Reload PowerShell session
powershell.exe -NoProfile -Command "& {[System.Environment]::Exit(0)}"

# Install Scoop
Write-Host "[INFO] Starting to install scoop..."
Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression
Write-Host "[INFO] Finished installing scoop..."

# Add scoop buckets
foreach ($bucket in $scoopbuckets) {
    Write-Host "[INFO] Starting to add bucket $bucket..." 
    scoop bucket add $bucket
    Write-Host "[INFO] Finished adding bucket $bucket..." 
}

# Add scoop apps
foreach ($app in $scoopapps) {
    Write-Host "[INFO] Starting to install $app..." 
    scoop install $app
    Write-Host "[INFO] Finished installing $app..." 
}

