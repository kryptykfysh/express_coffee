gulp = require 'gulp'
gutil = require 'gulp-util'
gls = require 'gulp-live-server'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'

coffee_watcher = gulp.watch 'src/**/*.coffee', ['compile:coffee']

gulp.task 'compile:coffee', ->
  console.log 'Compile:coffee called.'
  gulp.src('./src/**/*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee({ bare: true }).on('error', gutil.log))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('./dist/'))

gulp.task 'serve', ['compile:coffee'], ->
  server = gls.new(['--harmony', './dist/app.js'])
  server.start()

gulp.task 'default', ->
  console.log 'Default task run.'
