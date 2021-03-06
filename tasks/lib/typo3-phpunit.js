// Generated by CoffeeScript 1.9.0

/*
grunt-typo3-phpunit

Copyright (c) 2015 Andreas Lappe
http://zimmer7.com
Licensed under the BSD license.
 */

(function() {
  var exec, path;

  path = require('path');

  exec = (require('child_process')).exec;

  exports.init = function(grunt) {
    var buildCommand, cmd, config, defaults, done, exports;
    exports = config = {};
    cmd = done = null;
    defaults = {
      environment: '',
      cwd: null,
      phpunitExtension: 'typo3_src/bin/phpunit',
      target: '',
      d: {
        c: 'typo3/sysext/core/Build/UnitTests.xml'
      },
      dd: {},
      ignoreExitCode: 99,
      maxBuffer: 200 * 1024
    };
    buildCommand = function(target) {
      var key, value, _ref, _ref1;
      cmd = config.environment + " " + config.phpunitExtension;
      _ref = config.d;
      for (key in _ref) {
        value = _ref[key];
        cmd += " -" + key + " " + value;
      }
      _ref1 = config.dd;
      for (key in _ref1) {
        value = _ref1[key];
        cmd += " --" + key + " " + value;
      }
      cmd += " " + target;
      return cmd;
    };
    exports.setup = function(runner) {
      var msg, target;
      target = runner.data.target;
      config = runner.options(defaults);
      cmd = buildCommand(target);
      msg = "Starting TYPO3 PHPUnit (target: " + runner.target.cyan + ") in " + target.cyan + "\"";
      grunt.log.writeln(msg);
      grunt.verbose.writeln("Execute: " + cmd);
      return done = runner.async();
    };
    exports.run = function() {
      var cmdOptions;
      cmdOptions = {
        maxBuffer: config.maxBuffer,
        cwd: config.cwd
      };
      return exec(cmd, cmdOptions, function(err, stdout, stderr) {
        if (stdout) {
          grunt.log.write(stdout);
        }
        if (err) {
          if (err.code !== config.ignoreExitCode) {
            grunt.fatal(err);
          }
        }
        return done();
      });
    };
    return exports;
  };

}).call(this);
