## USE imagemagick

```
convert yourimage.djvu newimage.pdf
```

```
for d in djvu/*; do convert ${d%.*}.djvu ${d%.*}.pdf ;done
```

## USE ddjvu

`ddjvu` is part of the standard `djvulibre` package

```
ddjvu -format=pdf -quality=85 -verbose a.djvu a.pdf
```

```
for D in djvu/*
do 
	F="${d##*/}"
	B="${F%.*}"
	ddjvu -format=pdf -quality=85 ${D} ${B}.pdf 
	echo "done...${B}.pdf"
done
```

REF

* [How do I convert a DjVu document to PDF in Linux using only command line tools?](https://superuser.com/questions/100572/how-do-i-convert-a-djvu-document-to-pdf-in-linux-using-only-command-line-tools)
* [DDJVU](http://djvu.sourceforge.net/doc/man/ddjvu.html)

## USE djvu2pdf_0.9.2-1_all.deb

```
for dj in djvu/*; do djvu2pdf ${dj}; done
```

REF
* [djvu2pdf](https://0x2a.at/site/projects/djvu2pdf/)
