###
grunt-typo3-phpunit

Copyright (c) 2013 Andreas Lappe
http://kaeufli.ch
Licensed under the BSD license.
###

module.exports = (grunt) ->
  phpunit = (require './lib/typo3-phpunit').init grunt

  grunt.registerMultiTask 'typo3-phpunit', 'Run the cli-dispatcher of the TYPO3 extension phpunit', ->
    phpunit.setup @
    phpunit.run()
