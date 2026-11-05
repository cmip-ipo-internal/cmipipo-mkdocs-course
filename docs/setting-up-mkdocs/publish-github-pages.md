# Publish to GitHub Pages

The site is published by a GitHub Action called **Deploy versioned site (mike)**.
Two things start it:

| What you do | What gets published |
| --- | --- |
| Push to `main` | Updates the current `latest` version. No new version is created, except that the very first push on a new repository creates the first one. |
| Publish a GitHub release | A numbered version, shown as a date such as `26.Nov.05`. It becomes the version visitors see. |

Versions are managed by [mike](https://github.com/jimporter/mike). The version
dropdown in the header lists them.

## Turn on GitHub Pages

You only need to do this once for the repository.

1. Open the repository on GitHub.
2. Go to **Settings**.
3. In the left menu, choose **Pages**.
4. Under **Build and deployment**, set **Source** to **GitHub Actions**.

Leave it on **GitHub Actions**. Do not switch it to a branch.

## Allow releases to publish

You only need to do this once as well. Releases run from a tag, and by default
the `github-pages` environment only accepts the `main` branch.

1. In **Settings**, choose **Environments**, then **github-pages**.
2. Under **Deployment branches and tags**, choose **Add deployment branch or tag rule**.
3. Set the type to **Tag**, enter `*` as the pattern, and save.

Then check **Settings, Actions, General, Workflow permissions**. It must allow
**Read and write permissions**, because the action stores each version on a
branch called `gh-pages`.

## Update the live site

1. Commit your changes and push to `main`.
2. Open the **Actions** tab and wait for **Deploy versioned site (mike)** to
   finish with a green tick.
3. Open the **Pages** settings page. The link to the live site is shown there.

The live address looks like `https://YOUR-ORG.github.io/cmipipo-mkdocs-course/`.
This refreshes the version that is already published as `latest`. It does not
add a new version, with one exception: on a brand-new repository the first push
creates the first version, named after that day's date, so the site appears
straight away.

## Publish a release

1. Open the repository on GitHub and choose **Releases**, then **Draft a new release**.
2. Choose or create a tag. Its name does not matter, because the version comes
   from the publish date.
3. Set the target to `main`, then choose **Publish release**.
4. Open the **Actions** tab and wait for the green tick.

The new version appears in the dropdown, and the site address now redirects to
it. A second release on the same day is shown as `26.Nov.05.2`. Pre-releases and
drafts are ignored.

## Run it again without a change

Open the **Actions** tab, choose **Deploy versioned site (mike)**, then select
**Run workflow**. This refreshes the `latest` version. To add a new version,
publish a release.

## If the site does not appear

- Check that **Source** is set to **GitHub Actions**, not a branch.
- Check the Actions tab for a red cross and open the failed step to read the error.
- If the deploy step fails with a message about environment protection rules or
  an unallowed branch, add the tag rule described in **Allow releases to publish**.
- If a step fails with a permission error (403) when pushing, set **Workflow
  permissions** to read and write.
- Check that `repo_url` in `src/mkdocs.yml` points at your repository.
