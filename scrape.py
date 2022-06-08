#!/usr/bin/env python3

import re
import requests
import os
from bs4 import BeautifulSoup

def get(num: int) -> str:
	url = f'http://bash.hu/{num}'
	html_text = requests.get(url).text
	soup = BeautifulSoup(html_text, 'html.parser')

	qline = str(soup.find("div", {"class": "qline"}))
	qtxt = soup.find("div", {"class": "qtxt"})
	
	if not (qline and qtxt):
		return ""
	
	qline = re.sub(r'#<a href="\/(\d+)">\1<\/a>', r'#\1', qline)
	qline = re.sub(r' <a href="\/\d+\/vote\/up">\+<\/a>', r'', qline)
	qline = re.sub(r' <a href="\/\d+\/vote\/down">-<\/a>', r'', qline)
	qline = re.sub(r' \[<a href="\/\d+\/vote\/kill">X<\/a>\]', r'', qline)
	
	return f"{qline}\n{qtxt}"

outdir = "out"

try:
	os.mkdir(outdir)
except FileExistsError:
	pass

# Nincs jobb ötletem a szám alapú rendezésre
file_list = [int(i.rstrip(".html")) for i in os.listdir("out")]
list.sort(file_list)

first = file_list[-1] + 1
last = 98076

for i in range(first, last + 1):
	text = get(i)
	
	if text:
		print(f"{i}/{last} ({int(100*(i-first+1)/(last-first+1))}%)")
		with open(f"{outdir}/{i}.html", "w") as f:
			f.write(text)

