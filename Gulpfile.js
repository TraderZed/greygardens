var gulp = require('gulp');
var haml = require('gulp-haml');
var sass = require('gulp-sass');

gulp.task('haml', function () {
  gulp.src('./*.haml')
    .pipe(haml())
    .pipe(gulp.dest('./'));
});

gulp.task('styles', function() {
  gulp.src('assets/sass/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('./assets/css/'));
});

//Watch task
gulp.task('default', function() {
  gulp.watch('./assets/sass/*.scss',['styles']);
  gulp.watch('./*.haml',['haml']);
});
