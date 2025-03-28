Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Function to install Scoop automatically
function Install-Scoop {
    Write-Host "[+1] Installing Scoop..." -ForegroundColor Yellow
    try {
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
        Write-Host "[+1] Scoop installed successfully." -ForegroundColor Green
    } catch {
        Write-Host "[-1] Failed to install Scoop. Please check your network connection or permissions." -ForegroundColor Red
        exit 1
    }
}

# Check if Scoop is installed
if (-Not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Install-Scoop
} else {
    Write-Host "[1] Scoop OK." -ForegroundColor Green
}

if (-Not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "[!1] Scoop missing." -ForegroundColor Red
}

# Check if Git is installed via Scoop
if (-Not (scoop list git -q)) {
    Write-Host "[+2] Installing Git..." -ForegroundColor Yellow
    scoop install git
}

if (-Not (scoop list git -q)) {
    Write-Host "[!2] Git missing." -ForegroundColor Yellow
} else {
    Write-Host "[2] Git OK." -ForegroundColor Green
}

# Check if the 'versions' bucket is added
$bucketList = scoop bucket list
if (-Not ($bucketList -match "versions")) {
    Write-Host "'versions' bucket is not added. Adding..." -ForegroundColor Yellow
    scoop bucket add versions
} else {
    Write-Host "[3] 'versions' bucket is already added." -ForegroundColor Green
}


# Check if Zed is installed
if (-Not (scoop list zed -q)) {
    Write-Host "[+4] Zed is not installed. Installing..." -ForegroundColor Red
    scoop install versions/zed-nightly
}

# Launch Zed
Write-Host "[4] Launching Zed..." -ForegroundColor Green
Start-Process "zed"
