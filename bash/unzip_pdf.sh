#!/bin/bash

# unzip_pdf.sh 동의보감.zip   ==> 동의보감.zip을 pdf로 만든다. 

FILENAME=$1;unzip ${FILENAME}.zip -d data;convert data/* ${FILENAME}.pdf;rm -r data