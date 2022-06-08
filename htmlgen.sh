#!/usr/bin/env bash

set -eu

template=html/index.html
css=html/style.css

cd $(dirname $0)

favicon_base64="data:image/png;base64,$(base64 -w 0 html/favicon.ico)"
logo_base64="data:image/png;base64,$(base64 -w 0 html/logo.png)"
hline_base64="data:image/png;base64,$(base64 -w 0 html/hline.png)"

content_line=$(awk '/Content/{ print NR; exit }' $template)
css_line=$(awk '/style.css/{ print NR; exit }' $template)

head -n $((css_line - 1)) $template

echo "<style>"
cat $css | sed "s|logo.png|$logo_base64|" | sed "s|hline.png|$hline_base64|"
echo "</style>"

tail -n +$((css_line + 1)) $template | head -n $((content_line - $css_line - 1)) | sed "s|favicon.ico|$favicon_base64|"

while read -r line; do
	echo $line
done

tail -n +$((content_line + 1)) $template

