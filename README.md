# red – static site generator

This is really just a makefile for turning Markdown and Sass into HTML
and CSS to produce a simple static blog.
There are no scripts or binaries.

A demo of the generated site template is available at <https://cosine.blue/red/>.

A brief summary of the Makefile is this:

    src/*.md         →  www/*.html
    src/posts/*.md   →  www/*.html + www/index.html
    src/main.sass    →  www/main.css

    src/header.html     Prepended to every page
    src/footer.html     Appended to every page

Posts are automatically listed in a section appended to the index page
(`src/index.md → index.html`).
The list is sorted alphabetically, so if you name your posts in the
form `YYYY-MM-DD-*.md`, they will be listed in chronological order.

A few similar tools I've seen are [bake][1], [pdsite][2], and
[tundra.sh][3].

[1]: https://github.com/fcanas/bake
[2]: http://pdsite.org
[3]: https://frainfreeze.github.io/tundra

## Dependencies

GNU Make is required.
To build the HTML pages, you need Pandoc.
To build the style sheet, you need a Sass preprocessor such as `sassc`
(edit `Makefile` to use another implementation).

## Usage

Edit and create files within the `src/` directory to determine the
site's content.  Then build:

    make

You can enter

    make clean

to remove all the files that were generated by `make`.
