# 🎯 START HERE

## Welcome to MPIDC Tauri Desktop App!

This app provides a desktop version of the MPIDC Invoice System with automatic internet connectivity checking.

---

## ⚡ Quick Actions

### First Time Setup?
👉 Read: **QUICKSTART.md**

### Want to Build for Windows?
👉 Run: `.\build-windows.ps1` (PowerShell)
or
👉 Run: `build-windows.bat` (Double-click in Windows Explorer)

### Want to Test in Development?
👉 Run: `npm run dev`

---

## 📚 Documentation

| File | When to Use |
|------|-------------|
| **QUICKSTART.md** | 🚀 Just want to build and run |
| **SETUP.md** | 📖 Need detailed setup instructions |
| **BUILD_WINDOWS.md** | 🪟 Building for Windows distribution |
| **PROJECT_SUMMARY.md** | 🔧 Technical overview and architecture |
| **README.md** | 📘 Complete documentation |

---

## ✅ Prerequisites Checklist

Before building, you need:

- [ ] **Node.js** (v16+) - [Download](https://nodejs.org/)
- [ ] **Rust** - Install: `Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe; .\rustup-init.exe`
- [ ] **Visual Studio Build Tools** - Install: `winget install Microsoft.VisualStudio.2022.BuildTools`

After installing, **restart your terminal!**

---

## 🎯 What This App Does

```
1. User launches app
   ↓
2. App checks internet connection
   ↓
3a. If ONLINE:                    3b. If OFFLINE:
    → Loads MPIDC Invoice System      → Shows error message
    → User can log in                 → User can retry
                                      → Click retry → Go back to step 2
```

**Login Credentials:**
- Username: `admin`
- Password: `Admin@123`

---

## 🚀 Quick Build Commands

```bash
# Install dependencies (first time only)
npm install

# Run in development mode (fast, for testing)
npm run dev

# Build for production (takes 15-30 min first time)
npm run build

# Or use the automated build script
.\build-windows.ps1
```

---

## 📦 After Building

Find your app here:
```
src-tauri\target\release\mpidc-touri.exe          ← Executable
src-tauri\target\release\bundle\msi\              ← MSI Installer
src-tauri\target\release\bundle\nsis\             ← NSIS Installer
```

---

## 🆘 Having Issues?

### "npm not found"
→ Install Node.js from https://nodejs.org/

### "cargo not found"
→ Install Rust (see prerequisites above)
→ **Restart your terminal** after installation

### "MSVC not found"
→ Install Visual Studio Build Tools (see prerequisites above)

### Build is taking forever
→ First build: 15-30 minutes is **normal**
→ Next builds: 2-5 minutes

### More help?
→ Check **TROUBLESHOOTING** section in README.md
→ Check **BUILD_WINDOWS.md** for Windows-specific issues

---

## 🎨 Project Structure

```
mpidc-touri/
├── index.html           ← Main UI
├── main.js              ← Frontend logic
├── src-tauri/           ← Rust backend
│   ├── src/main.rs      ← Internet check logic
│   └── tauri.conf.json  ← App configuration
└── Documentation files
```

---

## 🎯 Key Features

✅ Internet connectivity check
✅ Offline error handling with retry
✅ Beautiful modern UI
✅ Small file size (~8-12 MB)
✅ Native Windows performance
✅ No browser required

---

## 📞 What's Next?

1. ✅ Read QUICKSTART.md
2. ✅ Install prerequisites
3. ✅ Run `npm install`
4. ✅ Run `npm run dev` to test
5. ✅ Run `npm run build` to create installer
6. ✅ Share with users!

---

**Ready? Start with QUICKSTART.md →**

---

**Need help?** All documentation is in this folder. Start with the file that matches your need from the table above.

**Just want to build?** Run: `.\build-windows.ps1`

**Just want to test?** Run: `npm install` then `npm run dev`

