# 🚀 Building Windows Installers Using GitHub Actions

If you don't have access to a Windows machine, you can use **GitHub Actions** to build Windows installers automatically in the cloud!

## ✅ What You'll Get

- ✅ Windows MSI installer (with desktop shortcuts)
- ✅ Windows NSIS installer (with start menu entries)
- ✅ Built automatically on every commit
- ✅ No Windows machine needed!

---

## 🎯 Setup Instructions

### **Step 1: Create GitHub Repository**

```bash
cd /Users/ajay/work/mpidc-touri

# Initialize git if not already done
git init

# Add all files
git add .
git commit -m "Initial commit - MPIDC Tauri App"

# Create repo on GitHub.com, then:
git remote add origin https://github.com/YOUR_USERNAME/mpidc-touri.git
git branch -M main
git push -u origin main
```

### **Step 2: Enable GitHub Actions**

The workflow file is already created at `.github/workflows/build.yml`

1. Go to your GitHub repository
2. Click **Actions** tab
3. GitHub Actions should be enabled automatically

### **Step 3: Trigger Build**

**Option A: Push code**
```bash
git push
```

**Option B: Manual trigger**
1. Go to **Actions** tab on GitHub
2. Click **Build Windows Installer** workflow
3. Click **Run workflow**
4. Wait 10-15 minutes for build

### **Step 4: Download Installers**

After build completes:

1. Go to **Actions** tab
2. Click on the completed workflow run
3. Scroll to **Artifacts** section
4. Download:
   - `NSIS-Installer.zip` ⭐ (Recommended)
   - `MSI-Installer.zip`

---

## 📦 What's Inside

**NSIS-Installer.zip:**
```
MPIDC Invoice System_0.1.0_x64-setup.exe
→ Modern installer with desktop shortcuts ✅
```

**MSI-Installer.zip:**
```
MPIDC Invoice System_0.1.0_x64_en-US.msi
→ Enterprise installer ✅
```

---

## ⏱️ Build Time

- First build: ~15-20 minutes
- Subsequent builds: ~10-15 minutes
- Free tier: 2,000 minutes/month (plenty for this!)

---

## 🔧 Customizing the Build

Edit `.github/workflows/build.yml` to:

- Build on specific branches
- Build on tags/releases
- Add code signing
- Deploy automatically

---

## 🎉 Advantages

✅ **No Windows machine needed** - Builds in the cloud
✅ **Automatic builds** - On every commit
✅ **Free** - GitHub Actions is free for public repos
✅ **Consistent** - Same environment every time
✅ **Easy to share** - Download links from GitHub

---

## 📝 Alternative: Local Windows Build

If you have access to a Windows machine, it's faster:

```powershell
# On Windows
npm install
npm run build

# Installers at:
# src-tauri/target/release/bundle/nsis/
# src-tauri/target/release/bundle/msi/
```

---

## 🆘 Troubleshooting

### Build fails on GitHub Actions

**Check the logs:**
1. Go to Actions tab
2. Click failed workflow
3. Click failed job
4. Expand error step
5. Read error message

**Common issues:**
- Missing icon files → Ensure `src-tauri/icons/` has all required files
- Syntax error in config → Check `tauri.conf.json`
- Dependency issues → Clear cache and retry

### Can't push to GitHub

```bash
# Make sure you have git credentials set up
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Use personal access token instead of password
# Create one at: github.com/settings/tokens
```

---

## 🎯 Summary

**Problem:** Need Windows installers but only have Mac
**Solution:** Use GitHub Actions to build in the cloud
**Result:** Get Windows installers without Windows machine!

**Steps:**
1. ✅ Push code to GitHub
2. ✅ GitHub Actions builds automatically
3. ✅ Download Windows installers from Artifacts
4. ✅ Share with users!

---

**Already have a Windows machine?** Just build locally - it's faster!

