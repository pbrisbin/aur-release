NAME = aur-release
PREFIX ?= /usr/local

VERSION = 0.0.0

test:
	cram test

install:
	install -Dm755 bin/aur-release $(DESTDIR)/$(PREFIX)/bin/aur-release

uninstall:
	$(RM) $(DESTDIR)/$(PREFIX)/bin/aur-release

distcheck:
	makepkg --clean --install
	$(RM) -rf aur-release
	$(RM) -rf aur-release-*.pkg.tar.xz

release: distcheck
	./bin/aur-release v$(VERSION) aur-release-git


.PHONY: test install uninstall distcheck release
