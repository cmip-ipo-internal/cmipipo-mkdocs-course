# Build and preview

Run these from the repository root (the folder with the `Makefile`).

| Command | What it does |
| --- | --- |
| `make install` | Installs what the site needs. Run once. |
| `make dev` | Starts the preview at `http://127.0.0.1:48217` and opens it. |
| `make build` | Builds the finished site into `build/`. |
| `make kill` | Stops the preview server. |

If the preview does not show your change, run `make kill` and then `make dev` again.
