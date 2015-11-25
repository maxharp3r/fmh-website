
.PHONY: clean watch

clean:
	rm -rf public

watch:
	hugo server --buildDrafts --watch
