
.PHONY: clean deploy watch

clean:
	rm -rf public

deploy:
	make clean
	hugo
	rsync -avz public/ chork.cs.umn.edu:/home/grad03/harper/.www/

watch:
	hugo server --buildDrafts --watch
