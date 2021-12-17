
.PHONY: clean build watch

clean:
	rm -rf public

build: clean
	hugo

watch:
	hugo server --buildDrafts --watch
