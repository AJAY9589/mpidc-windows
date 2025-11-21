#!/usr/bin/env python3
"""
Simple script to create a placeholder icon.png file
"""

try:
    from PIL import Image, ImageDraw, ImageFont
    
    # Create a 1024x1024 image with purple gradient
    size = 1024
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Draw a purple rectangle with rounded corners
    draw.rounded_rectangle(
        [(50, 50), (size-50, size-50)],
        radius=150,
        fill=(102, 126, 234, 255)  # Purple color
    )
    
    # Add text "M"
    try:
        font = ImageFont.truetype("/System/Library/Fonts/Helvetica.ttc", 400)
    except:
        font = ImageFont.load_default()
    
    # Draw the text
    text = "M"
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    position = ((size - text_width) // 2, (size - text_height) // 2 - 100)
    draw.text(position, text, fill=(255, 255, 255, 255), font=font)
    
    # Save
    img.save('src-tauri/icons/icon.png', 'PNG')
    print("✅ Created icon.png successfully!")
    print("   File: src-tauri/icons/icon.png")
    print("   Size: 1024x1024")
    print("")
    print("Now run: npm run dev")
    
except ImportError:
    print("❌ PIL (Pillow) not installed")
    print("")
    print("Install it with:")
    print("  pip3 install Pillow")
    print("")
    print("Or create icon manually:")
    print("1. Open src-tauri/icons/icon.svg in Preview")
    print("2. File > Export > PNG")
    print("3. Save as: src-tauri/icons/icon.png")
    exit(1)
except Exception as e:
    print(f"❌ Error: {e}")
    exit(1)

