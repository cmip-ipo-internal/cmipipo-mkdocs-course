# Publish to GitHub Pages

The site is published automatically each time you push to the `main` branch.
You only need to switch GitHub Pages on once for the repository.

## Turn on GitHub Pages

1. Open the repository on GitHub.
2. Go to **Settings**.
3. In the left menu, choose **Pages**.
4. Under **Build and deployment**, set **Source** to **GitHub Actions**.

That is the only setting to change. Nothing else needs to be configured.

## Publish

1. Commit your changes and push to `main`.
2. Open the **Actions** tab and wait for **Deploy site to GitHub Pages** to finish
   with a green tick.
3. Open the **Pages** settings page again. The link to the live site is shown there.

The live address looks like `https://YOUR-ORG.github.io/cmipipo-mkdocs-course/`.

## Run it again without a change

Open the **Actions** tab, choose **Deploy site to GitHub Pages**, then select
**Run workflow**.

## If the site does not appear

- Check that **Source** is set to **GitHub Actions**, not a branch.
- Check the Actions tab for a red cross and open the failed step to read the error.
- Check that `repo_url` in `src/mkdocs.yml` points at your repository.
