# red -- static site generator
# See LICENSE file for copyright and license details.

src_posts := $(shell ls src/posts/*.md | sort -r)
obj_posts := $(src_posts:src/posts/%.md=www/%.html)
src_pages := $(wildcard src/*.md)
obj_pages := $(src_pages:src/%.md=www/%.html)

all: $(obj_pages) www/main.css

www/index.html: src/index.md tmp/archive.html
	mkdir -p www/
	pandoc $< -so $@ \
		-B src/header.html \
		-A tmp/archive.html \
		-A src/footer.html \
		--css=/main.css

archive_li := $(src_posts:src/posts/%.md=tmp/%.html)

tmp/archive.html: $(archive_li) $(obj_posts)
	cat $(archive_li) | pandoc -o tmp/archive.html \
		--metadata pagetitle="Archive" \
		--template=template/archive

tmp/%.html: src/posts/%.md
	mkdir -p tmp/
	pandoc $< -o $@ \
		--template=template/archive-li \
		--variable=filename:$(notdir $@)

www/%.html: src/posts/%.md
	mkdir -p www/
	pandoc $< -so $@ \
		-B src/header.html \
		-A src/footer.html \
		--template=template/post \
		--css=/main.css

www/%.html: src/%.md
	mkdir -p www/
	pandoc $< -so $@ \
		-B src/header.html \
		-A src/footer.html \
		--template=template/post \
		--css=/main.css

www/%.css: src/%.sass
	mkdir -p www/
	sassc $< -at compressed > $@

clean:
	rm -fr tmp/ www/
