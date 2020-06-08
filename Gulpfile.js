var gulp = require('gulp');
var haml = require('gulp-haml');
var sass = require('gulp-sass');
var coffee = require('gulp-coffee');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');
var imagemin = require('gulp-imagemin');

gulp.task('haml', function () {
  return gulp.src('./*.haml')
    .pipe(haml())
    .pipe(gulp.dest('./'));
});

gulp.task('styles', function() {
  return gulp.src('src/assets/sass/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./public/assets/css/'));
});

gulp.task('images', function() {
  return gulp.src('src/assets/images/*')
    .pipe(imagemin())
    .pipe(gulp.dest('./public/assets/images/'));
});

gulp.task('coffee', function() {
  return gulp.src('src/assets/js/*.coffee')
    .pipe(coffee({bare: true}))
    .pipe(uglify())
    .pipe(gulp.dest('./public/assets/js/'));
});

//Watch task
gulp.task('default', function() {
  gulp.watch('./src/assets/sass/*.scss', gulp.series('styles'));
  gulp.watch('./*.haml', gulp.series('haml'));
  gulp.watch('./src/assets/js/*.coffee', gulp.series('coffee'));
});
