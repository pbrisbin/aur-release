NAME = aur-release
PREFIX ?= /usr/local

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

.PHONY: test install uninstall distcheck
