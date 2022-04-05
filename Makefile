NAME = aur-release
PREFIX ?= /usr/local

VERSION = 1.0.1

.PHONY: test
test:
	cram test

.PHONY: install
install:
	install -Dm755 bin/aur-release $(DESTDIR)$(PREFIX)/bin/aur-release

.PHONY: uninstall
uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/aur-release

.PHONY: release
release:
	./bin/aur-release \
	  -d \
	  -n \
	  aur-release-git v$(VERSION)

.PHONY: install.local
install.local: PREFIX=$(HOME)/.local
install.local: install

.PHONY: uninstall.local
uninstall.local: PREFIX=$(HOME)/.local
uninstall.local: uninstall
