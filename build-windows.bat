@echo off
REM Windows Batch Build Script for MPIDC Tauri App
REM This is a simple wrapper that calls the PowerShell build script

echo Starting build script...
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0build-windows.ps1"

if %ERRORLEVEL% neq 0 (
    echo.
    echo Build script failed with error code %ERRORLEVEL%
    pause
    exit /b %ERRORLEVEL%
)

echo.
pause

