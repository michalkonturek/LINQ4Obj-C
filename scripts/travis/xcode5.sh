#!/bin/sh

XCODE_MAJOR_VERSION=`xcodebuild -version | awk 'NR == 1 {print substr($2,1,1)}'`
if [ "$XCODE_MAJOR_VERSION" -ge "5" ]; then
        echo "Xcode 5 already installed."
        exit 0
fi

echo "Installing Xcode 5."

#uninstall xcode 4
sudo rm -R /Applications/Xcode.app

#install xcode
curl -o xcode5.dmg http://something.com/xcode5.dmg #your URL to Xcode 5 xcode5.dmg file #download installer
hdiutil attach xcode5.dmg #mount
sudo cp -R "/Volumes/Xcode/Xcode.app" /Applications #copy
rm xcode5.dmg #rm installer

#agree to xcode license
sudo -E scripts/travis/accept_license.sh

#print ver
xcodebuild -version -sdk