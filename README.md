# grunt-typo3-phpunit

> Grunt plugin to run [TYPO3 PHPUnit](http://forge.typo3.org/projects/show/extension-phpunit) in the commandline.

_This plugin is developed for Grunt `0.4.0` and is not tested for backward compatibility with Grunt `0.3.x`._

## Getting Started

1. Install this grunt plugin with the follwing command:

```shell
npm install grunt-typo3-phpunit --save-dev
```

2. [Install TYPO3 Extension](http://forge.typo3.org/projects/show/extension-phpunit)

3. Add this to your project's `Gruntfile.js`:

```js
grunt.loadNpmTasks('grunt-typo3-phpunit');
```

## TYPO3 PHPUnit task

_Run this task with the `grunt typo3-phpunit` command._

_This task is a [multi task][] so any targets, files and options should be specified according to the [multi task][] documentation._

[multi task]: https://github.com/gruntjs/grunt/wiki/Configuring-tasks

### Usage Example

```js
'typo3-phpunit: {
  application: {
	  target: 'typo3conf/ext/news'
	}
	options: {
	  dd: {
		  'log-junit': '/tmp/result.xml'
		}
	}
}
```

### Target Properties

#### target
Type: `String`

The full path to the Extension to test.

### Options
#### environment
Type: `String`
Default: `''`

Any prefix to the command, e.g. environment-variables.

#### cliDispatch
Type: `String`
Default: `'typo3/cli_dispatch.phpsh'`

The path to the TYPO3 CLI Dispatcher.

#### cwd
Type: `String`
Default: `null`

Change the working directory when executing the command. Use this if your Gruntfile is not in your TYPO3 root.

#### phpunitExtension
Type: `String`
Default: `phpunit`

Only change this if you use a fork of phpunit or similar.

#### d
Type: `Object`
Default: `{}`

Configure single-dash commandline-arguments such as -v by adding key-value pairs: `'v':''`.

#### dd
Type: `Object`
Default: `{}`

Configure double-dash commandline-arguments such as --log-junit <file> by adding key-value pairs:
`'log-junit':'<file>'`

#### ignoreExitCode
Type: `Number`
Default: `99`

If PHPUnit doesn't find tests in an extension, it fails but with exit code 99 instead of 1, so you can ignore those errors for your CI-environment.

#### maxBuffer
Type: `Number`
Default: `200*1024`

Override the maxBuffer-Size of nodejs's exec() function if you expect a long output on stdout.
