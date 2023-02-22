images := html/favicon.ico html/hline.png html/logo.png
tag := $(shell (git tag --points-at HEAD | grep -m 1 -E ".+") || git rev-parse --short HEAD)
release_zip := out/bashponthu-$(tag).zip

all: out/sorban.html out/top.html

release: $(release_zip)

$(release_zip): out/sorban.html out/top.html
	zip -j $@ $^

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

