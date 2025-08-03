const { getDefaultConfig } = require('expo/metro-config');
const path = require('path');

/** @type {import('expo/metro-config').MetroConfig} */
const config = getDefaultConfig(__dirname);

// Add support for additional file extensions
config.resolver.assetExts.push(
  // Adds support for `.db` files for SQLite databases
  'db'
);

// Add alias for @ to project root
config.resolver.alias = {
  '@': path.resolve(__dirname),
};

// Ensure proper resolution of TypeScript files
config.resolver.sourceExts = [
  'js',
  'jsx',
  'json',
  'ts',
  'tsx',
];

// Disable minification for production builds to prevent crashes, as it was in the original config.
config.transformer.minifierEnabled = false;

// Restore transform options from the original config.
config.transformer.getTransformOptions = async () => ({
  transform: {
    experimentalImportSupport: false,
    inlineRequires: false,
  },
});

module.exports = config;
