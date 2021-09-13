
.PHONY: clean deploy watch

clean:
	rm -rf public

build: clean
	hugo

watch:
	hugo server --buildDrafts --watch
