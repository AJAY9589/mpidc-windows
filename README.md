# MPIDC Invoice System - Desktop App

A cross-platform desktop application for the MPIDC Invoice Management System built with Tauri.

## Features

- 🌐 Loads the MPIDC Invoice System web interface
- ✅ Internet connectivity check on startup
- 🔄 Retry mechanism for offline scenarios
- 🪟 Native Windows application
- 🔒 Secure and lightweight

## Prerequisites

Before building the app, ensure you have the following installed:

1. **Node.js** (v16 or higher) - [Download](https://nodejs.org/)
2. **Rust** - Install via rustup:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
3. **Tauri Prerequisites** for Windows:
   - Microsoft Visual Studio C++ Build Tools
   - WebView2 (usually pre-installed on Windows 10/11)

   Install via PowerShell (as Administrator):
   ```powershell
   winget install Microsoft.VisualStudio.2022.BuildTools
   ```

## Installation

1. Clone or download this repository
2. Install dependencies:
   ```bash
   npm install
   ```

## Development

Run the app in development mode:

```bash
npm run dev
```

This will start the development server and open the app.

## Building for Windows

To create a Windows executable:

```bash
npm run build
```

The built application will be available in:
- `src-tauri/target/release/mpidc-touri.exe` - Executable
- `src-tauri/target/release/bundle/` - Installer packages (MSI, NSIS)

## How It Works

1. **Internet Check**: On startup, the app checks internet connectivity by attempting to reach Google, Cloudflare, and the MPIDC server
2. **Loading State**: Shows a loading spinner while checking connectivity
3. **Error Handling**: If no internet is detected, displays a user-friendly error message with a retry button
4. **WebView**: Once internet is confirmed, loads the MPIDC Invoice System in an embedded webview

## Configuration

The MPIDC URL is configured in `main.js`:

```javascript
const MPIDC_URL = 'https://mpidc-invoice-system.vercel.app/login';
```

## Default Login Credentials

- **Username**: admin
- **Password**: Admin@123

⚠️ Change the password after first login

## Technical Stack

- **Frontend**: HTML, CSS, JavaScript
- **Framework**: Tauri 2.0
- **Backend**: Rust
- **Webview**: System native webview
- **Build Tool**: Vite

## Troubleshooting

### "No Internet Connection" Error
- Check your internet connection
- Try the retry button
- Ensure firewall isn't blocking the app

### Build Errors
- Ensure all prerequisites are installed
- Run `rustup update` to update Rust
- Clear the target folder: `rm -rf src-tauri/target`

## License

MIT License

