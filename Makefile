prefix=${HOME}/sw/pacman
bindir=$(prefix)/bin
datarootdir=$(prefix)/share

all:
	gcc -g pacman.c -o pacman -DDATAROOTDIR=\"$(datarootdir)\" $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -lncurses

pacmanedit:
	gcc pacmanedit.c -o pacmanedit -DDATAROOTDIR=\"$(datarootdir)\" $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -lncurses

install: all pacmanedit
	mkdir -p $(DESTDIR)$(bindir)
	cp pacman $(DESTDIR)$(bindir)
	cp pacmanedit $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(datarootdir)/pacman
	cp -fR Levels/ $(DESTDIR)$(datarootdir)/pacman/
	chmod 750 $(DESTDIR)$(bindir)/pacman
	chmod 750 $(DESTDIR)$(bindir)/pacmanedit
	chmod 750 $(DESTDIR)$(datarootdir)/pacman/ -R

uninstall:
	rm -f $(DESTDIR)$(bindir)/pacman
	rm -f $(DESTDIR)$(bindir)/pacmanedit
	rm -f $(DESTDIR)$(datarootdir)/pacman/Levels/level0[1-9].dat
	rm -f $(DESTDIR)$(datarootdir)/pacman/Levels/README
	rm -f $(DESTDIR)$(datarootdir)/pacman/Levels/template.dat
	if [ -e $(DESTDIR)$(datarootdir)/pacman/Levels/ ] ; then rmdir $(DESTDIR)$(datarootdir)/pacman/Levels/ ; fi
	if [ -e $(DESTDIR)$(datarootdir)/pacman/ ] ; then rmdir $(DESTDIR)$(datarootdir)/pacman/ ; fi

clean:
	rm -f pacman
	rm -f pacmanedit
