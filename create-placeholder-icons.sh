#!/bin/bash

echo "Creating placeholder icon files..."
echo ""

cd src-tauri/icons

# Check if we have ImageMagick or sips (macOS built-in)
if command -v sips &> /dev/null; then
    echo "Using macOS sips to create PNG icons from SVG..."
    
    # Convert SVG to PNG at different sizes
    qlmanage -t -s 1024 -o . icon.svg 2>/dev/null
    
    if [ -f "icon.svg.png" ]; then
        mv icon.svg.png icon-1024.png
        
        # Create different sizes
        sips -z 32 32 icon-1024.png --out 32x32.png
        sips -z 128 128 icon-1024.png --out 128x128.png
        sips -z 256 256 icon-1024.png --out 128x128@2x.png
        sips -z 512 512 icon-1024.png --out icon-512.png
        
        # Create ICO for Windows (just copy 512 for now)
        cp icon-512.png icon.ico.png
        
        echo "✓ Created PNG icons"
        echo ""
        echo "Note: For production, you should generate proper .ico and .icns files"
        echo "Run: npx @tauri-apps/cli icon icon-1024.png"
        echo ""
    else
        echo "⚠️  Could not convert SVG automatically"
        echo ""
        echo "Please run this command to generate proper icons:"
        echo ""
        echo "  npx @tauri-apps/cli icon src-tauri/icons/icon.svg"
        echo ""
        echo "Or convert icon.svg to PNG manually and then run:"
        echo "  npx @tauri-apps/cli icon path/to/icon.png"
        echo ""
    fi
else
    echo "⚠️  ImageMagick or conversion tool not found"
    echo ""
    echo "To generate icons, run:"
    echo ""
    echo "  npx @tauri-apps/cli icon src-tauri/icons/icon.svg"
    echo ""
    echo "This will generate all required icon formats automatically."
    echo ""
fi

echo "Current icons directory:"
ls -lh
echo ""

