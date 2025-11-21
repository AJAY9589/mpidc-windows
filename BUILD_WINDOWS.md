# Building for Windows

This guide will help you build the MPIDC Invoice System desktop app for Windows.

## Prerequisites for Windows Build

### 1. Install Rust

Open PowerShell and run:

```powershell
# Download and install Rust
Invoke-WebRequest -Uri https://win.rustup.rs/x86_64 -OutFile rustup-init.exe
.\rustup-init.exe
```

After installation, restart your terminal and verify:

```powershell
rustc --version
cargo --version
```

### 2. Install Visual Studio Build Tools

You need the Microsoft C++ build tools. Install via:

**Option A: Using winget (Windows 10/11)**

```powershell
# Run as Administrator
winget install Microsoft.VisualStudio.2022.BuildTools
```

**Option B: Manual Download**

Download from: https://visualstudio.microsoft.com/downloads/

During installation, select:
- Desktop development with C++
- Windows 10/11 SDK

### 3. Install Node.js

Download and install from: https://nodejs.org/

Choose the LTS version. Verify installation:

```powershell
node --version
npm --version
```

### 4. WebView2 Runtime

Windows 10/11 usually have this pre-installed. If not, download from:
https://developer.microsoft.com/en-us/microsoft-edge/webview2/

## Build Steps

### Step 1: Install Dependencies

```bash
cd mpidc-touri
npm install
```

### Step 2: Build the Application

```bash
npm run build
```

This process will:
1. Build the frontend assets
2. Compile the Rust backend
3. Create the Windows executable
4. Generate installer packages

### Step 3: Locate Your Built Application

After a successful build, you'll find:

**Executable:**
```
src-tauri\target\release\mpidc-touri.exe
```

**Installers:**
```
src-tauri\target\release\bundle\msi\mpidc-touri_0.1.0_x64_en-US.msi
src-tauri\target\release\bundle\nsis\mpidc-touri_0.1.0_x64-setup.exe
```

## Build Configurations

### Release Build (Optimized)

```bash
npm run build
```

This creates an optimized, smaller executable suitable for distribution.

### Debug Build

```bash
cargo build --manifest-path=src-tauri/Cargo.toml
```

Faster compilation but larger file size.

## Installer Types

### MSI Installer (Recommended for Enterprise)
- Professional installation experience
- Can be deployed via Group Policy
- Located in: `src-tauri/target/release/bundle/msi/`

### NSIS Installer (Recommended for End Users)
- Smaller file size
- Modern installation wizard
- Located in: `src-tauri/target/release/bundle/nsis/`

## Distribution

You can distribute any of these:
1. The standalone `.exe` file (no installation required)
2. The `.msi` installer
3. The NSIS `.exe` installer

## Troubleshooting

### Error: "MSVC toolchain not found"

Install Visual Studio Build Tools as described above.

### Error: "WebView2 not found"

Install WebView2 Runtime:
```powershell
winget install Microsoft.EdgeWebView2Runtime
```

### Error: "linker 'link.exe' not found"

Make sure Visual Studio Build Tools are properly installed with C++ tools.

### Build is Very Slow

First build takes longer (10-30 minutes). Subsequent builds are much faster (1-5 minutes).

### Clear Build Cache

If you encounter issues:

```bash
# Remove target directory
rm -rf src-tauri/target

# Rebuild
npm run build
```

## Code Signing (Optional)

For production distribution, you may want to sign your application:

1. Obtain a code signing certificate
2. Configure in `src-tauri/tauri.conf.json`:

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

## File Size

Typical build sizes:
- Executable: ~6-10 MB
- MSI Installer: ~8-12 MB
- NSIS Installer: ~7-11 MB

This is significantly smaller than Electron-based apps (50-150 MB).

## System Requirements

The built application will run on:
- Windows 10 (64-bit)
- Windows 11 (64-bit)
- Requires WebView2 Runtime (usually pre-installed)

## Next Steps

After building:
1. Test the application thoroughly
2. Consider code signing for distribution
3. Create an update mechanism if needed
4. Package with documentation for end users

