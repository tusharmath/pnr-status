config = 
	release:
		options: {}

module.exports = (grunt) ->
	grunt.initConfig config
	grunt.loadNpmTasks 'grunt-release'