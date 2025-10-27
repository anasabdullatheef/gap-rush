#!/bin/bash

# A script to automate the setup and running of the Gap Rush game on iOS.
# This script must be run on a macOS machine.

set -e # Exit immediately if a command exits with a non-zero status.

# --- Helper Functions ---
function print_info {
    echo " "
    echo "▶ $1"
    echo "-------------------------------------"
}

function print_success {
    echo "✅ $1"
}

function print_error {
    echo "❌ ERROR: $1" >&2
    exit 1
}

# --- Environment Verification ---
print_info "Verifying Operating System"
if [[ "$(uname)" != "Darwin" ]]; then
    print_error "This script is designed for macOS only. Please run it on a Mac."
fi
print_success "macOS detected."

print_info "Checking for Xcode Command Line Tools"
if ! xcode-select -p &>/dev/null; then
    echo "Xcode Command Line Tools are not installed."
    echo "Please install Xcode from the Mac App Store, open it once to accept the license,"
    echo "and then run this script again."
    exit 1
fi
print_success "Xcode Command Line Tools found."

print_info "Checking for Homebrew"
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. It is required to install Flutter."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
print_success "Homebrew is installed."

# --- Flutter Setup ---
print_info "Checking for Flutter"
if ! command -v flutter &>/dev/null; then
    echo "Flutter is not found. Installing via Homebrew..."
    brew install --cask flutter
    echo "Flutter has been installed. You may need to add it to your PATH for future manual use."
    echo 'For now, this script will configure it temporarily.'
fi
# Add flutter to the path for this script's session
export PATH="$PATH":"$(brew --prefix)/flutter/bin"
print_success "Flutter is available."

print_info "Validating Flutter installation (flutter doctor)"
flutter doctor
print_success "Flutter doctor check complete. Review any warnings above, but the script will attempt to proceed."

# --- Project Setup & Run ---
print_info "Generating native project files"
flutter create .
print_success "iOS project files generated."

print_info "Installing project dependencies"
flutter pub get
print_success "Dependencies installed."

print_info "Opening iOS Simulator"
open -a Simulator
# Give the simulator a moment to boot
sleep 5
print_success "Simulator launched."

print_info "Building and running the app"
echo "This may take a few minutes..."
flutter run

print_info "All done! Gap Rush should be running on your iOS Simulator."
