---
title: 'Second post'
author: 'Author''s name'
date: '10th July 2019'
description: |
    Another example with more explanations.
---

The Makefile processes files in alphabetical order, so if you want your
posts to appear in chronological order in the archive list, you must
name your files with the date at the front, in a format such as
`YYYY-MM-DD-*.md`.

Pandoc, however, will print the date that you provide in the YAML
metadata at the top of each markdown post.
It also prints the title, author(s), and some other metadata like
`description` which appear in the archive list.
