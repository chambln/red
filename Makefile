src := $(wildcard src/*.md)
obj := $(src:src/%.md=%.html)

all: index.html main.css

index.html: index.md archive.html
	pandoc $< -so $@ \
		-B src/header.html \
		-A archive.html \
		-A src/footer.html \
		--css=main.css

archive_li := $(src:src/%.md=tmp/%.html)

archive.html: $(archive_li) $(obj)
	cat $(archive_li) | pandoc -o archive.html \
		--metadata pagetitle="Archive" \
		--template=template/archive

tmp/%.html: src/%.md
	@mkdir -pv tmp/
	pandoc $< -o $@ \
		--template=template/archive-li \
		--variable=filename:$(notdir $@)

%.html: src/%.md
	pandoc $< -so $@ \
		--template=template/post \
		--css=main.css

%.css: src/%.sass
	sassc $< -at compressed > $@

clean:
	@rm -fv *.html *.css
	@rm -frv tmp/
