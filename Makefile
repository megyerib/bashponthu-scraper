images = html/favicon.ico html/hline.png html/logo.png

all: out/sorban.html out/top.html

out/sorban.html: out/posts/ $(images)
	./sorban.sh

out/top.html: out/posts/ $(images)
	./top.sh

out/posts/: out/raw/
	./process.py

out/raw/:
	./download.sh

$(images):
	cd html; make

.PHONY: clean

clean:
	rm -rf out/
	cd html; make clean

