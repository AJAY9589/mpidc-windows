# 🪟 Windows Installer Guide

This guide explains how to build **proper Windows installers** with installation wizards, desktop icons, and start menu shortcuts.

---

## 🎯 What You'll Get

When you build for Windows, you'll get **THREE files**:

### 1. **Standalone EXE** (No Installation)
- `mpidc-touri.exe`
- No installer needed
- Just double-click to run
- No desktop icon or start menu entry

### 2. **MSI Installer** (Professional)
- `MPIDC Invoice System_0.1.0_x64_en-US.msi`
- Professional Windows installer
- Installation wizard
- Desktop shortcut ✅
- Start Menu shortcut ✅
- Add/Remove Programs entry ✅
- Best for: Enterprise deployment, Group Policy

### 3. **NSIS Installer** (Modern & User-Friendly)
- `MPIDC Invoice System_0.1.0_x64-setup.exe`
- Modern installation wizard
- Desktop shortcut ✅
- Start Menu shortcut ✅
- Uninstaller ✅
- Best for: End users, general distribution

---

## 🚀 How to Build Installers

### **Step 1: Build for Production**

On your Mac (to prepare for Windows build):

```bash
npm run build
```

Or use the automated script:

```bash
./build-windows.ps1
```

### **Step 2: On Windows Machine**

To actually create the Windows installers, you need to build on a Windows machine:

**Install Prerequisites:**
```powershell
# Install Rust
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe

# Install Visual Studio Build Tools
winget install Microsoft.VisualStudio.2022.BuildTools

# Install Node.js from https://nodejs.org/
```

**Build the Installers:**
```bash
cd mpidc-touri
npm install
npm run build
```

⏱️ **First build: 15-30 minutes**

---

## 📦 Installer Locations

After building on Windows, find your installers:

```
src-tauri/target/release/
├── mpidc-touri.exe                                    ← Standalone (no install)
└── bundle/
    ├── msi/
    │   └── MPIDC Invoice System_0.1.0_x64_en-US.msi  ← MSI Installer
    └── nsis/
        └── MPIDC Invoice System_0.1.0_x64-setup.exe  ← NSIS Installer
```

---

## ✨ Installation Features

### What Users Get When Installing:

✅ **Desktop Shortcut**
- Icon on desktop
- Named "MPIDC Invoice System"
- Double-click to launch

✅ **Start Menu Entry**
- Found in Start Menu → "MPIDC Invoice System"
- Easy to search and launch

✅ **Uninstaller**
- Listed in Windows Settings → Apps
- Easy uninstall process

✅ **Application Icon**
- Custom icon throughout Windows
- Taskbar, Start Menu, Desktop

---

## 🎨 Customizing the Installation

The configuration in `tauri.conf.json` controls the installation:

```json
{
  "bundle": {
    "windows": {
      "nsis": {
        "createDesktopShortcut": true,      ← Desktop icon
        "createStartMenuShortcut": true,    ← Start menu
        "startMenuFolder": "MPIDC Invoice System",  ← Folder name
        "installerIcon": "icons/icon.ico"   ← Custom icon
      }
    }
  }
}
```

### Options You Can Change:

| Setting | What It Does |
|---------|-------------|
| `createDesktopShortcut` | Creates desktop icon (true/false) |
| `createStartMenuShortcut` | Creates start menu entry (true/false) |
| `startMenuFolder` | Name in Start Menu |
| `installMode` | `"currentUser"` or `"perMachine"` |
| `installerIcon` | Path to .ico file for installer |

---

## 📋 Comparison: MSI vs NSIS

| Feature | MSI Installer | NSIS Installer |
|---------|---------------|----------------|
| **Installation Wizard** | ✅ Professional | ✅ Modern |
| **Desktop Shortcut** | ✅ | ✅ |
| **Start Menu** | ✅ | ✅ |
| **Uninstaller** | ✅ | ✅ |
| **File Size** | Larger (~12 MB) | Smaller (~10 MB) |
| **Group Policy** | ✅ Yes | ❌ No |
| **Silent Install** | ✅ `/quiet` | ✅ `/S` |
| **Best For** | Enterprise | End Users |

---

## 🎯 Recommended Distribution

### For End Users (Most Common):
**Use NSIS Installer** (`*-setup.exe`)

```
MPIDC Invoice System_0.1.0_x64-setup.exe
```

- Modern interface
- Smaller file size
- User-friendly
- Creates desktop icon automatically

### For Enterprise/IT Deployment:
**Use MSI Installer** (`.msi`)

```
MPIDC Invoice System_0.1.0_x64_en-US.msi
```

