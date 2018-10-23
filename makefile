
.PHONY: clean deploy watch

clean:
	rm -rf public

deploy:
	make clean
	hugo
	rsync -avz public/ chork.cs.umn.edu:/home/max/.www/

watch:
	hugo server --buildDrafts --watch
