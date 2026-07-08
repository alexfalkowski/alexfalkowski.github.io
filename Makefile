include bin/build/make/help.mak
include bin/build/make/ruby.mak
include bin/build/make/git.mak
include bin/build/make/claude.mak
include bin/build/make/codex.mak

baseurl ?=

# Build the site.
build:
	JEKYLL_ENV=production bundle exec jekyll build --baseurl "$(baseurl)"

# Serve the site.
serve:
	bundle exec jekyll serve
