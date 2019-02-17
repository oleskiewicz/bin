PREFIX = /usr/local
BIN    = $(shell find . -type f -perm 755 -not -path '*/\.*')
MAN    = $(BIN:=.1.gz)

install:
	install -d $(PREFIX)/bin
	install -m 755 $(BIN) $(PREFIX)/bin
	install -d $(PREFIX)/share/man/man1
	install -m 644 $(MAN) $(PREFIX)/share/man/man1

uninstall:
	cd $(PREFIX)/bin && rm -f $(BIN)
	cd $(PREFIX)/share/man/man1 && rm -f $(MAN)

clean:
	rm -f $(MAN)

.SUFFIXES: .1 .1.gz
.1.1.gz:
	gzip -9 $<
