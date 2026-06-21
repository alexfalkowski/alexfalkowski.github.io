include bin/build/make/help.mak
include bin/build/make/ruby.mak
include bin/build/make/git.mak

# Build the site.
build:
	JEKYLL_ENV=production bundle exec jekyll build --baseurl ""

# Serve the site.
serve:
	bundle exec jekyll serve
