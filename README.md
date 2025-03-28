# ZED Nightly For Windows
Simple PowerShell Script to download and run Zed IDE for Windows using Scoop




## Option 1: Install n' Run
Download and run the [Batch Script Here](https://github.com/send-me-a-ticket/zedForWindows/blob/main/RunZed.bat). 
Running the script for first time will install required dependencies: `scoop`, `git`, `zed`




## Option 2: Copy ' Paste
### Copy the below command to your terminal & run.
```
Invoke-RestMethod -Uri https://raw.githubusercontent.com/send-me-a-ticket/zedForWindows/refs/heads/main/zed.ps1 | Invoke-Expression
```
