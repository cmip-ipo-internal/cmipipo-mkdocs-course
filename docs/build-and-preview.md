# Build and preview

Run these from the repository root (the folder with the `Makefile`).

| Command | What it does |
| --- | --- |
| `make install` | Installs what the site needs. Run once. |
| `make dev` | Starts the preview at `http://127.0.0.1:48217` and opens it. |
| `make build` | Builds the finished site into `build/`. |
| `make kill` | Stops the preview server. |

If the preview does not show your change, run `make kill` and then `make dev` again.

## Versions

The published site keeps several versions side by side, managed by [mike](https://github.com/jimporter/mike). The version dropdown in the header lists them, and any page that is not the latest shows a banner linking back to it.

| What you do | What gets published |
| --- | --- |
| Push to `main` | The `dev` version, hidden from the dropdown but reachable by its address |
| Publish a GitHub release (any tag) | A version named after the publish date, shown in the dropdown as `26.Nov.05`, which becomes `latest` |

To cut a release, create a release on GitHub (**Releases, Draft a new release**) and publish it. The dropdown label is the publish date (UTC) as `YY.Mon.DD`, whatever the tag is called. The address uses the sortable form `2026.11.05`, so the page lives at `/2026.11.05/`. A second release on the same day becomes `26.Nov.05.2`, and so on. Pre-releases are ignored.

The address of the site itself (without a version) redirects to `latest`. Until the first release exists it redirects to `dev`.

| Command | What it does |
| --- | --- |
| `make versions` | Lists the versions on your local `gh-pages` branch. |
| `make deploy-local` | Builds a version into your local `gh-pages` branch. Does not push. |
| `make serve-versions` | Previews all local versions with the dropdown working. |
| `make try-versions` | Builds a test `0.9` and `1.0` (latest) locally and serves them. Remove afterwards with `git branch -D gh-pages`. |

Leave **Settings, Pages, Source** on "GitHub Actions". The `gh-pages` branch is only where mike stores the versions; the workflow publishes them to Pages as an artifact. The other one-time settings are in [Publish to GitHub Pages](setting-up-mkdocs/publish-github-pages.md).

## Redirects

When you move or rename a page, add the old and new paths to `redirect_maps` under the `redirects` plugin in `src/mkdocs.yml`:

```yaml
- redirects:
    redirect_maps:
      old-page.md: setting-up-mkdocs/new-page.md
```

Visitors with the old link are sent to the new page, within the same version.

## Unofficial-copy banner

A yellow warning banner appears at the top of every page when the site is served from a hostname that is not approved, such as a fork or mirror. Edit `fallback_banner` under `extra` in `src/mkdocs.yml` to change the approved hostnames or the message, or set `enabled: false` to turn it off.
