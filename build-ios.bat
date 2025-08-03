@echo off
echo 🚀 Starting iOS Production Build...

REM Check if EAS CLI is installed
eas --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ EAS CLI not found. Installing...
    npm install -g eas-cli
)

REM Login to Expo (if not already logged in)
echo 🔐 Checking Expo login status...
eas whoami >nul 2>&1
if %errorlevel% neq 0 (
    echo 🔑 Please login to Expo...
    eas login
)

REM Build iOS production (interactive mode for first time)
echo 📱 Building iOS production app...
echo ⚠️ Running in interactive mode to handle credentials...
eas build --platform ios --profile production

echo ✅ iOS production build completed!
echo 📦 You can download the .ipa file from the EAS dashboard
pause 