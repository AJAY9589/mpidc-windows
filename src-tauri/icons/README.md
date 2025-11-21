# App Icons

This directory should contain the application icons in various formats.

## Required Files

For Windows builds, you need:
- `32x32.png` - Small icon
- `128x128.png` - Medium icon
- `128x128@2x.png` - High-DPI medium icon
- `icon.ico` - Windows icon file (multi-resolution)
- `icon.icns` - macOS icon file (optional for Windows builds)

## Generating Icons

### Option 1: Using Tauri CLI (Recommended)

If you have a source PNG image (1024x1024 or larger recommended):

```bash
npm install -g @tauri-apps/cli
cd src-tauri
cargo tauri icon ../path/to/your/icon.png
```

This will automatically generate all required icon formats.

### Option 2: Using Online Tools

You can use these online tools to convert your image:

1. **PNG to ICO**: https://convertio.co/png-ico/
   - Upload your PNG
   - Download as .ico
   - Place in this directory as `icon.ico`

2. **PNG to ICNS**: https://cloudconvert.com/png-to-icns
   - Upload your PNG
   - Download as .icns
   - Place in this directory as `icon.icns`

3. **Resize PNG**: https://www.iloveimg.com/resize-image
   - Create 32x32, 128x128, and 256x256 versions

### Option 3: Placeholder Icons

For development/testing, you can use placeholder icons. The build process will work with any valid icon files, even simple colored squares.

## Design Guidelines

- Use a square source image (1:1 aspect ratio)
- Minimum recommended size: 1024x1024 pixels
- Use simple, bold designs that scale well
- Ensure good contrast for visibility at small sizes
- PNG format with transparent background works best

## Current Status

⚠️ **Action Required**: Please generate and add icon files to this directory before building for production.

For development builds, you can use the included `icon.svg` as a reference and convert it to the required formats.

