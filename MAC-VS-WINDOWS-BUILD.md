# 🖥️ Mac vs Windows Build - What You Need to Know

## ⚠️ Important: Where You Build Matters!

The operating system you build on determines what installers you can create.

---

## 📊 Build Comparison

| Build On | Can Create | Cannot Create |
|----------|-----------|---------------|
| **macOS** (your current system) | ✅ macOS .app<br>✅ Standalone executable | ❌ Windows MSI installer<br>❌ Windows NSIS installer |
| **Windows** | ✅ Windows MSI installer<br>✅ Windows NSIS installer<br>✅ Standalone .exe | ❌ macOS .app |
| **Linux** | ✅ Linux packages (.deb, .AppImage) | ❌ Windows/Mac installers |

---

## 🎯 Your Situation

**You're on:** macOS
**You want:** Windows installers with desktop shortcuts
**Problem:** Mac cannot create Windows installers

---

## ✅ Solutions (Choose One)

### **Solution 1: Build on Windows Machine** (Recommended - Fastest)

If you have access to a Windows machine:

**On Windows:**
```powershell
# 1. Transfer project to Windows
# (USB drive, cloud storage, or git clone)

# 2. Install prerequisites
# Node.js: https://nodejs.org/
# Rust:
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe

# Visual Studio Build Tools:
winget install Microsoft.VisualStudio.2022.BuildTools

# 3. Build
cd mpidc-touri
npm install
npm run build

# 4. Find your installers
# Desktop shortcuts ✅: src-tauri/target/release/bundle/nsis/
# Start menu ✅: src-tauri/target/release/bundle/msi/
```

⏱️ **Time:** 15-30 minutes first build

---

### **Solution 2: Use GitHub Actions** (No Windows Needed!)

Build Windows installers in the cloud using GitHub:

**Steps:**
```bash
# 1. Push to GitHub
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/mpidc-touri.git
git push -u origin main

# 2. GitHub Actions builds automatically

# 3. Download installers from GitHub Actions artifacts
```

⏱️ **Time:** 15-20 minutes per build

📖 **Read:** `BUILD-ON-GITHUB.md` for detailed instructions

✅ **Already configured!** The workflow file is ready at `.github/workflows/build.yml`

---

### **Solution 3: Build on Mac (For Testing Only)**

You can build on Mac to test functionality, but you won't get Windows installers:

```bash
npm run build
```

**You'll get:**
- ✅ macOS app for testing
- ✅ Verify internet check works
- ✅ Verify UI looks good
- ❌ No Windows MSI installer
- ❌ No Windows NSIS installer

---

## 🤔 Why Can't Mac Build Windows Installers?

**Technical reason:**

- **NSIS** (Nullsoft Scriptable Install System) is a Windows-specific installer creator
- **WiX Toolset** (for MSI) only runs on Windows
- These tools require Windows APIs and registry access

**Cross-compilation limitations:**
- Tauri can cross-compile the Rust code
- But installer creators are platform-specific
- Must run on the target platform

---

## 📋 Recommended Workflow

### **For Development (Mac):**
```bash
npm run dev          # Test the app
npm run build        # Build macOS version for testing
```

### **For Windows Distribution:**

**Option A - Have Windows machine:**
```
1. Develop on Mac
2. Transfer code to Windows
3. Build on Windows
4. Get Windows installers ✅
```

**Option B - No Windows machine:**
```
1. Develop on Mac
2. Push to GitHub
3. GitHub Actions builds Windows installers
4. Download from GitHub ✅
```

---

## 🎯 What You Should Do Now

### **✅ Config is Fixed!**

The error in `tauri.conf.json` is now fixed. Desktop shortcuts and Start Menu entries are configured.

### **Choose Your Path:**

#### **Path 1: Have Windows Machine?**
```powershell
# On Windows:
cd mpidc-touri
npm install
npm run build

# Get installers from:
# src-tauri/target/release/bundle/nsis/  ← Desktop shortcuts ✅
# src-tauri/target/release/bundle/msi/   ← Start menu ✅
```

#### **Path 2: No Windows Machine?**
```bash
# On Mac:
git init
git add .
git commit -m "Initial commit"
# Create repo on GitHub
git remote add origin https://github.com/YOUR_USERNAME/mpidc-touri.git
git push -u origin main

# Then download Windows installers from GitHub Actions
```

#### **Path 3: Just Want to Test?**
```bash
# On Mac:
npm run dev    # Test in development mode
```

---

## 📦 What Installers Include

When you finally build on Windows (or via GitHub Actions):

### **NSIS Installer** (Recommended)
```
MPIDC Invoice System_0.1.0_x64-setup.exe

✅ Desktop shortcut (automatic)
✅ Start Menu entry (automatic)  
✅ Installation wizard
✅ Custom icon throughout
✅ Easy uninstall
```

### **MSI Installer** (Enterprise)
```
MPIDC Invoice System_0.1.0_x64_en-US.msi

✅ Desktop shortcut (automatic)
✅ Start Menu entry (automatic)
✅ Group Policy deployment
✅ Professional installer
```

---

## 🆘 FAQ

### Q: Can I build Windows installers on Mac?
**A:** Not directly. Use GitHub Actions or a Windows machine.

### Q: Will the app work on Mac?
**A:** Yes! Run `npm run dev` to test on Mac. Build on Windows only for distribution.

### Q: Do I need Windows for development?
**A:** No! Develop on Mac, build for Windows later.

### Q: Is GitHub Actions free?
**A:** Yes! 2,000 minutes/month free for public repos.

### Q: How long does GitHub Actions take?
**A:** 15-20 minutes per build.

### Q: Can I test without building?
**A:** Yes! Run `npm run dev` on Mac to test immediately.

---

## ✅ Summary

**Problem:** Mac can't create Windows installers
**Solution:** Build on Windows OR use GitHub Actions
**Status:** Config is fixed, ready to build!

**Next Steps:**
1. ✅ Choose Solution 1 or 2 above
2. ✅ Build Windows installers
3. ✅ Get desktop shortcuts & Start Menu entries automatically
4. ✅ Distribute to users!

---

**The app is ready - just needs to be built on Windows (or via GitHub)!** 🚀

