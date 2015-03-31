#!/bin/bash
if [ -z "$1" ]
 then
	echo "No file supplied"
exit 1
fi
rm -R slides;
mkdir slides;
touch slides/index.html;

pdfseparate  $1 slides/slide%d.pdf;
SLIDES=slides/*.pdf;
suffix=".pdf";
for f in $SLIDES
do
	filename=${f%$suffix}
	pdf2svg $f $filename.svg
	rm $f
done
