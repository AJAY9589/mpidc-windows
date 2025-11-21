# 🚀 RUN THIS FIRST - Setup Instructions

You're getting the `cargo not found` error because **Rust is not installed**.

## ✅ Step-by-Step Setup (5 Minutes)

### **Step 1: Install Rust** (Required!)

Run this script I created for you:

```bash
./install-rust-macos.sh
```

**OR** install manually:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Press **Enter** to accept defaults.

### **Step 2: Load Rust Environment**

After installation, run:

```bash
source $HOME/.cargo/env
```

**OR** close and reopen your terminal.

### **Step 3: Verify Installation**

```bash
cargo --version
```

You should see: `cargo 1.x.x`

If you see this, Rust is installed! ✓

### **Step 4: Run the App**

```bash
npm run dev
```

⏱️ **First run takes 5-10 minutes** (compiles Rust dependencies)

---

## 🎨 About Icons

I've removed the icon requirement temporarily so the app will run. 

### To Add Custom Icons Later:

**Option 1: Auto-generate from SVG** (Easiest)

```bash
npx @tauri-apps/cli icon src-tauri/icons/icon.svg
```

**Option 2: From your own logo**

```bash
npx @tauri-apps/cli icon path/to/your/logo.png
```

This generates all required formats (ICO, ICNS, PNG).

---

## 📋 Full Setup Commands (Copy & Paste)

```bash
# 1. Install Rust
./install-rust-macos.sh

# 2. Load Rust
source $HOME/.cargo/env

# 3. Verify
cargo --version

# 4. Run the app
npm run dev
```

---

## 🆘 Troubleshooting

### Still getting "cargo not found"?

```bash
# Make sure Rust is in your PATH
echo $PATH | grep cargo

# If not found, add it:
source $HOME/.cargo/env

# Or restart your terminal
```

### "Command not found: ./install-rust-macos.sh"?

```bash
# Make it executable
chmod +x install-rust-macos.sh

# Then run it
./install-rust-macos.sh
```

### "Need command line developer tools"?

```bash
xcode-select --install
```

Click "Install" in the popup.

---

## ⏱️ What to Expect

1. **Installing Rust**: 2-3 minutes
2. **First `npm run dev`**: 5-10 minutes (compiles everything)
3. **Subsequent runs**: 30 seconds - 2 minutes
4. **A window will open** with your app

---

## ✅ Success!

When you see:

```
✓ Built in XXXms
```

And a window opens - **you're done!** 🎉

The app will:
1. Check internet connection
2. If online → Load MPIDC Invoice System
3. If offline → Show error with retry button

---

## 📌 Summary

**Problem:** Cargo/Rust not installed
**Solution:** Run `./install-rust-macos.sh`
**Then:** Run `npm run dev`

---

**Need help? Read START_HERE.md for more details!**

