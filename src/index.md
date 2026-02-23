---
title: Basicpage template
author: Your Name
shortbio: Short bio
description-meta: Short bio for meta-data
og-url: https://basicpage.github.io
location: Location, office
email: noreply@noemail.com
clickable-email: false
picture: img/profile.png
picture-round: false
side-by-side: true
disable-dark-mode: false
pronouns: Pronouns
og-picture: https://basicpage.github.io/img/profile.png
orcid: 0000-0000-0000-0000
dblp: https://dblp.org/
scholar: https://scholar.google.com/
hal: https://hal.science/
mastodon: https://lipn.info
github: basicpage
gitlab: gitlab
bitbucket: bitbucket.com
bluesky: https://bsky.app/
linkedin: https://www.linkedin.com
footer: >-
  Based on the
  [basicpage template](https://github.com/basicpage/basicpage.github.io),
  made to be easy to use! 🎓
---

> [!NOTE]
> This website is an example of what one can get with the `basicpage` template
> designed for easy-to-create personal academic page.
> You are only required to know a little bit of Markdown to get started!
> Just follow the README of the
> [Github repository](https://github.com/basicpage/basicpage.github.io).

Here you would write a longer presentation of yourself and your research
interest, or anything you want really.

You have the power of Markdown, powered by Pandoc to let you do what you want.
- Unordered lists.
- *Italic*.
- **Bold**.
- Key display: <kbd>Ctrl</kbd> + <kbd>S</kbd>.
- Sublists.
  1. Ordered if one wants.
  2. And so on…

> [!TIP]
> The way this page is structured is only a suggestion, and you are basically
> free to customise everything however you want. For the more advanced
> customisation you might need to now very basic CSS and/or HTML, but that's it
> because we do not rely on any heavy machinery.

# Publications

This template provide JSON or Yaml parsers to handle data representing
publications to put them in the nice following shape.

## Conference papers

``` json {.paper}
"title": "Towards automatic academic pages 2",
"authors": "Templato Urnehm, U. N. Owen, Wan Morotter",
"venue": "Principles of Awesomeness (PAW)",
"year": "2024",
"url": "https://basicpage.github.io"
```

``` json {.paper}
"title": "Towards automatic academic pages",
"authors": "Templato Urnehm, U. N. Owen",
"awards": "Automatic Award",
"venue": "Principles of Awesomeness (PAW)",
"year": "2023",
"url": "https://basicpage.github.io",
"files": [
  { "text": "Paper", "type": "pdf", "src": "foo.pdf" },
  { "text": "Bibtex", "type": "bib", "src": "foo.bib" },
  { "text": "Formalisation", "type": "code", "src": "foo.v" }
]
```

## Journal papers

``` yaml {.paper}
title: Yet another yaml parser 3
authors: Templato Urnehm
awards:
  - Yet another "Yet another" award
  - Never-ending Work Award
venue: Proceedings of Nihilism
year: 2029
url: https://basicpage.github.io
files:
  - text: Paper
    type: pdf
    scr: foo.pdf
  - text: Bibtex
    type: bib
    src: foo.bib
```

``` yaml {.papers}
papers:
  - title: Yet another yaml parser 2
    authors: Templato Urnehm
    venue: Proceedings of Nihilism
    year: 2027
    files:
      - text: Paper
        type: pdf
        scr: foo.pdf
      - text: Bibtex
        type: bib
        src: foo.bib
  - title: Yet another yaml parser
    authors: Templato Urnehm
    awards: Yet another "Yet another" award
    venue: Proceedings of Nihilism
    year: 2025
    files:
      - text: Paper
        type: pdf
        scr: foo.pdf
      - text: Bibtex
        type: bib
        src: foo.bib
      - text: Some link
        type: link
        src: fake.link.xyz
      - text: Repo
        type: git
        src: github.com
```

``` json {.paper}
"title": "How to tame your wagon",
"authors": "Templato Urnehm",
"venue": "Journal of Automatic Rejection (JAR)",
"year": "2022"
```

## Drafts

``` json {.paper}
"title": "TBD",
"authors": "TBD",
"awards": [
  "Best Draft Award",
  "Test-of-time Award for works which just never leave the draft stage"
],
"files": [
  { "text": "🐱 video", "type": "video", "src": "foo.mov" },
  { "text": "Poem", "type": "txt", "src": "foo.txt" },
  { "text": "My picture", "type": "img", "src": "img/profile.png" },
  { "text": "💣", "type": "zip", "src": "foo.zip" },
  { "text": "Slides", "type": "slides", "src": "foo.key" },
  { "text": "Some random file", "src": "foo.rand" }
]
```

## Talks

``` json {.papers}
{
  "title": "Talk 1",
  "authors": "Templato Urnehm",
  "venue": "My room"
},
{
  "title": "Secret talk",
  "authors": "Templato Urnehm",
  "year": "1990"
},
{
  "title": "Talk 3",
  "authors": "Templato Urnehm",
  "venue": "Don't remember…",
  "year": "???"
}
```

# Education

Write whatever you want here.

# Teaching

Write whatever you want here.

# Community service

Write whatever you want here.
