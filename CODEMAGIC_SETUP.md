# Codemagic iOS Build Setup

This guide explains how to set up Codemagic for iOS builds of your Expo React Native app.

## Prerequisites

1. **Apple Developer Account** with iOS App Store Connect access
2. **Expo Account** with EAS access
3. **Codemagic Account** (free tier available)

## Setup Steps

### 1. Get Your Expo Token

```bash
# Install EAS CLI
npm install -g eas-cli

# Login to Expo
eas login

# Get your token
eas whoami
```

### 2. Configure Codemagic

1. Go to [Codemagic](https://codemagic.io) and create an account
2. Connect your GitHub repository
3. Add the following environment variables in Codemagic:
   - `EXPO_TOKEN`: Your Expo token from step 1
   - `APP_STORE_CONNECT_ISSUER_ID`: Your Apple App Store Connect Issuer ID
   - `APP_STORE_CONNECT_API_KEY_ID`: Your Apple App Store Connect API Key ID
   - `APP_STORE_CONNECT_API_KEY`: Your Apple App Store Connect API Key

### 3. Apple App Store Connect Setup

1. Go to [App Store Connect](https://appstoreconnect.apple.com)
2. Navigate to Users and Access > Keys
3. Create a new API key with App Manager role
4. Note down the Issuer ID, Key ID, and download the .p8 file
5. In Codemagic, add the API key content as `APP_STORE_CONNECT_API_KEY`

### 4. Configure Your Bundle ID

Update the `BUNDLE_ID` in `codemagic.yaml` to match your app's bundle identifier:
```yaml
BUNDLE_ID: "com.remove.help"
```

### 5. Update Team ID

Replace `YOUR_TEAM_ID` in `exportOptions.plist` with your actual Apple Developer Team ID.

## Build Configuration

### Option 1: EAS Build (Recommended)
Uses `codemagic.yaml` - This leverages EAS for building:

```bash
# Trigger build manually
eas build --platform ios --profile preview
```

### Option 2: Native iOS Build
Uses `codemagic-expo.yaml` - This builds natively:

```bash
# Prebuild the iOS project
npx expo prebuild --platform ios --clean
```

## Build Profiles

- **preview**: Internal distribution build (for testing)
- **production**: Production build (no App Store submission)

## Artifacts

After successful builds, you'll get:
- `.ipa` file for iOS distribution
- Build logs for debugging

## Troubleshooting

### Common Issues:

1. **Code Signing Errors**: Ensure your Apple Developer account has the correct certificates and provisioning profiles
2. **Bundle ID Mismatch**: Verify the bundle ID matches in all configuration files
3. **Expo Token Issues**: Regenerate your Expo token if builds fail

### Getting Help:

- [Codemagic Documentation](https://docs.codemagic.io/)
- [Expo EAS Documentation](https://docs.expo.dev/build/introduction/)
- [Apple Developer Documentation](https://developer.apple.com/documentation/)

## Security Notes

- Never commit API keys or tokens to your repository
- Use Codemagic's environment variables for sensitive data
- Regularly rotate your Expo and Apple API tokens 