NAME = aur-release
PREFIX ?= /usr/local

.PHONY: test
test:
	cram test

.PHONY: install
install:
	install -Dm755 bin/aur-release $(DESTDIR)$(PREFIX)/bin/aur-release

.PHONY: uninstall
uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/aur-release

.PHONY: distcheck
distcheck:
	makepkg --clean --install
	$(RM) -rf aur-release
	$(RM) -rf aur-release-*.pkg.tar.zst

.PHONY: release
release: distcheck
	./bin/aur-release \
	  -c 'git checkout master -- PKGBUILD' \
	  -d \
	  -n \
	  aur-release-git

.PHONY: install.local
install.local: PREFIX=$(HOME)/.local
install.local: install

.PHONY: uninstall.local
uninstall.local: PREFIX=$(HOME)/.local
uninstall.local: uninstall
