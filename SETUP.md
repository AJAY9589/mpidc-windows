# Quick Setup Guide for MPIDC Tauri App

This guide will help you get the app running and built for Windows.

## 🚀 Quick Start

### For Windows Users

#### Step 1: Install Prerequisites

You need these tools installed:

1. **Node.js** - Download from https://nodejs.org/ (LTS version)
2. **Rust** - Run in PowerShell:
   ```powershell
   Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
   .\rustup-init.exe
   ```
3. **Visual Studio Build Tools** - Run in PowerShell (as Administrator):
   ```powershell
   winget install Microsoft.VisualStudio.2022.BuildTools
   ```

#### Step 2: Setup Project

```bash
# Navigate to project directory
cd mpidc-touri

# Install dependencies
npm install
```

#### Step 3: Generate Icons (Important!)

Before building, you need to create app icons. Choose one of these methods:

**Method A: Use Tauri CLI (Easiest)**

If you have a logo PNG file (512x512 or larger):

```bash
npx @tauri-apps/cli icon path/to/your/logo.png
```

**Method B: Use Online Converter**

1. Use the provided `src-tauri/icons/icon.svg` as a base
2. Convert it to PNG at https://svgtopng.com/
3. Then convert PNG to ICO at https://convertio.co/png-ico/
4. Save as `src-tauri/icons/icon.ico`

**Method C: Use Default App Icon**

If you just want to test, you can use Windows' default icon temporarily:
- The app will build but won't have a custom icon

#### Step 4: Run Development Mode

```bash
npm run dev
```

This will:
- Start the development server
- Open the app
- Enable hot-reload for quick testing

#### Step 5: Build for Windows

```bash
npm run build
```

**Build Time:** First build takes 15-30 minutes. Be patient!

**Output Location:**
- Executable: `src-tauri/target/release/mpidc-touri.exe`
- MSI Installer: `src-tauri/target/release/bundle/msi/`
- NSIS Installer: `src-tauri/target/release/bundle/nsis/`

## ✅ What This App Does

1. **Internet Check**: Automatically checks if you're online when the app starts
2. **Error Handling**: Shows a friendly error if there's no internet connection
3. **Retry Feature**: Allows you to retry the connection
4. **MPIDC Login**: Once connected, loads https://mpidc-invoice-system.vercel.app/login

## 🔧 Troubleshooting

### "npm install" fails
- Make sure Node.js is installed: `node --version`
- Try: `npm cache clean --force` then `npm install` again

### "cargo not found" error
- Restart your terminal after installing Rust
- Verify: `cargo --version`

### "MSVC not found" error
- Install Visual Studio Build Tools (see Step 1)
- Make sure to include "Desktop development with C++"

### Build is very slow
- This is normal for the first build (15-30 minutes)
- Subsequent builds are much faster (2-5 minutes)
- Rust compiles everything from scratch the first time

### "WebView2 not found"
```powershell
winget install Microsoft.EdgeWebView2Runtime
```

## 📦 Distribution

After building, you can share:

1. **Standalone EXE**: Share `mpidc-touri.exe` (no installation needed)
2. **MSI Installer**: Professional installer for enterprise deployment
3. **NSIS Installer**: Modern installer for end users

## 🎯 Features

- ✅ Internet connectivity check
- ✅ User-friendly error messages
- ✅ Automatic retry mechanism
- ✅ Native Windows performance
- ✅ Small file size (~8-12 MB)
- ✅ No Electron overhead
- ✅ Secure webview integration

## 📝 Next Steps

1. Test the app in development mode
2. Generate proper app icons
3. Build for production
4. Test the installer
5. Distribute to users

## 🆘 Need Help?

Common issues and solutions:

| Issue | Solution |
|-------|----------|
| Build fails | Check all prerequisites are installed |
| Icons missing | Run icon generation command |
| Slow build | Normal for first time, be patient |
| Runtime error | Check internet connection |

## 📚 Additional Documentation

- Full README: See `README.md`
- Windows Build Guide: See `BUILD_WINDOWS.md`
- Icon Guide: See `src-tauri/icons/README.md`

---

**Default Login Credentials:**
- Username: `admin`
- Password: `Admin@123`

⚠️ Remember to change password after first login!

