# ZED For Windows
Simple PowerShell Script to download and run Zed IDE for Windows using Scoop


## Install n' Run
Download and run the (Batch Script Here)[https://github.com/send-me-a-ticket/zedForWindows/blob/main/RunZed.bat]
Running the script for first time will install required dependencies: scoop, git, zedRunning the script for first time will install required dependencies: scoop, git, zed

### The Batch Script will download and run file below
```
Invoke-RestMethod -Uri https://raw.githubusercontent.com/send-me-a-ticket/zedForWindows/refs/heads/main/zed.ps1 | Invoke-Expression
```
