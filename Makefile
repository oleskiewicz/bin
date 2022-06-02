PREFIX?=/usr/local
BIN = $(shell find . -type f -perm 755 -not -path '*/\.*')
MAN = $(shell find . -type f -name '*.[0-9]')

install:
	install -d $(PREFIX)/bin
	install -m 755 $(BIN) $(PREFIX)/bin
	install -d $(PREFIX)/share/man/man1
	install -m 644 $(MAN) $(PREFIX)/share/man/man1

uninstall:
	cd $(PREFIX)/bin && rm -f $(BIN)
	cd $(PREFIX)/share/man/man1 && rm -f $(MAN)
