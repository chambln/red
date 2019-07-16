# red — static site generator

This is really just a makefile that turns Markdown and Sass into HTML
and CSS to produce a simple static blog.
Posts (`src/posts/YYYY-MM-DD-*.md → *.html`) are automatically listed
in chronological order in a section appended to the root page
(`index.md → index.html`).

## Dependencies

GNU Make is required.
To build the HTML pages, you need Pandoc.
To build the style sheet, you need a Sass preprocessor such as `sassc`
(edit `Makefile` to use another implementation).

## Usage

Edit files within the `src/` directory to determine the site's content.
Then build:

    make

You can enter

    make clean

to remove all the files that were generated by `make`.
