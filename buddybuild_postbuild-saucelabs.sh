npm install -g protractor
npm install -g wd
npm install wd-bridge

cd platforms/ios/build/emulator/

zip -r test_app.zip 'Ionic Conference.app'

curl -u $SAUCE_USERNAME:$SAUCE_KEY -X POST -H "Content-Type: application/octet-stream" https://saucelabs.com/rest/v1/storage/$SAUCE_USERNAME/test.zip?overwrite=true --data-binary @test_app.zip

cd ../../../../

protractor protractor.config.js

# save results from protractor in projectDir/$BUDDYBUILD_TEST_OUTPUT
