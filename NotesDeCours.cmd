@echo off
start "" /min powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0prg\main.ps1"
exit
