#!/bin/bash
asset_name_pattern="DCS-SimpleRadioStandalone.*\.zip"
# Fetch the latest release including pre-releases
ASSET_URL=$(curl -s https://api.github.com/repos/ciribob/DCS-SimpleRadioStandalone/releases \
  | jq -r '.[0].assets[0].browser_download_url')

# Download the asset
if [ -z "$ASSET_URL" ]; then
  echo "No asset found matching pattern: $asset_name_pattern"
  exit 1
fi
curl -L -o DCS-SimpleRadioStandalone.zip "$ASSET_URL"

# Unzip the Linux Server CLI binary from the downloaded zip
unzip -j DCS-SimpleRadioStandalone.zip 'ServerCommandLine-Linux/SRS-Server-Commandline' -d .

# Clean up the downloaded zip file
rm DCS-SimpleRadioStandalone.zip

# Make the binary executable
chmod +x SRS-Server-Commandline
