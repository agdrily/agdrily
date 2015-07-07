path = require 'path'

module.exports = (grunt) ->
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-mocha-test')
  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-codo')

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

    codo: {
      options:
        name: "agdrily"
        title: "agdrily Code Documentation"
        undocumented: yes
        stats: yes
      source:
        src: [
          "src/"
        ]
        dest: "codo/"
    }

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

        npmInstall: {
          command: 'npm install'
        }
    }


  grunt.registerTask 'test', ['mochaTest:test']
  grunt.registerTask 'coverage', ['mochaTest:coverage', 'shell:coveralls']
  grunt.registerTask 'launch', ['shell:launch']
  grunt.registerTask 'install', ['shell:npmInstall', 'codo:source']
