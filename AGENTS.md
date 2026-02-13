# AGENTS.md

This repository is a small **GitHub Pages / Jekyll** site.

## Quick orientation

- Content lives primarily in Markdown.
- The home page (`index.md`) includes `README.md` via Jekyll’s `{% include_relative %}`.
- Tooling is Ruby-based (Bundler + `github-pages` + `jekyll`) and uses a shared `bin/` submodule for Make targets.

## Repo layout (what to edit)

- `README.md` — main page content (rendered on the site).
- `index.md` — Jekyll page that includes `README.md`.
- `_config.yml` — Jekyll config; uses a remote theme and plugin.
- `_includes/head-custom.html` — additional HTML injected into the theme’s `<head>` (favicons).
- `assets/css/main.scss` — site CSS entrypoint; imports the theme.
- `assets/images/` — icons/favicons.
- `CNAME` — custom domain.

## Tooling & commands (observed)

### Make targets

Top-level `Makefile` includes Make fragments from the `bin/` submodule:

- `bin/build/make/help.mak`
- `bin/build/make/ruby.mak`
- `bin/build/make/git.mak`

Useful targets available from those includes:

- `make` / `make help` — prints a generated help menu (default target is `help`).
- `make serve` — serve the site locally via Jekyll:
  - runs: `bundle exec jekyll serve` (see `Makefile:6-7`).

From `bin/build/make/ruby.mak`:

- `make lint` — runs RuboCop (`rubocop`) via `bundler exec`.
- `make fix-lint` / `make format` — runs RuboCop auto-fix (`rubocop -A`) via `bundler exec`.
- `make dep` / `make clean-dep` — dependency helpers via `bundler`.

From `bin/build/make/git.mak`:

- `make source-key` — creates `.source-key` from `git ls-files` (used by CI caching).

### Ruby / Bundler

- Dependencies: `Gemfile`, `Gemfile.lock`.
- Bundler version pinned in `Gemfile.lock`:
  - `BUNDLED WITH 4.0.3` (`Gemfile.lock:371-372`).

### Linting

- RuboCop configuration: `.rubocop.yml`
  - Target Ruby version: **3.3** (`.rubocop.yml:1-4`).
  - Excludes `bin/**/*`, `vendor/**/*`, `_site/**/*`.

## CI (observed)

CircleCI config: `.circleci/config.yml`

The `build` job runs:

- `git submodule sync` / `git submodule update --init`
- `make source-key`
- `make dep`
- `make clean-dep`
- `make lint`

## Project type notes (Jekyll/GitHub Pages)

- Jekyll config (`_config.yml`) uses:
  - `remote_theme: pages-themes/hacker@v0.2.0`
  - plugin: `jekyll-remote-theme`

## Conventions

- `.editorconfig`:
  - `indent_style = space`, `indent_size = 2`, `end_of_line = lf`.
  - `Makefile` uses tabs.

## Gotchas

- **`bin/` is a git submodule** (`.gitmodules:1-3`). Many Make targets come from it.
  - Fresh clones typically need: `git submodule update --init` (also run in CI).
  - The submodule URL is SSH (`git@github.com:...`), so access depends on having GitHub SSH credentials.
- Local Jekyll builds write `_site/` (already excluded by RuboCop).
- The rendered homepage content is sourced from `README.md` (via `index.md`), so changes to `README.md` affect the website.
