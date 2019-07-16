src_posts := $(wildcard src/posts/*.md)
obj_posts := $(src_posts:src/posts/%.md=%.html)
src_pages := $(wildcard src/*.md)
obj_pages := $(src_pages:src/%.md=%.html)

all: $(obj_pages) main.css

index.html: src/index.md archive.html
	pandoc $< -so $@ \
		-B src/header.html \
		-A archive.html \
		-A src/footer.html \
		--css=main.css

archive_li := $(src_posts:src/posts/%.md=tmp/%.html)

archive.html: $(archive_li) $(obj_posts)
	cat $(archive_li) | pandoc -o archive.html \
		--metadata pagetitle="Archive" \
		--template=template/archive

tmp/%.html: src/posts/%.md
	@mkdir -pv tmp/
	pandoc $< -o $@ \
		--template=template/archive-li \
		--variable=filename:$(notdir $@)

%.html: src/posts/%.md
	pandoc $< -so $@ \
		--template=template/post \
		--css=main.css

%.html: src/%.md
	pandoc $< -so $@ \
		--template=template/post \
		--css=main.css

%.css: src/%.sass
	sassc $< -at compressed > $@

clean:
	@rm -fv *.html *.css
	@rm -frv tmp/
