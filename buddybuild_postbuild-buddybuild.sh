# buddybuild_postbuild.sh
echo '=== Create a build for iOS simulator'
# Depending on your chosen build setup, we might have to rerun xcodebuild to build a simulator build
xcodebuild -derivedDataPath /tmp/sandbox/workspace/platforms/ios  -workspace '$WORKSPACE' -sdk iphonesimulator10.2 -scheme $SCHEME

echo '=== Install appium'
npm install -g appium

echo '=== Install selenium-webdriver'
npm install -g wd

echo '=== Install protractor'
npm install -g protractor

echo '=== Authorize iOS on the computer'
npm install -g authorize-ios
sudo authorize-ios

echo '=== Start appium server'
nohup appium &
sleep 5

cd /private/tmp/sandbox/workspace/
npm install wd
npm install wd-bridge
npm install protractor

echo '=== Start protractor tests'
protractor /private/tmp/sandbox/workspace/protractor-config-ios.js # change this to the location of your protractor config
status=$?
pkill -f appium
if [ $status -ne 0 ]; then
echo 'TESTS FAILED'
fi
