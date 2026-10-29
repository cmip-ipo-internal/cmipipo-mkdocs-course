# Where files live

Write your pages in `docs/`. Everything else is set up for you.

```text
docs/
├── index.md
├── files.md
├── build-and-preview.md
└── setting-up-mkdocs/
```

Each page is one Markdown (`.md`) file. Use a `#` heading at the top of the page.

## Adding a new page

1. Create a `.md` file in `docs/`, for example `docs/week-01.md`.
2. Start it with a single `#` heading.
3. Save. If `make dev` is running, the page appears straight away.

You do not edit a menu file. The menu is built from the folder.

## Naming files

The file name becomes the web address, so keep it short and lowercase.

| File | Address |
| --- | --- |
| `week-01.md` | `/week-01/` |
| `data-formats.md` | `/data-formats/` |

- Use hyphens between words, not spaces or underscores.
- `index.md` is special: it is the page shown for the folder it sits in.

The **title in the menu comes from the `#` heading**, not the file name. So
`week-01.md` starting with `# Week 1: Getting started` shows as
"Week 1: Getting started" in the menu.

## Folders and the menu

A folder becomes a dropdown in the top bar. Its name becomes the dropdown
label, with hyphens shown as spaces.

```text
docs/
└── lectures/           ← dropdown labelled "Lectures"
    ├── index.md        ← the dropdown's own landing page
    ├── week-01.md      ← an entry in the dropdown
    └── week-02.md      ← an entry in the dropdown
```

A folder inside a folder is shown as a heading inside the same dropdown, with
its pages listed underneath:

```text
docs/
└── lectures/           ← dropdown labelled "Lectures"
    ├── week-01.md
    └── practicals/     ← a heading inside the dropdown
        └── setup.md    ← listed under that heading
```

Deeper nesting works but makes long dropdowns. Two levels is usually enough.

## Order of the menu

Pages are listed **alphabetically by file name**, not by title. To force an
order, start the file names with numbers:

```text
01-introduction.md
02-methods.md
10-summary.md
```

Use `01`, `02` rather than `1`, `2`, so that `10` does not sort before `2`.
Remember the number becomes part of the address (`/01-introduction/`).

## Keeping a page out of the top bar

The top bar does not need to show everything. Titles listed under
`extra.nav_exclude` in `src/mkdocs.yml` are left out of it. They still appear
in the sidebar and still work as links.

## Generated folders

These are created for you and can be deleted at any time:

- `build/` holds the finished website. `make build` creates it, `make clean` removes it.
- `__pycache__/` holds Python cache files.

Neither folder is committed to git.
