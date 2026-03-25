# AGENTS.md

This repository is a small GitHub Pages site built with Jekyll.

## Edit here

- `README.md`: primary page content.
- `index.md`: home page wrapper; includes `README.md` with `{% include_relative %}`.
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
  - `make serve`: run `bundle exec jekyll serve`.
  - `make dep`: install gems into `vendor/bundle`.
  - `make clean-dep`: run `bundler clean`.
  - `make lint`: run RuboCop.
  - `make fix-lint` or `make format`: run `rubocop -A`.
  - `make source-key`: generate `.source-key` for CI cache keys.

## Current config

- `_config.yml` uses `remote_theme: daattali/beautiful-jekyll@6.0.1`.
- Plugins: `jekyll-remote-theme`.
- Generated site excludes `AGENTS.md` and `vendor`.
- `.rubocop.yml` targets Ruby `3.3` and excludes `bin/**/*`, `vendor/**/*`, and `_site/**/*`.
- `.editorconfig` uses spaces with size `2`; `Makefile` uses tabs.
- `Gemfile.lock` currently pins Bundler `4.0.8`.

## CI

- CircleCI config is in `.circleci/config.yml`.
- `build` runs submodule sync/init, `make source-key`, dependency restore/install/clean, and `make lint`.
- Additional workflows run `make sync push` on non-`master` branches and `version` / `package` on `master`.

## Gotchas

- `bin/` is a git submodule (`git@github.com:alexfalkowski/bin.git`), so fresh clones usually need `git submodule update --init`.
- The rendered home page content comes from `README.md`, not `index.md`.
- Local Jekyll builds write `_site/`.
