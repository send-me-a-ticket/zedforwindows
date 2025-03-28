@ECHO OFF
Title Zed Install n' Run
powershell -Command "Invoke-RestMethod -Uri https://raw.githubusercontent.com/send-me-a-ticket/zedForWindows/refs/heads/main/zed.ps1 | Invoke-Expression"