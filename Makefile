images = html/favicon.ico html/hline.png html/logo.png

all: out/all_posts.html out/top100.html

out/all_posts.html: out/posts/ $(images)
	./all_posts.sh

out/top100.html: out/posts/ $(images)
	./top100.sh

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

