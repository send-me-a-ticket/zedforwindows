# ZED For Windows
Simple PowerShell Script to download and run Zed IDE for Windows using Scoop

## Installation

```
Invoke-RestMethod -Uri [https://raw.githubusercontent.com/send-me-a-ticket/zedForWindows/refs/heads/main/zed.ps1] | Invoke-Expression
```

Run the script from PowerShell. Running the script for first time will install required dependencies: scoop, git, zed
