path = require 'path'

module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-mocha-test')
  grunt.loadNpmTasks('grunt-shell')

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),

    coffee: {
      source: {
        expand: true,
        flatten: false,
        cwd: 'src/',
        src: ['**/*.coffee'],
        dest: 'lib/',
        ext: '.js'
      }
    },

    mochaTest: {
      test: {
        options: {
          reporter: 'spec',
          require: 'coffee-script/register'
        },
        src: ['tests/**/*.coffee']
      }
      coverage: {
        options: {
          reporter: 'mocha-lcov-reporter'
          require: './support/coffee-coverage.js'
          captureFile: 'lcov.txt'
          quiet: true
        },
        src: ['tests/**/*.coffee']
      }
    },

    shell: {
        coveralls: {
          command: "cat ./lcov.txt | #{path.join(__dirname, 'node_modules', '.bin', 'coveralls')}"
        }

        launch: {
          command: 'node server.js'
        }

        runCoverage: {
          command: "#{path.join(__dirname, 'node_modules', '.bin', 'mocha')} --recursive --require ./support/coffee-coverage.js --reporter html-cov \"tests/**/*.coffee\" > coverage.html"
        }
    }


  grunt.registerTask 'test', ['mochaTest:test']
  grunt.registerTask 'testci', ['mochaTest', 'shell:coveralls']
  grunt.registerTask 'launch', ['coffee', 'shell:launch']
