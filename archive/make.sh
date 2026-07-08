magick westlake-paint.png -gravity North -chop "0x%[fx:h-round(w*10/16)]" -resize 1814x1134 -strip ../media/westlake-paint-a.png
magick westlake-paint.png -gravity South -chop "0x%[fx:h-round(w*10/16)]" -resize 907x567 -strip ../media/westlake-paint-b.png
for name in westlake-logo westlake-badge-en westlake-badge-cn WESTLAKE UNIVERSITY; do
  inkscape "$name.svg" --export-type=pdf --export-filename="../media/$name.pdf"
  mutool clean -a -gggg "../media/$name.pdf" "../media/$name.pdf"
  sed -i '' '/^  \/CreationDate/d' "../media/$name.pdf"
done