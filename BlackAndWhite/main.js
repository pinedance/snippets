// core lib
var fs = require('fs');
// var path = require('path');

// user data
var conf = require("./config");
var ctrl = require("./controller");


// excute main
var files = fs.readdirSync( conf.sourcePath ) 

var cutoff = ( process.argv[2] )? Number( process.argv[2] ) : conf.blackCutoff

console.log( "\n# Process is ready to start. (cutoff value: " + cutoff.toString()  + ")\n" )

var now = new Date().toISOString()

var _rstPath = [conf.resultPath, now + "_" + cutoff].join("/")

fs.mkdirSync( _rstPath  )

files.forEach(function(e, i, arr){
	
	var src_file = [conf.sourcePath, e].join("/")
	var rst_file = [_rstPath, e].join("/")
	
	ctrl.makeBlackAndWhite( src_file, rst_file, cutoff, conf.backgroundColor )
})

