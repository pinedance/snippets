#!/bin/bash

# splitDir.sj no01 => no01로 시작하는 파일을 no01폴더를 만들어 이동시킨다.

OUTPUT=outcome

if [ ! -d $1 ]
then
    mkdir $OUTPUT$1
fi

mv files/nlbook\($1\)*.png $OUTPUT$1 

