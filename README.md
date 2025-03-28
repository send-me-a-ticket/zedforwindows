# ZED For Windows
Simple PowerShell Script to download and run Zed IDE for Windows using Scoop


## Install n' Run
Download and run the [Batch Script Here](https://github.com/send-me-a-ticket/zedForWindows/blob/main/RunZed.bat). 

Running the script for first time will install required dependencies: `scoop`, `git`, `zed`


### The Batch Script will download and run [this powershell script](https://github.com/send-me-a-ticket/zedForWindows/blob/main/zed.ps1)

### If you are on a restricted machine, Batch may be blocked and you will need to run the installation setup automatically.
```
Invoke-RestMethod -Uri https://raw.githubusercontent.com/send-me-a-ticket/zedForWindows/refs/heads/main/zed.ps1 | Invoke-Expression
```
