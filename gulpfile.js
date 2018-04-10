
const   gulp = require('gulp'),
        fs = require('fs'),
        download = require('gulp-download'),
        request = require('request'),
        cheerio = require('cheerio'),
        fsc = require('fs-cheerio'),
        argv = require('yargs').argv,
        gutil = require('gulp-util')
        sass = require('gulp-sass')
        sourcemaps = require('gulp-sourcemaps'),
        autoprefixer = require('gulp-autoprefixer'),
        browserSync = require('browser-sync').create(),
        del = require('del'),
        run = require('gulp-run');

var prodNum = argv.nr;

gulp.task('clean', function() {
    return del.sync(['dist']);
});

gulp.task('get', function() {
    request('https://restcountries.eu/rest/v2/all', function(err,resp,data) {
        if (!err) {
            fs.writeFile( 'src/countriesInfo.json', data, function(err){} );
        } else {
            gutil.log('ERR', err);
        }
    });
});

gulp.task('sass', function() {
    return gulp.src('src/style.scss')
        .pipe(sourcemaps.init())
        .pipe(sass())
        .pipe(sourcemaps.write())
        .pipe(autoprefixer({
            browsers: ['last 3 versions'],
            cascade: false
        }))
        .pipe(gulp.dest('dist'));
});

gulp.task('xml', function() {
    return run('node ./src/generateXml').exec();
});

gulp.task('default', function () {
    gulp.start(
        'sass',
        'xml'
    );
});


gulp.task('watch-sass', ['sass'], function(done){
    browserSync.reload();
    done();
});

gulp.task('watch-xml', ['xml'], function(done){
    browserSync.reload();
    done();
});
    
gulp.task('serve', ['default'], function() {
    browserSync.init({
        server: {
            baseDir: 'dist',
            //directory: true
            index: 'countries.xml'
        }
    });

    gulp.watch('src/**/*.scss', ['watch-sass']); 
    gulp.watch('src/generateXml.js', ['watch-xml']); 
});