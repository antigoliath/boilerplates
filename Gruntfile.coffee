module.exports = (grunt) ->
  grunt.initConfig
    watch:
      client:
        files: ['client/**/*.coffee', 'client/**/*.less']
        tasks: 'concurrent:client'
    coffee:
      client:
        expand: true
        cwd: 'client/coffee'
        src: '**/*.coffee'
        dest: 'dist/scripts'
        ext: '.js'
    copy:
      client:
        expand: true
        cwd: 'client/'
        src: ['assets/**/*', 'templates/**/*']
        dest: 'dist/'
    less:
      client:
        expand: true
        cwd: 'client/stylesheets'
        src: '**/*.less'
        dest: 'dist/stylesheets'
        ext: '.css'
    nodemon:
      dev:
        script: 'server/app.coffee'
        options:
          args: []
          nodeArgs: []
          callback: (nodemon) ->
            nodemon.on 'log', (event) ->
              console.log event.colour
          env:
            PORT: 3000
          cwd: __dirname
          ignore: []
          ext: 'coffee, html'
          # dist is created from watch task
          watch: ['./server', './dist/templates']
          delay: 1000
          legacyWatch: true

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-contrib-less'

