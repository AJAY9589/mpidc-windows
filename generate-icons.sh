#!/bin/bash

# Script to generate Tauri app icons
# This creates placeholder icons for development

echo "Generating placeholder icons for MPIDC Tauri App..."

cd src-tauri/icons

# Create a simple SVG icon
cat > icon.svg << 'EOF'
<svg width="512" height="512" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#667eea;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#764ba2;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="512" height="512" rx="80" fill="url(#grad)"/>
  <text x="256" y="300" font-family="Arial, sans-serif" font-size="200" font-weight="bold" fill="white" text-anchor="middle">M</text>
  <text x="256" y="400" font-family="Arial, sans-serif" font-size="60" fill="white" text-anchor="middle" opacity="0.9">INVOICE</text>
</svg>
EOF

echo "✓ Created icon.svg"
echo ""
echo "To generate proper icons, you have two options:"
echo ""
echo "1. Use @tauri-apps/cli to generate icons:"
echo "   npm install -g @tauri-apps/cli"
echo "   cd src-tauri"
echo "   cargo tauri icon path/to/your/icon.png"
echo ""
echo "2. Or manually create these files in src-tauri/icons/:"
echo "   - 32x32.png"
echo "   - 128x128.png"
echo "   - 128x128@2x.png"
echo "   - icon.icns (for macOS)"
echo "   - icon.ico (for Windows)"
echo ""
echo "For now, you can use online tools to convert icon.svg to PNG/ICO/ICNS format."

