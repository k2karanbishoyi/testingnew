# Build iOS Production Build
Write-Host "🚀 Starting iOS Production Build..." -ForegroundColor Green

# Check if EAS CLI is installed
try {
    eas --version | Out-Null
    Write-Host "✅ EAS CLI found" -ForegroundColor Green
} catch {
    Write-Host "❌ EAS CLI not found. Installing..." -ForegroundColor Yellow
    npm install -g eas-cli
}

# Login to Expo (if not already logged in)
Write-Host "🔐 Checking Expo login status..." -ForegroundColor Cyan
try {
    eas whoami | Out-Null
    Write-Host "✅ Already logged in to Expo" -ForegroundColor Green
} catch {
    Write-Host "🔑 Please login to Expo..." -ForegroundColor Yellow
    eas login
}

# Build iOS production
Write-Host "📱 Building iOS production app..." -ForegroundColor Cyan
eas build --platform ios --profile production --non-interactive

Write-Host "✅ iOS production build completed!" -ForegroundColor Green
Write-Host "📦 You can download the .ipa file from the EAS dashboard" -ForegroundColor Cyan 