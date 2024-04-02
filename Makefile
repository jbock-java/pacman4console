prefix=${HOME}/sw/pacman
bindir=$(prefix)/bin
datarootdir=$(prefix)/share

all:
	gcc -I ${HOME}/sw/glibc/include -I ${HOME}/sw/ncurses/include -I ${HOME}/sw/ncurses/include/ncurses -L ${HOME}/sw/ncurses/lib64 -static -o pacman pacman.c -lncurses

pacmanedit:
	gcc pacmanedit.c -o pacmanedit -DDATAROOTDIR=\"$(datarootdir)\" $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -lncurses

install: all pacmanedit
	mkdir -p $(DESTDIR)$(bindir)
	cp pacman $(DESTDIR)$(bindir)
	cp pacmanedit $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(datarootdir)/pacman
	cp -fR Levels $(DESTDIR)$(datarootdir)/pacman/Levels
	chmod 750 $(DESTDIR)$(bindir)/pacman
	chmod 750 $(DESTDIR)$(bindir)/pacmanedit
	chmod -R 750 $(DESTDIR)$(datarootdir)/pacman

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
