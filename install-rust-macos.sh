#!/bin/bash

echo "================================================"
echo "  Installing Rust for Tauri Development"
echo "================================================"
echo ""

# Check if Rust is already installed
if command -v cargo &> /dev/null; then
    echo "✓ Rust is already installed!"
    cargo --version
    rustc --version
    echo ""
    echo "You're ready to run: npm run dev"
    exit 0
fi

echo "Installing Rust..."
echo ""

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source cargo environment
source $HOME/.cargo/env

echo ""
echo "================================================"
echo "  ✓ Rust Installation Complete!"
echo "================================================"
echo ""

# Verify installation
if command -v cargo &> /dev/null; then
    echo "✓ Cargo version: $(cargo --version)"
    echo "✓ Rustc version: $(rustc --version)"
    echo ""
    echo "================================================"
    echo "  Next Steps:"
    echo "================================================"
    echo ""
    echo "1. Close this terminal and open a NEW terminal"
    echo "   (Or run: source ~/.cargo/env)"
    echo ""
    echo "2. Run: cd $(pwd)"
    echo ""
    echo "3. Run: npm run dev"
    echo ""
    echo "The first run will take 5-10 minutes to compile."
    echo "Subsequent runs will be much faster!"
    echo ""
else
    echo "❌ Installation failed. Please install manually:"
    echo ""
    echo "Run this command:"
    echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    echo ""
    exit 1
fi

