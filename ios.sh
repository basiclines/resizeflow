#!/bin/bash

#Export all @2x.png images to 50% and renames them
#Filenames must not contain whitespaces and it must has .png extension
#Is highly reccomended to apply imageOptim on to the source files

# folder=$1
# echo "$folder"

function createAssets {
	FILES=`pwd`/*"@2x.png"
	echo "Creating assets..."
	for f in $FILES
	do
		image=$(basename "$f")
		# echo "Exporting:"  "${image/@2x/}"
		echo "Exporting:" $image "=>" "${image/@2x/}"
		convert -resize 50% $f `pwd`/"${image/@2x/}"
	done

	echo "Finished"
}


#Open all the files from source folder in to imageOptim
# To see in the future how to pass --optimize parameteers
function optimize {
	echo "launching ImageOptim"
	open -b net.pornel.ImageOptim "xhdpi" "hdpi" "mdpi" "ldpi"
}


createAssets
# optimize
