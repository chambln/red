---
title: 'Site title'
---

This is the root page of the site.
Markdown files under the `src/` directory are turned into HTML pages using pandoc.
This is one such page (`src/index.md`).
Just edit these to your liking.
Markdown files under `src/posts/` are generated the same way, but also
used to generate the archive list below.

The header and footer are manually-written HTML files that get included
in every page when the site is generated.
Edit `src/header.html` and `src/footer.html` to change their contents.

Edit `src/main.sass` to change the site's stylesheet.
It gets processed into `main.css` using `sassc`.
To use a different Sass implementation, specify its executable in the
`Makefile`.
