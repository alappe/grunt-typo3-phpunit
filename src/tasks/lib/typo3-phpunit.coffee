###
grunt-typo3-phpunit

Copyright (c) 2015 Andreas Lappe
http://zimmer7.com
Licensed under the BSD license.
###

path = require 'path'
exec = (require 'child_process').exec

exports.init = (grunt) ->

  exports = config = {}
  cmd = done = null
  defaults =
    environment: ''
    cwd: null
    phpunitExtension: 'typo3_src/bin/phpunit'
    target: ''
    d:
      c: 'typo3/sysext/core/Build/UnitTests.xml'
    dd: {}
    ignoreExitCode: 99
    maxBuffer: 200*1024

  buildCommand = (target) ->
    cmd = "#{config.environment} #{config.phpunitExtension}"
    # Add single-dash options
    cmd += " -#{key} #{value}" for key, value of config.d
    # Add double-dash options
    cmd += " --#{key} #{value}" for key, value of config.dd
    cmd += " #{target}"
    cmd

  exports.setup = (runner) ->
    target = runner.data.target
    config = runner.options defaults
    cmd = buildCommand target
    msg = """
    Starting TYPO3 PHPUnit (target: #{runner.target.cyan}) in #{target.cyan}"
    """
    grunt.log.writeln msg
    grunt.verbose.writeln "Execute: #{cmd}"
    done = runner.async()

  exports.run = ->
    cmdOptions =
      maxBuffer: config.maxBuffer
      cwd: config.cwd
    exec cmd, cmdOptions, (err, stdout, stderr) ->
      grunt.log.write stdout if stdout
      if err
        # e.g. 99 means the extension has no UnitTests… no problem for # me.
        grunt.fatal err if err.code isnt config.ignoreExitCode
      done()

  exports
