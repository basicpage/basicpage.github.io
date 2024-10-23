# basicpage.github.io

Template for a really basic academic page.
In the style of
[academicpages](https://github.com/academicpages/academicpages.github.io)
but producing something much simpler.

## Getting started

- [Create a Github account if you don't have one.](https://github.com/signup?ref_cta=Sign+up&ref_loc=header+logged+out&ref_page=%2F&source=header-home)
- Click on [Use this template](https://github.com/new?owner=basicpage&template_name=basicpage.github.io&template_owner=basicpage)
  and then create a new repository called `[your username].github.io`, a bit
  like this repo is called `basicpage.github.io`. This will also be the address
  of your website.

> [!NOTE]
> If you don't have Github Pro (which you can get with the students programme)
> then your repository must be public for it to work.

- Now go to "Settings" then click "Pages" on the left and select
  "Github Actions" instead of "Deploy from a branch" for "Source".

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

- `picture-round`: A boolean (`true` or `false`) deciding whether your profile
  picture is rounded or left as a square.
  By default, it is square.

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

- `github`: Username to your github account.

- `orcid`: Your ORCID number (in the shape `0000-0000-0000-0000`).

- `dblp`: *URL* to your DBLP page.

- `scholar`: *URL* to your Google Scholar page.

- `hal`: *URL* to your HAL page.

- `mastodon`: *URL* to your Mastodon account.

- `gitlab`: *URL* to your Gitlab account.

- `bluesky`: *URL* to your BlueSky account.


## Sharing files

Anything you put in the `website` directory will be available online too.
For instance, you can add PDF of your papers and so on and then link them
(or not) from `index.md`.

## Authors

- Yannick Forster
- Théo Winterhalter
