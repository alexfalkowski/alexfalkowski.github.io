# AGENTS.md

This repository is a small GitHub Pages site built with Jekyll.

## Shared guidance

Use `bin/AGENTS.md` for shared skills and cross-repository defaults.

## Edit here

- `README.md`: repository documentation.
- `_includes/home.md`: primary page content.
- `index.md`: home page wrapper; includes `_includes/home.md`.
- `_config.yml`: Jekyll config, remote theme, plugin, navbar, social links, and exclusions.
- `_includes/head-custom.html`: favicon and manifest links injected into the page `<head>`.
- `assets/css/main.scss`: stylesheet entrypoint.
- `assets/images/`: favicons and related site assets.

## Tooling

- Ruby/Bundler project with dependencies in `Gemfile` and `Gemfile.lock`.
- Top-level `Makefile` includes shared targets from the `bin/` git submodule:
  - `bin/build/make/help.mak`
  - `bin/build/make/ruby.mak`
  - `bin/build/make/git.mak`
- Common commands:
  - `make` or `make help`: show available targets.
  - `make serve`: run the local Jekyll server through the shared Ruby target.
  - `make dep`: install repository dependencies.
  - `make clean-dep`: clean unused dependencies.
  - `make lint`: run repository linting.
  - `make fix-lint` or `make format`: apply supported lint fixes/formatting.
  - `make source-key`: generate `.source-key` for CI cache keys.

## Current config

- `_config.yml` owns the current remote theme selection.
- Plugins: `jekyll-remote-theme`.
- Generated site excludes `AGENTS.md` and `vendor`.
- `.rubocop.yml` owns the current Ruby lint target and excludes `bin/**/*`,
  `vendor/**/*`, and `_site/**/*`.
- `.editorconfig` uses spaces with size `2`; `Makefile` uses tabs.
- `Gemfile.lock` owns the current Bundler and dependency versions.

## CI

- CircleCI config is in `.circleci/config.yml`.
- `build` runs submodule sync/init, `make source-key`, dependency restore/install/clean, and `make lint`.
- Additional workflows run `make sync push` on non-`master` branches and `version` / `package` on `master`.

## Gotchas

- `bin/` is a git submodule, so initialize it before relying on shared Make
  targets.
- The rendered home page content comes from `README.md`, not `index.md`.
- Local Jekyll builds write `_site/`.
