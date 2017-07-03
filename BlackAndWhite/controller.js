// external lib
var Jimp = require("jimp");


// https://www.codementor.io/isaib.cicourel/image-manipulation-in-python-du1089j1u
function grayScale( r, g, b ){
	return (r + g + b) / 3
}

function grayScaleNew( r, g, b ){
	return (0.299 * r) + ( 0.587 * g) + ( 0.114 * b)
}


function makeBlackAndWhite( srcFile, rstFile, cutoff, defaultBackgroundColor ){

	var handler = Jimp.read( srcFile )
	
	handler.then( function ( image ) {

		console.log( "* Source Image is ready: " + srcFile )
	
		new Jimp( image.bitmap.width, image.bitmap.height, defaultBackgroundColor, function (err, newimage) {
	
			var _newthis = this
	
			image.scan(0, 0, image.bitmap.width, image.bitmap.height, function(x, y, idx){
	
				var rgb = {
					"red": this.bitmap.data[ idx + 0 ],
			    	"green": this.bitmap.data[ idx + 1 ],
			    	"blue": this.bitmap.data[ idx + 2 ],
			    	"alpha": this.bitmap.data[ idx + 3 ]
				}
	
				var gray = grayScaleNew( rgb.red, rgb.green, rgb.blue )

				if ( gray < cutoff ){ 							// black [0, 0, 0]
					/*
					_newthis.bitmap.data[ idx + 0 ] = 0;
					_newthis.bitmap.data[ idx + 1 ] = 0;
					_newthis.bitmap.data[ idx + 2 ] = 0;
					_newthis.bitmap.data[ idx + 3 ] = rgb.alpha;
					*/
					
					_newthis.bitmap.data[ idx + 0 ] = gray;
					_newthis.bitmap.data[ idx + 1 ] = gray;
					_newthis.bitmap.data[ idx + 2 ] = gray;
					_newthis.bitmap.data[ idx + 3 ] = rgb.alpha;
				}
	
			})
	
			newimage.write( rstFile )
			
			console.info( "* New image created: " + rstFile + "\n")
			
		});
	
	});
	
	handler.catch(function (err) {
		console.log( "--- Can not read source Image!!! ---")
	});

}



module.exports = {
    
    "makeBlackAndWhite": makeBlackAndWhite

}




