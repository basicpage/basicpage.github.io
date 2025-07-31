# basicpage.github.io

**Template for a basic academic page that is ready to use and easy to customise.**

<img width="1440" alt="Screenshot 2024-11-02 at 19 39 34" src="https://github.com/user-attachments/assets/34d4b1f7-3212-4081-b9aa-ded0d0963d89">

It is also **responsive** by default!

<img width="334" alt="Screenshot 2024-11-02 at 19 43 24" src="https://github.com/user-attachments/assets/d5efbc5b-0385-4640-9397-563396400c55">

It relies on [FontAwesome](https://fontawesome.com/) and [Academicons](https://jpswalsh.github.io/academicons/) to display nice icons.

It is close in style to
[academicpages](https://github.com/academicpages/academicpages.github.io)
but is entirely independent.

## Getting started

- [Create a Github account if you don't have one.](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
- Click on [Use this template](https://github.com/new?owner=basicpage&template_name=basicpage.github.io&template_owner=basicpage)
  and then create a new repository called `[your username].github.io`, a bit
  like this repo is called `basicpage.github.io`. This will also be the address
  of your website.

> [!NOTE]
> If you don't have Github Pro (which you can get with the students programme)
> then your repository must be public for it to work.

- Now go to the repository "Settings" then click "Pages" on the left and select
  "Github Actions" instead of "Deploy from a branch" for "Source".
  
  <img width="837" alt="Screenshot 2024-11-27 at 16 51 07" src="https://github.com/user-attachments/assets/7219187c-7370-42dd-a9cf-c7559072b42f">

  <img width="304" alt="Screenshot 2024-11-27 at 16 52 45" src="https://github.com/user-attachments/assets/9af6698f-2c47-422f-8dff-61ee3629089e">

  <img width="243" alt="Screenshot 2024-11-27 at 16 52 59" src="https://github.com/user-attachments/assets/ac68143a-8e3b-4cca-9030-ae0af77d898f">


- Fill the contents of `index.md` to your liking and it should just work.

## Options

The `index.md` file starts with a header. All the items in it are optional.
For instance, if you remove the line
```yaml
picture: img/profile.png
```
then the website will no longer contain a picture.
We think it's better to have a picture, but it's your choice.

The same goes for email and so on.

We give the semantics of the various fields (all of whom are optional).

### General

- `title`: Title for your page, it will appear in the tab (metadata).

- `author`: Typically your name. It will appear in the page and as metadata.

- `shortbio`: Some form of subtitle where you can present yourself in a few
  words. It will appear below your name.

- `email`: Your email. It will appear next to an envelope in monospace font.

- `location`: Information about your location (university, office, …).
  It will appear next to a pin icon.

- `picture`: A path (relative or absolute) to the profile picture.

- `picture-round`: A Boolean (`true` or `false`) deciding whether your profile
  picture is rounded or left as a square.
  By default, it is square.

- `side-by-side`: A Boolean deciding whether the picture and the rest of the
  header are side by side on larger screens.
  By default, it's all on top of each other, like on smaller screens.

- `pronouns`: A string to show your pronouns.

- `footer`: Some data to put in the footer of the page. You can use it to put
  some disclaimer, or maybe to advertise basicpage. ☺️
  If nothing is provided, then the footer doesn't appear, and thus the
  horizontal that precedes is will not show either.

### OpenGraph

OpenGraph carries information that used by social media and messaging app to
display your links *nicely*, typically with the picture and a small
description.

- `description-meta`: Description of the page to appear in the metadata
  and in the OpenGraph data.

- `og-url`: This should be a full URL (starting with `http` or `https`) to your
  website. This is required by the format.

- `og-picture`: A full URL (starting with `http` or `https`) linking to a
  picture to display.

### Social and academic accounts

- `orcid`: Your ORCID number (in the shape `0000-0000-0000-0000`).

- `dblp`: *URL* to your DBLP page.

- `scholar`: *URL* to your Google Scholar page.

- `hal`: *URL* to your HAL page.

- `github`: Username to your Github account.

- `gitlab`: Username to your Gitlab account.

- `bitbucket`: *URL* to your BitBucket account.

- `mastodon`: *URL* to your Mastodon account.

- `bluesky`: *URL* to your BlueSky account.

- `linkedin`: *URL* to your LinkedIn account.

## Papers

We provide some tools to input your publications and drafts either in JSON
or YAML formats.

For instance:
````markdown
``` yaml {.paper}
title: Yet another yaml parser 3
authors: Templato Urnehm
venue: Proceedings of Nihilism
url: https://basicpage.github.io
year: 2029
files:
  - text: Paper
    type: pdf
    scr: foo.pdf
  - text: Bibtex
    type: bib
    src: foo.bib
```
````

or

````markdown
```json {.paper}
"title": "Towards automatic academic pages",
"authors": "Templato Urnehm, U. N. Owen",
"venue": "Principles of Awesomeness (PAW)",
"year": "2023",
"url": "https://basicpage.github.io",
"files": [
  { "text": "Paper", "type": "pdf", "src": "foo.pdf" },
  { "text": "Bibtex", "type": "bib", "src": "foo.bib" },
  { "text": "Formalisation", "type": "code", "src": "foo.v" }
]
```
````

> [!WARNING]
> Make sure to respect JSON syntax, in particular place commas where they are
> needed, and only there. Test locally before you push.

> [!TIP]
> You can input multiple files at once by using `papers` (with an `s`) instead
> of `paper`. In that case, papers must be bracketed properly, and the way to do
> so differs in YAML and JSON.
> Have a look at `index.md` to see how it's done.

The file that handles papers is `pandoc/paper.lua` and you may modify it to suit
your needs. Currently, it expects the fields `title` and `authors` (it will
assume them to be empty otherwise), while the other fields (`venue`, `year`,
`url` and `files`) are optional.

- `title`: Title of your paper. Will be used as header of the block.
- `authors`: List of authors.
- `awards` (optional, string or list of string): Award(s) that your paper may
  have received.
- `venue` (optional): Journal or conference.
- `year` (optional): Date of the conference, if present it is going to be in
  parentheses after the venue (unless the venue is absent in which case it
  will be alone on its line without parentheses). A more precise date is
  possible, in the end this is just treated as a string.
- `url` (optional): If present, the header will also be a link pointing to the
  provided URL.
- `files` (optional): A list of files that will be presented as links on one
  line with an icon depending on the file type.
  Each item must contain the following fields that will be assumed empty if
  absent:
  + `text`: Text that will appear.
  + `src`: URL to the file, it can be local.
  + `type`: Type of file. If no value is present, then the icon will be that of
    an undifferentiated file.
    The possible values are:
    * `pdf`
    * `bib`
    * `code`
    * `video`
    * `txt`
    * `img`
    * `zip`
    * `slides`
    * `link`
    * `git`

## Updating the HTML template

The `pandoc/template.html4` file contains an HTML template which you can edit
to suit your taste. Any variable mentioned in the header of your `index.md` can
be moved around, and you can even add your own.

There is also a special filter called `pandoc/date.lua` which produces an extra
variable called `date` (unless it is already provided in the header) that is
currently used in the footer of the template to indicate the last time the page
was generated.

> [!NOTE]
> It will only appear in the footer if the `footer` variable is set.

## Sharing files

Anything you put in the `website` directory will be available online too.
For instance, you can add PDF of your papers and so on and then link them
(or not) from `index.md`.

## Authors

- Yannick Forster
- Théo Winterhalter
