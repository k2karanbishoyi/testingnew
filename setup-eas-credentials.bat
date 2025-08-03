@echo off
echo 🔧 Setting up EAS credentials for iOS builds...

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

REM Set up credentials interactively
echo 🏗️ Setting up iOS credentials...
eas credentials

echo ✅ Credentials setup completed!
echo 📱 Now you can run: npm run build:ios
pause 