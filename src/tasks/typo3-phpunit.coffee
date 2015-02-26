###
grunt-typo3-phpunit

Copyright (c) 2015 Andreas Lappe
http://zimmer7.com
Licensed under the BSD license.
###

module.exports = (grunt) ->
  phpunit = (require './lib/typo3-phpunit').init grunt

  grunt.registerMultiTask 'typo3-phpunit', 'Run the included phpunit', ->
    phpunit.setup @
    phpunit.run()