- Can deploy via Group Policy
- IT-friendly
- Professional appearance
- Standardized Windows installer

---

## 🖥️ Installation Process for Users

### NSIS Installer (End Users):

1. User downloads `MPIDC Invoice System_0.1.0_x64-setup.exe`
2. Double-clicks the file
3. Windows SmartScreen warning appears (normal)
4. Click "More info" → "Run anyway"
5. Installation wizard opens:
   - Welcome screen
   - Choose installation folder
   - Choose shortcuts (Desktop ✅, Start Menu ✅)
   - Install button
6. Installation completes
7. Desktop icon appears ✅
8. App listed in Start Menu ✅

### MSI Installer (Enterprise):

1. User/IT downloads `.msi` file
2. Double-clicks or deploys via Group Policy
3. Standard Windows installer appears
4. Next → Next → Install
5. Shortcuts created automatically
6. Done!

---

## 🔐 Code Signing (Optional but Recommended)

To avoid Windows SmartScreen warnings, you should **code sign** your installer.

### Get a Code Signing Certificate:

1. Purchase from: Sectigo, DigiCert, or similar (~$100-400/year)
2. Or use: Let's Encrypt (free but complex setup)

### Configure Code Signing:

In `tauri.conf.json`:

```json
{
  "bundle": {
    "windows": {
      "certificateThumbprint": "YOUR_CERTIFICATE_THUMBPRINT",
      "digestAlgorithm": "sha256",
      "timestampUrl": "http://timestamp.digicert.com"
    }
  }
}
```

**Benefits:**
- No Windows SmartScreen warnings
- Users trust the installer more
- Professional appearance
- Required for some enterprise deployments

---

## 🧪 Testing Your Installer

### On Windows:

1. **Build the installer**
   ```bash
   npm run build
   ```

2. **Find the NSIS installer:**
   ```
   src-tauri/target/release/bundle/nsis/
   MPIDC Invoice System_0.1.0_x64-setup.exe
   ```

3. **Test installation:**
   - Double-click the installer
   - Follow the wizard
   - Check desktop for shortcut ✅
   - Check Start Menu ✅
   - Launch the app
   - Test functionality

4. **Test uninstallation:**
   - Windows Settings → Apps
   - Find "MPIDC Invoice System"
   - Click Uninstall
   - Verify shortcuts removed

---

## 🚚 Distribution Checklist

Before distributing to users:

- [ ] Tested installer on clean Windows machine
- [ ] Desktop shortcut works
- [ ] Start Menu entry works
- [ ] App launches correctly
- [ ] Internet check works
- [ ] Uninstaller works
- [ ] Custom icon appears everywhere
- [ ] (Optional) Code signing certificate applied
- [ ] Created README for users
- [ ] Documented system requirements

---

## 📝 User Instructions Template

Include this with your installer:

```
# MPIDC Invoice System - Installation Instructions

## System Requirements:
- Windows 10 or 11 (64-bit)
- Internet connection
- WebView2 Runtime (usually pre-installed)

## Installation Steps:
1. Download: MPIDC Invoice System_0.1.0_x64-setup.exe
2. Double-click the downloaded file
3. If Windows SmartScreen appears:
   - Click "More info"
   - Click "Run anyway"
4. Follow the installation wizard
5. Choose installation location (or use default)
6. Select shortcuts (Desktop & Start Menu recommended)
7. Click Install
8. Click Finish

## Launching the App:
- Double-click desktop icon, OR
- Search "MPIDC" in Start Menu

## Login Credentials:
- Username: admin
- Password: Admin@123
- ⚠️ Change password after first login

## Uninstalling:
- Windows Settings → Apps → MPIDC Invoice System → Uninstall
```

---

## 🆘 Common Issues

### "Windows protected your PC" message
**Cause:** App not code signed
**Solution:** Click "More info" → "Run anyway"
Or: Get a code signing certificate

### Desktop shortcut not created
**Check:** `tauri.conf.json` has `"createDesktopShortcut": true`
**Solution:** Reinstall or create shortcut manually

### "WebView2 not found" error
**Solution:**
```powershell
winget install Microsoft.EdgeWebView2Runtime
```

---

## 🎉 Summary

You now have:
- ✅ MSI installer (for enterprise)
- ✅ NSIS installer (for end users)
- ✅ Desktop shortcuts
- ✅ Start Menu entries
- ✅ Proper uninstaller
- ✅ Professional installation experience

**Recommended for most users:** Use the **NSIS installer** (`.exe` in the nsis folder)

---

**Need help? Check BUILD_WINDOWS.md for detailed build instructions!**

