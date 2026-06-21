[![CircleCI](https://circleci.com/gh/alexfalkowski/alexfalkowski.github.io.svg?style=shield)](https://circleci.com/gh/alexfalkowski/alexfalkowski.github.io)
[![Stability: Active](https://masterminds.github.io/stability/active.svg)](https://masterminds.github.io/stability/active.html)

# alexfalkowski.github.io

Personal GitHub Pages site for [www.afalkowski.com](https://www.afalkowski.com).

The site is built with Jekyll and the Beautiful Jekyll remote theme. Public homepage content lives in `_includes/home.md` and is rendered by `index.md`.

## Development

- `make`: show available targets
- `make dep`: install Ruby dependencies into `vendor/bundle`
- `make build`: build the production Jekyll site
- `make serve`: run the local Jekyll server
- `make lint`: run RuboCop
- `make sec`: run repository security checks

## Content

- `_includes/home.md`: homepage content
- `index.md`: homepage wrapper
- `_config.yml`: Jekyll and theme configuration
- `_includes/head-custom.html`: favicon and manifest links
- `assets/images/`: favicons and web manifest assets
- `robots.txt`: crawler policy
