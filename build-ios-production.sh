#!/bin/bash

# Build iOS Production Build
echo "🚀 Starting iOS Production Build..."

# Check if EAS CLI is installed
if ! command -v eas &> /dev/null; then
    echo "❌ EAS CLI not found. Installing..."
    npm install -g eas-cli
fi

# Login to Expo (if not already logged in)
echo "🔐 Checking Expo login status..."
eas whoami || eas login

# Build iOS production
echo "📱 Building iOS production app..."
eas build --platform ios --profile production --non-interactive

echo "✅ iOS production build completed!"
echo "📦 You can download the .ipa file from the EAS dashboard" 