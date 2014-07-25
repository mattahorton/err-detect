/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.
// 

app.import('vendor/bootstrap/dist/js/bootstrap.js');
app.import('vendor/bootstrap/dist/css/bootstrap.css');

app.import('vendor/firebase/firebase.js');
app.import('vendor/emberfire/dist/emberfire.js');

app.import('vendor/raphael/raphael.js');
app.import('vendor/vexflow/build/vexflow/vexflow-min.js');

app.import('vendor/Velocity.js/jquery.velocity.min.js');
app.import('vendor/Velocity.js/velocity.ui.min.js');

app.import('vendor/twix/bin/twix.min.js');
app.import('vendor/twix/bin/lang.min.js');

app.import('vendor/ember-list-view/index.js');

app.import('vendor/moment/moment.js');

app.import('vendor/fontawesome/css/font-awesome.min.css');
app.import('vendor/fontawesome/fonts/fontawesome-webfont.ttf');

app.import('vendor/emberui/dist/named-amd/emberui.js', {
  exports: {
    'emberui': ['default']
  }
});
app.import('vendor/emberui/dist/emberui.css');
app.import('vendor/emberui/dist/default-theme.css');

module.exports = app.toTree();
