find ./ -name '*.eps' -exec mogrify -density 200 -quality 70 -format png -trim -resize 500 {} \;
chmod 644 *.png
