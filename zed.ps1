Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Install Scoop
function InstallScoop { 
    Write-Host "[+1] Installing Scoop..." -ForegroundColor Yellow
    try { 
        Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression 
        Write-Host "[+1] Scoop installed successfully." -ForegroundColor Green 
    } catch { 
        Write-Host "[-1] Scoop installation failed." -ForegroundColor Red 
        exit 1 
    }
}

# Check Scoop
if (-Not (Get-Command scoop -ErrorAction SilentlyContinue)) { InstallScoop } else { Write-Host "[1] Scoop OK." -ForegroundColor Green }
if (-Not (Get-Command scoop -ErrorAction SilentlyContinue)) { Write-Host "[!1] Scoop Missing." -ForegroundColor Red }

# Check Git
if (-Not (scoop list git -q)) { Write-Host "[+2] Installing Git..." -ForegroundColor Yellow; scoop install git }
if (-Not (scoop list git -q)) { Write-Host "[!2] Git Missing." -ForegroundColor Red } else { Write-Host "[2] Git OK." -ForegroundColor Green }

# Check Versions Bucket
$versionsBucket = scoop bucket list
if (-Not ($versionsBucket -match "versions")) { scoop bucket add versions } else { Write-Host "[3] Versions bucket OK." -ForegroundColor Green }

# Check Zed
if (-Not (scoop list zed -q)) { Write-Host "[+4] Installing Zed..."; scoop install versions/zed-nightly }

# Install Ollama
function CheckInstallOllama { 
    try { 
        if (Get-Command ollama -ErrorAction SilentlyContinue) { Write-Host "[x] Ollama Found." -ForegroundColor Green } 
        else { 
            Write-Host "[!x] Ollama Missing."; $timeout = 5 
            for ($i = $timeout; $i -gt 0; $i--) { Start-Sleep -Seconds 1; Write-Host "$i..." -NoNewline }
            $latestVersion = Invoke-RestMethod -Uri "https://api.github.com/repos/ollama/ollama/releases/latest" | Select-Object -ExpandProperty tag_name
            $installerUrl = "https://ollama.com/download/OllamaSetup.exe"; $installerPath = "$env:TEMP\ollama-installer.exe"
            Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath; Start-Process -FilePath $installerPath -ArgumentList "/silent" -Wait -Verb RunAs
            if (Get-Command ollama -ErrorAction SilentlyContinue) { Write-Host "[+x] Ollama installed successfully." -ForegroundColor Green } 
            else { Write-Host "[-x] Ollama installation failed." -ForegroundColor Red }
        }
    } catch { Write-Host "[-x] Ollama installation error: $_" -ForegroundColor Red }
}

# Launch Zed
Write-Host "[thanks] DONATE: BTC: 1FkginWYCCQFB9uWGvu8UXdDS9ZAxZTfbx"
Write-Host "[4] Launching Zed Editor..."; Start-Process "zed"
pause
