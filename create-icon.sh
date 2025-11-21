#!/bin/bash

echo "Creating icon.png from SVG..."

cd src-tauri/icons

# Try different methods to convert SVG to PNG
if command -v rsvg-convert &> /dev/null; then
    echo "Using rsvg-convert..."
    rsvg-convert -w 1024 -h 1024 icon.svg -o icon.png
    echo "✓ Created icon.png"
elif command -v convert &> /dev/null; then
    echo "Using ImageMagick convert..."
    convert -background none -size 1024x1024 icon.svg icon.png
    echo "✓ Created icon.png"
elif command -v qlmanage &> /dev/null; then
    echo "Using macOS qlmanage..."
    qlmanage -t -s 1024 -o . icon.svg 2>/dev/null
    if [ -f "icon.svg.png" ]; then
        mv icon.svg.png icon.png
        echo "✓ Created icon.png"
    else
        echo "❌ qlmanage failed"
    fi
else
    echo "No conversion tool found."
    echo ""
    echo "Creating a simple 1024x1024 purple gradient PNG as placeholder..."
    
    # Create a base64 encoded 1x1 purple PNG, then we'll scale it
    # For now, let's just tell the user what to do
    echo ""
    echo "Please do ONE of these:"
    echo ""
    echo "Option 1: Install ImageMagick"
    echo "  brew install imagemagick"
    echo "  Then run this script again"
    echo ""
    echo "Option 2: Manual conversion"
    echo "  1. Open icon.svg in Preview (double-click it)"
    echo "  2. File > Export"
    echo "  3. Format: PNG"
    echo "  4. Save as: icon.png in this directory"
    echo ""
    echo "Option 3: Online converter"
    echo "  1. Go to: https://svgtopng.com/"
    echo "  2. Upload src-tauri/icons/icon.svg"
    echo "  3. Download the PNG"
    echo "  4. Save as: src-tauri/icons/icon.png"
    echo ""
    exit 1
fi

# Check if icon.png was created
if [ -f "icon.png" ]; then
    echo ""
    echo "✅ SUCCESS! icon.png created"
    echo ""
    ls -lh icon.png
    echo ""
    echo "Now run: npm run dev"
else
    echo ""
    echo "❌ Failed to create icon.png"
    echo ""
    echo "Please create it manually:"
    echo "1. Open icon.svg in any image editor"
    echo "2. Export as PNG (1024x1024 recommended)"
    echo "3. Save as src-tauri/icons/icon.png"
fi

