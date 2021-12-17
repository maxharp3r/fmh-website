# THIS REPOSITORY IS DEPRECATED, use maxharp3r.gihub.io instead

.PHONY: clean build watch cpcv

clean:
	rm -rf public

build: clean
	hugo

watch:
	hugo server --buildDrafts --watch

cpcv:
	cp ../fmh-cv/harper-cv.pdf ./static/files/
	cp ../fmh-cv/harper-resume.pdf ./static/files/