#!/usr/bin/env python3

import re
import requests
import os
import time
import sys
from bs4 import BeautifulSoup

indir = "out/raw"
outdir = "out/posts"

try:
	os.mkdir(outdir)
except FileExistsError:
	pass

for file_name in os.listdir(indir):
	with open(f"{indir}/{file_name}", "r", encoding="iso-8859-2") as f:
		html_text = f.read()
		soup = BeautifulSoup(html_text, 'html.parser')

		qlines_raw = soup.find_all("div", {"class": "qline"})
		qlines = []

		for qline in qlines_raw:
			qline = str(qline)
			qline = re.sub(r'#<a href="\/(-?\d+)">\1<\/a>', r'#\1', qline)
			qline = re.sub(r' <a href="\/\d+\/vote\/up">\+<\/a>', r'', qline)
			qline = re.sub(r' <a href="\/\d+\/vote\/down">-<\/a>', r'', qline)
			qline = re.sub(r' \[<a href="\/\d+\/vote\/kill">X<\/a>\]', r'', qline)
			qlines.append(qline)

		qtxts_raw = soup.find_all("div", {"class": "qtxt"})
		qtxts = []

		for qtxt in qtxts_raw:
			qtxt = str(qtxt)
			qtxts.append(qtxt)



		for qline, qtxt in zip(qlines, qtxts):
			search = re.search("(\d+)", qline)
			num = search.group(0)

			with open(f"{outdir}/{num}.html", "w") as f:
				f.write(f"{qline}\n{qtxt}\n")
