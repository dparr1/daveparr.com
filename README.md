# daveparr.com

Source for [daveparr.com](https://daveparr.com), a [Jekyll](https://jekyllrb.com) site hosted on Cloudflare Pages.

## Layout

The look follows the old WordPress "Luminance" theme: Instrument Serif and Sans,
a warm off-white palette, and a grid of post cards on the home page.

| Path                 | What it is                                             |
| -------------------- | ------------------------------------------------------ |
| `_config.yml`        | Site title, URL, header navigation and plugins          |
| `_layouts/`          | Page templates (`default`, `page`, `post`, `archive`) |
| `_includes/`         | Header, footer, head tags and the post card             |
| `_posts/`            | Blog posts, named `YYYY-MM-DD-title.md`                   |
| `assets/css/main.css`| Stylesheet                                              |
| `index.html`         | Home page: every post as a card, newest first           |

Add `image: /assets/...` to a post's front matter to give its card a picture.

## Writing a post

Add a file to `_posts/` such as `2026-11-10-my-post.md`:

```markdown
---
title: My post
---

Post body in Markdown.
```

Push to `main` and it goes live.

## Deploying

Cloudflare Pages builds this repo on every push. `main` deploys to production and
other branches get preview URLs.

| Setting                | Value          |
| ---------------------- | -------------- |
| Framework preset       | Jekyll         |
| Build command          | `bundle exec jekyll build` |
| Build output directory | `_site`        |

## The GEOG 215 book (`geog215/`)

`geog215/` holds the rendered HTML of the Quarto book
[dparr1/geog-215-spatial-data-science](https://github.com/dparr1/geog-215-spatial-data-science),
served at <https://daveparr.com/geog215/>. **Don't edit it here.** The book
repo's GitHub Action renders the book and commits it into this folder on every
push, using a deploy key (repo Settings > Deploy keys), and that commit
triggers the normal Cloudflare build. Edit the book in its own repo.

## Previewing locally

Needs Ruby (on Windows, RubyInstaller with DevKit).

```bash
bundle install
bundle exec jekyll serve --livereload
```

Then open http://localhost:4000.
