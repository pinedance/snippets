#!/bin/bash

# outcome 하위 폴더 단위로 묶는다.

OUTPUT=zip/

if [ ! -d $OUTPUT ]
then
    mkdir $OUTPUT
fi


for i in outcome/*/
do
    [ -d "$i" ] && zip -r "${OUTPUT}${i%/}.zip" "$i"
done

