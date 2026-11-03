# daveparr.com

Source for [daveparr.com](https://daveparr.com), a static site hosted on Cloudflare Pages.

## Layout

- `public/` is the site. Everything in it is deployed as-is.
- Anything outside `public/` (like this README) is not published.

## Deploying

Cloudflare Pages is connected to this repo. Every push to `main` deploys to
production, and every other branch gets its own preview URL.

Pages build settings:

| Setting                | Value    |
| ---------------------- | -------- |
| Framework preset       | None     |
| Build command          | *(empty)* |
| Build output directory | `public` |

## Previewing locally

Open `public/index.html` in a browser, or serve the folder:

```bash
npx serve public
```
