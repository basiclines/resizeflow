#!/bin/bash

#Resizes all source images in to 3 different resolutions, we assume xhdpi source files (for scaling down benefits)
#The Script automatically moves the source files in to a xhdpi folder and create new hdpi/mdpi/ldpi folders, be careful it will replace that folders
#Filenames must not contain whitespaces and it must has .png extension
#Is highly reccomended to apply imageOptim on to the source files

# folder=$1
# echo "$folder"

function createFolders {
	echo "Creating destination folders"
	mkdir ldpi
	mkdir mdpi
	mkdir hdpi
	mkdir xhdpi
}


function createAssets {
	FILES=`pwd`/*.png
	echo "Creating assets..."
	for f in $FILES
	do
		image=$(basename "$f")
		echo "Exporting:" $image "=>" `pwd`/"hdpi"/$image
		convert -resize 75% $f `pwd`/"hdpi"/$image

		echo "Exporting:" $image "=>" `pwd`/"mdpi"/$image
		convert -resize 50% $f `pwd`/"mdpi"/$image

		echo "Exporting:" $image "=>" `pwd`/"ldpi"/$image
		convert -resize 37.5% $f `pwd`/"ldpi"/$image

		echo "Moving:" $image "=>" `pwd`/"xhdpi"/$image
		mv `pwd`"/"$image `pwd`/xhdpi/$image
	done
	echo "Finished"
}


# Open all the files from source folder in to imageOptim
# Future implementation how to pass --optimize parameteers
function optimize {
	echo "Optimizing images"
	open -b net.pornel.ImageOptim "xhdpi" "hdpi" "mdpi" "ldpi"
}

createFolders
createAssets
# optimize
