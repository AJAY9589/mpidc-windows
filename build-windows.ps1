# Windows Build Script for MPIDC Tauri App
# Run this script in PowerShell to build the Windows application

Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  MPIDC Invoice System - Windows Build Script  " -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Function to check if a command exists
function Test-Command($cmdname) {
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# Check prerequisites
Write-Host "Checking prerequisites..." -ForegroundColor Yellow
Write-Host ""

$allPrereqsMet = $true

# Check Node.js
if (Test-Command "node") {
    $nodeVersion = node --version
    Write-Host "✓ Node.js: $nodeVersion" -ForegroundColor Green
} else {
    Write-Host "✗ Node.js not found!" -ForegroundColor Red
    Write-Host "  Download from: https://nodejs.org/" -ForegroundColor Yellow
    $allPrereqsMet = $false
}

# Check npm
if (Test-Command "npm") {
    $npmVersion = npm --version
    Write-Host "✓ npm: v$npmVersion" -ForegroundColor Green
} else {
    Write-Host "✗ npm not found!" -ForegroundColor Red
    $allPrereqsMet = $false
}

# Check Rust
if (Test-Command "cargo") {
    $cargoVersion = cargo --version
    Write-Host "✓ Rust: $cargoVersion" -ForegroundColor Green
} else {
    Write-Host "✗ Rust not found!" -ForegroundColor Red
    Write-Host "  Install with: Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe; .\rustup-init.exe" -ForegroundColor Yellow
    $allPrereqsMet = $false
}

Write-Host ""

if (-not $allPrereqsMet) {
    Write-Host "❌ Prerequisites not met. Please install missing components." -ForegroundColor Red
    Write-Host ""
    Write-Host "See SETUP.md for detailed installation instructions." -ForegroundColor Yellow
    exit 1
}

# Check if dependencies are installed
if (-not (Test-Path "node_modules")) {
    Write-Host "Installing dependencies..." -ForegroundColor Yellow
    npm install
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Dependencies installed" -ForegroundColor Green
    Write-Host ""
}

# Check for icons
Write-Host "Checking for app icons..." -ForegroundColor Yellow
if (-not (Test-Path "src-tauri/icons/icon.svg")) {
    Write-Host "⚠ No icons found. Running icon generation script..." -ForegroundColor Yellow
    if (Test-Path "generate-icons.sh") {
        bash generate-icons.sh
    }
}

$hasIcons = (Test-Path "src-tauri/icons/icon.ico") -or (Test-Path "src-tauri/icons/icon.svg")
if ($hasIcons) {
    Write-Host "✓ Icons found" -ForegroundColor Green
} else {
    Write-Host "⚠ Warning: No .ico icon found. App will build but without custom icon." -ForegroundColor Yellow
    Write-Host "  Run: npx @tauri-apps/cli icon path/to/your/logo.png" -ForegroundColor Yellow
}
Write-Host ""

# Build the application
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "  Starting build process...                     " -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This will take 15-30 minutes for first build..." -ForegroundColor Yellow
Write-Host "Subsequent builds are much faster (2-5 minutes)" -ForegroundColor Yellow
Write-Host ""

$startTime = Get-Date

npm run build

if ($LASTEXITCODE -eq 0) {
    $endTime = Get-Date
    $duration = $endTime - $startTime
    
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Green
    Write-Host "  ✓ Build completed successfully!               " -ForegroundColor Green
    Write-Host "================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Build time: $($duration.ToString('mm\:ss'))" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Your application is ready:" -ForegroundColor Green
    Write-Host ""
    Write-Host "Executable:" -ForegroundColor Yellow
    Write-Host "  src-tauri\target\release\mpidc-touri.exe" -ForegroundColor White
    Write-Host ""
    Write-Host "Installers:" -ForegroundColor Yellow
    
    if (Test-Path "src-tauri\target\release\bundle\msi") {
        $msiFiles = Get-ChildItem "src-tauri\target\release\bundle\msi\*.msi"
        foreach ($file in $msiFiles) {
            Write-Host "  $($file.FullName)" -ForegroundColor White
        }
    }
    
    if (Test-Path "src-tauri\target\release\bundle\nsis") {
        $nsisFiles = Get-ChildItem "src-tauri\target\release\bundle\nsis\*.exe"
        foreach ($file in $nsisFiles) {
            Write-Host "  $($file.FullName)" -ForegroundColor White
        }
    }
    
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "  1. Test the executable" -ForegroundColor White
    Write-Host "  2. Install using one of the installers" -ForegroundColor White
    Write-Host "  3. Distribute to your users" -ForegroundColor White
    Write-Host ""
    
} else {
    Write-Host ""
    Write-Host "❌ Build failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Common solutions:" -ForegroundColor Yellow
    Write-Host "  1. Ensure Visual Studio Build Tools are installed" -ForegroundColor White
    Write-Host "  2. Run: rustup update" -ForegroundColor White
    Write-Host "  3. Delete src-tauri\target folder and try again" -ForegroundColor White
    Write-Host "  4. Check BUILD_WINDOWS.md for troubleshooting" -ForegroundColor White
    Write-Host ""
    exit 1
}

