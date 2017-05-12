exports.config = {
    framework: 'jasmine2',
    onPrepare: function() {
    var jasmineReporters = require('jasmine-reporters');
    jasmine.getEnv().addReporter(new jasmineReporters.JUnitXmlReporter({
        consolidateAll: true,
        savePath: 'testresults',
        filePrefix: 'xmloutput'
    }));
},
  //seleniumAddress: 'http://localhost:4723/wd/hub',
  seleniumAddress: 'http://ondemand.saucelabs.com:80/wd/hub',
  //seleniumAddress: 'https://us1.appium.testobject.com/wd/hub',
  specs: [
    'test/*_spec.js'
  ],

  // Reference: https://github.com/appium/sample-code/blob/master/sample-code/examples/node/helpers/caps.js
  capabilities: {
    browserName: '',
    platformName: 'iOS',
    platformVersion: '10.3',
    testobject_device: '',
    deviceName: 'iPhone Simulator',
    app:'sauce-storage:test.zip'
    //app: '/users/john/testapps/ionic-conference-app/platforms/ios/build/emulator/Ionic Conference.app'
  },

  baseUrl: 'http://localhost:8000',

  onPrepare: function () {
   var wd = require('wd'),
     protractor = require('protractor'),
     wdBridge = require('wd-bridge')(protractor, wd);
   wdBridge.initFromProtractor(exports.config);
 }
}
