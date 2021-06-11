TEXFILE = alex_abrahams_cv.tex
PDFFILE = alex_abrahams_cv.pdf
TRAVIS_REPO_SLUG = alexabrahams/alexabrahams.github.io
BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

GITHUB_PAGES_BRANCH=master

help:
	@echo 'Makefile for automatic LaTeX compilation                                  '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make clean                          remove the generated files         '
	@echo '   make build	                        generate files										 '
	@echo '   make github                         upload the web site via gh-pages   '
	@echo '                                                                          '


clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

build:
	mkdir $(OUTPUTDIR)
	echo $(BASEDIR)
	sudo docker run -it -v $(BASEDIR):/tmp latex lualatex alex_abrahams_cv.tex
	mv $(PDFFILE) $(OUTPUTDIR)
	cp CNAME $(OUTPUTDIR)
	cp -R img $(OUTPUTDIR)
	cp -R js $(OUTPUTDIR)
	cp index.html $(OUTPUTDIR)

github:
	ghp-import -n $(OUTPUTDIR)
	@git push -fq https://${GH_TOKEN}@github.com/$(TRAVIS_REPO_SLUG).git gh-pages > /dev/null

.PHONY: help clean build github
