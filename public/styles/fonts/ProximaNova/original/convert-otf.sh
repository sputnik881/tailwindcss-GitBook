#!/bin/bash
echo ""
echo ""
echo ""
echo "=== Convert OTF to WebFont formats ===";
echo ""
echo ""

echo "Enter the file name of the OTF:";
read inputline
otffile="$inputline"

echo "Enter the FONT name:";
read inputline
otfname="$inputline"

echo ""
echo "The file name is: $otffile"
echo "The font name is: $otfname"
echo ""
echo "When Ready, Press Return to Continue, otherise CTRL-Z to Cancel."
read inputline

fontforge -script 2ttf.pe $otffile
ttf2eot $otffile > $otfname.eot
fontforge -script 2svg.pe $otffile
sfnt2woff $otffile

