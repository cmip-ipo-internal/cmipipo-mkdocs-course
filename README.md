# cmipipo-mkdocs-course

A teaching site and template repository built with MkDocs. 
Demo Site: https://cmip-ipo-internal.github.io/cmipipo-mkdocs-course/


This will accompany the IPO hosted teaching course. 

- Pages are written in `docs/`.
- Settings and the page list are in `src/mkdocs.yml`.
- Run `make dev` to preview, `make build` to build into `build/`.
- Pushing to `main` updates the current `latest` version, but does not create a new one.

## Releasing a version

A new version of the site is only created by **publishing a release on GitHub**.
Pushing to `main` or creating a tag on its own does not make one.

1. On GitHub, open **Releases**, then **Draft a new release**.
2. Choose or create a tag (any name) and set the target to `main`.
3. Choose **Publish release**. Drafts and pre-releases are ignored.

The workflow then publishes the version, named after the publish date (for
example `26.Nov.05`), and makes it the latest. Full steps and the one-time
GitHub settings are in the site's **Publish to GitHub Pages** page.

Full instructions are in the site itself: `make dev`, then open the Home page.
