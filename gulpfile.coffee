gulp = require 'gulp'
gutil = require 'gulp-util'
sourcemaps = require 'gulp-sourcemaps'
coffee = require 'gulp-coffee'

gulp.task 'compile:coffee', ->
  console.log 'Compile:coffee called.'
  gulp.src('./src/*.coffee')
    .pipe(sourcemaps.init())
    .pipe(coffee({ bare: true }).on('error', gutil.log))
    .pipe(sourcemaps.write('./maps'))
    .pipe(gulp.dest('./dist/'))

gulp.task 'default', ->
  console.log 'Default task run.'
