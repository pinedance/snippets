#!/bin/bash

# jpg 파을을 정해진 크기로 자른다. 

FILES=split/*
EXTENTION='.jpg'
OUTPUTd=crops/

Row=$((2866 * 4 / 10))
Col=$((4054 * 4 / 10))

if [ ! -d ${OUTPUTd} ]
then
    mkdir ${OUTPUTd}
fi

for f in $FILES
do
    echo "Processing $f file..."
    fBasename=`basename ${f} ${EXTENTION}`

    # https://www.imagemagick.org/Usage/crop/
    convert ${f} -crop 60%x+${Row}+0 +repage ${OUTPUTd}${fBasename}a${EXTENTION}
    convert ${f} -crop 60%x+0+0 +repage ${OUTPUTd}${fBasename}b${EXTENTION}
    convert ${f} -crop 60%x+${Row}+${Col} +repage ${OUTPUTd}${fBasename}c${EXTENTION}
    convert ${f} -crop 60%x+0+${Col} +repage ${OUTPUTd}${fBasename}d${EXTENTION}
    # https://stackoverflow.com/questions/9011233/for-files-in-directory-only-echo-filename-no-path
    
done

