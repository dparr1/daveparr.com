# daveparr.com

Source for [daveparr.com](https://daveparr.com), a [Jekyll](https://jekyllrb.com) site hosted on Cloudflare Pages.

## Layout

| Path                 | What it is                                        |
| -------------------- | ------------------------------------------------- |
| `_config.yml`        | Site title, URL, navigation and plugins           |
| `_layouts/`          | Page templates (`default`, `page`, `post`)        |
| `_includes/`         | Reusable snippets, like the post list             |
| `_posts/`            | Blog posts, named `YYYY-MM-DD-title.md`           |
| `assets/css/`        | Stylesheet                                        |
| `index.md`, `*.md`   | Top-level pages                                   |

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

## Previewing locally

Needs Ruby (on Windows, RubyInstaller with DevKit).

```bash
bundle install
bundle exec jekyll serve --livereload
```

Then open http://localhost:4000.
