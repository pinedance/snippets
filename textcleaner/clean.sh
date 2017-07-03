# dependency
# require imagemagick
# require textcleaner : http://www.fmwconcepts.com/imagemagick/textcleaner/

# excute example
# ./clean.sh img.zip

_zipname=$1
zipname=${_zipname%.zip}   # zipfile basename without extention

echo "# Task Started"

echo "* made tmp folders" ; mkdir rst 

echo "* unzip image zip file" ; unzip -qd tmp ${zipname}.zip ; 

echo "* start textcleaner"

echo -n "PROCESSING "

for file in ./tmp/* 
do 
    ./textcleaner -g -e stretch -f 25 -o 5 -s 1 ${file} ./rst/${file##*/}
    echo -n "."
done

echo ""
echo "* generate result files"

zip -qr ${zipname}_clean.zip rst
convert ./rst/* ${zipname}_clean.pdf

rm -rf tmp ; rm -rf rst

echo "# Task Ended!"