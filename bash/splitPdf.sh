#!/bin/bash

# pdf 파일을 jpg 파을로 나누어 split 폴더 아래로 넣는다.

# convert src.pdf split/%03d.jpg
# https://superuser.com/questions/633698/convert-pdf-to-jpg-images-with-imagemagick-how-to-0-pad-file-names

# convert -density 300 src.pdf -quality 100 split/%03d.jpg
# https://stackoverflow.com/questions/6605006/convert-pdf-to-image-with-high-resolution

# http://www.binarytides.com/convert-pdf-image-imagemagick-commandline/


# test결과 -density 400, -quality 100 이 적합

outcome=split/

if [ ! -d ${outcome} ]
then
    mkdir ${outcome}
fi

convert -density 400 src.pdf -quality 100 ${outcome}/%03d.jpg
