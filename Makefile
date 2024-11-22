include bin/build/make/ruby.mak
include bin/build/make/git.mak

# Serve the site.
serve:
	bundle exec jekyll serve
