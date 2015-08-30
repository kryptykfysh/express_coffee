gulp        = require 'gulp'
gutil       = require 'gulp-util'
gls         = require 'gulp-live-server'
sourcemaps  = require 'gulp-sourcemaps'
coffee      = require 'gulp-coffee'

coffee_watcher  = gulp.watch 'src/**/*.coffee', ['compile:coffee']

gulp.task 'compile:all', ['compile:jade', 'compile:coffee'], ->
  console.log 'Compiling all assets.'

gulp.task 'compile:jade', ->
  locals = {}
  console.log 'compile:jade called.'
  gulp.src('./src/**/*.jade')
    # .pipe(jade({ locals: locals }))
    .pipe(gulp.dest('./dist/'))

gulp.task 'compile:coffee', ->
  console.log 'Compile:coffee called.'
  gulp.src('./src/**/*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee({ bare: true }).on('error', gutil.log))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('./dist/'))

gulp.task 'serve', ['compile:all'], ->
  server = gls.new(['--harmony', './dist/app.js'])
  server.start()

gulp.task 'default', ->
  console.log 'Default task run.'
