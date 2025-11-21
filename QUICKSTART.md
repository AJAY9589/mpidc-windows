# 🚀 Quick Start - MPIDC Tauri App

## For Windows Users (Step by Step)

### 1️⃣ Install Prerequisites (One-time setup)

Open PowerShell as Administrator and run:

```powershell
# Install Visual Studio Build Tools
winget install Microsoft.VisualStudio.2022.BuildTools

# Install Rust
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe
```

Download and install Node.js from: https://nodejs.org/

**Close and reopen PowerShell after installing!**

### 2️⃣ Setup Project

```bash
cd mpidc-touri
npm install
```

### 3️⃣ Build the App

**Option A: Using PowerShell Script (Easiest)**

```powershell
.\build-windows.ps1
```

**Option B: Using Batch File**

Double-click `build-windows.bat` in File Explorer

**Option C: Manual Build**

```bash
npm run build
```

### 4️⃣ Find Your App

After build completes (15-30 minutes first time), find:

**Executable:**
```
src-tauri\target\release\mpidc-touri.exe
```

**Installers:**
```
src-tauri\target\release\bundle\msi\        <- MSI installer
src-tauri\target\release\bundle\nsis\       <- NSIS installer
```

---

## Development Mode (For Testing)

Want to test without building?

```bash
npm run dev
```

This opens the app instantly with hot-reload.

---

## ⚠️ Common Issues

### "cargo not found"
- Restart your terminal after installing Rust
- Run: `rustup --version` to verify

### "MSVC not found"
- Install Visual Studio Build Tools (see step 1)
- Must include "Desktop development with C++"

### Build takes forever
- First build: 15-30 minutes (normal!)
- Next builds: 2-5 minutes

### Icons missing warning
```bash
npx @tauri-apps/cli icon path/to/logo.png
```
Or ignore for now - app works without custom icon

---

## 📱 What You Get

✅ Small app size (~8-12 MB)
✅ Internet connectivity check
✅ Offline error handling  
✅ Native Windows performance
✅ Access to MPIDC Invoice System
✅ No browser required

---

## 🎯 App Features

1. **Launches** → Checks internet connection
2. **Online** → Opens MPIDC login page
3. **Offline** → Shows error with retry button
4. **Login** → Use admin/Admin@123

---

## 📦 Distributing Your App

Share any of these with users:

1. **mpidc-touri.exe** - No install needed, just run
2. **MSI installer** - Professional, for enterprise
3. **NSIS installer** - Modern, for end users

Users need:
- Windows 10/11
- Internet connection to use the app
- WebView2 (usually pre-installed)

---

## 🆘 Need More Help?

- Detailed setup: `SETUP.md`
- Build guide: `BUILD_WINDOWS.md`
- Full docs: `README.md`

---

**That's it! You now have a Windows desktop app for MPIDC Invoice System! 🎉**

