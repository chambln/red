---
title: 'Site title'
---

This is the root page of the site.
Markdown files under the `src/` directory are turned into HTML pages
using pandoc.
Just edit these to your liking.
Markdown files under `src/posts/` are generated the same way, but also
used to generate the archive list, which is included at the end of the
index.

The header and footer are the only HTML files written 'by hand'.
They are included in every page when the site is generated.
Edit `src/*.html` to change their contents.

Edit `src/main.sass` to change the site's stylesheet.
It gets processed into `main.css` using the `sassc` preprocessor.
To use a different Sass implementation, specify its executable in the
`Makefile`.
