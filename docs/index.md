# CMIP-IPO Mkdocs

This site is built from the Markdown files in this `docs/` folder. It was designed by the [Technical Officer](https://github.com/wolfiex) for the CMIP-IPO as a template for new projects. 

??? note "New to MkDocs?"

    Start by visiting the [set up pages](setting-up-mkdocs/install-python.md), then
    see [how it works](files.md), finally working up to adding your own content.

    For help with Markdown syntax try the following resources:

    - [Markdown Guide — basic syntax](https://www.markdownguide.org/basic-syntax/)
    - [GitHub — writing and formatting](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
    - [Markdown cheatsheet](https://github.com/lifeparticle/Markdown-Cheatsheet)

## Preview

```bash
make install
make dev
```

`make dev` opens the site at `http://127.0.0.1:48217`. Save a file and the page refreshes.

## Publish

Pushing to `main` publishes the site automatically. See
[Publish to GitHub Pages](setting-up-mkdocs/publish-github-pages.md) for the one-time setting.
