#!/bin/sh

## declare an array variable
declare -a arr=(
  "Proxima Nova Xbold"
  "Proxima Nova Black"
  "Proxima Nova Bold It"
  "Proxima Nova Bold"
  "Proxima Nova Light It"
  "Proxima Nova Light"
  "Proxima Nova Reg It"
  "Proxima Nova Reg"
  "Proxima Nova Sbold It"
  "Proxima Nova Sbold"
  "Proxima Nova Thin It"
  "Proxima Nova Thin"
  "Proxima Nova Xbold It"
  "Proxima Nova Black It"
                )

## now loop through the above array
for i in "${arr[@]}"
do
   echo "================================ Creating: $i"

fontTTF="$i.ttf"
fontFile="$i.otf"
fontRoot="$i"

# ttf >> otf (optional?)
# /usr/local/bin/fontforge -script 2otf.pe $fontTTF
# otf >> ttf
/usr/local/bin/fontforge -script 2ttf.pe $fontFile
# otf >> eot
/usr/local/bin/ttf2eot $fontFile > $fontRoot.eot
# otf >> svg
/usr/local/bin/fontforge -script 2svg.pe $fontFile
# otf >> woff
/usr/local/bin/sfnt2woff $fontFile


(echo "
/* $fontRoot */
/* p.style	{ font: 18px/27px '$fontRoot' ;} */
@font-face {
	font-family: '$fontRoot';
	src: url('$fontRoot.eot');
	src: url('$fontRoot.eot?#iefix') format('embedded-opentype'),
	     url('$fontRoot.woff') format('woff'),
	     url('$fontRoot.ttf') format('truetype'),
	     url('$fontRoot.svg#') format('svg');
	font-weight: normal;
	font-style: normal;
}
") >> stylesheet.css
   ## or do whatever with individual element of the array
done

## You can access them using echo "${arr[0]}", "${arr[1]}" also
