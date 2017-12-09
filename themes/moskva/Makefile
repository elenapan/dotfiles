SASS=sassc
SASSFLAGS= -I
GLIB_COMPILE_RESOURCES=glib-compile-resources
RES_DIR=gtk-3.0
SCSS_DIR=$(RES_DIR)/scss
DIST_DIR=$(RES_DIR)/dist
RES_DIR320=gtk-3.20
SCSS_DIR320=$(RES_DIR320)/scss
DIST_DIR320=$(RES_DIR320)/dist
INSTALL_DIR=$(DESTDIR)/usr/share/themes/Numix
ROOT_DIR=${PWD}
UTILS=scripts/utils.sh

gtk3: clean gresource_gtk3
gtk320: clean gresource_gtk320
all: clean gresource

css_gtk3:
	mkdir -p $(DIST_DIR)
	$(SASS) $(SASSFLAGS) "$(SCSS_DIR)" "$(SCSS_DIR)/gtk.scss" "$(DIST_DIR)/gtk.css"
ifneq ("$(wildcard $(SCSS_DIR)/gtk-dark.scss)","")
	$(SASS) $(SASSFLAGS) "$(SCSS_DIR)" "$(SCSS_DIR)/gtk-dark.scss" "$(DIST_DIR)/gtk-dark.css"
else
	cp "$(DIST_DIR)/gtk.css" "$(DIST_DIR)/gtk-dark.css"
endif
css_gtk320:
	mkdir -p $(DIST_DIR320)
	$(SASS) $(SASSFLAGS) "$(SCSS_DIR320)" "$(SCSS_DIR320)/gtk.scss" "$(DIST_DIR320)/gtk.css"
ifneq ("$(wildcard $(SCSS_DIR320)/gtk-dark.scss)","")
	$(SASS) $(SASSFLAGS) "$(SCSS_DIR320)" "$(SCSS_DIR320)/gtk-dark.scss" "$(DIST_DIR320)/gtk-dark.css"
else
	cp "$(DIST_DIR320)/gtk.css" "$(DIST_DIR320)/gtk-dark.css"
endif
css: css_gtk3 css_gtk320

gresource_gtk3: css_gtk3
	$(GLIB_COMPILE_RESOURCES) --sourcedir="$(RES_DIR)" "$(RES_DIR)/gtk.gresource.xml"
gresource_gtk320: css_gtk320
	$(GLIB_COMPILE_RESOURCES) --sourcedir="$(RES_DIR320)" "$(RES_DIR320)/gtk.gresource.xml"
gresource: gresource_gtk3 gresource_gtk320

watch: clean
	while true; do \
		make gresource; \
		inotifywait @gtk.gresource -qr -e modify -e create -e delete "$(RES_DIR)"; \
	done

clean:
	rm -rf "$(DIST_DIR)"
	rm -f "$(RES_DIR)/gtk.gresource"
	rm -rf "$(DIST_DIR320)"
	rm -f "$(RES_DIR320)/gtk.gresource"
	rm -rf "$(ROOT_DIR)/dist"

install: all
	$(UTILS) install "$(INSTALL_DIR)"

uninstall:
	rm -rf "$(INSTALL_DIR)"

changes:
	$(UTILS) changes

zip: all
	mkdir "$(ROOT_DIR)/dist"
	$(UTILS) install "$(ROOT_DIR)/dist/$$(basename '$(INSTALL_DIR)')"
	cd "$(ROOT_DIR)/dist" && zip --symlinks -rq "$$(basename '$(INSTALL_DIR)')" "$$(basename '$(INSTALL_DIR)')"


.PHONY: all
.PHONY: css
.PHONY: watch
.PHONY: gresource
.PHONY: clean
.PHONY: install
.PHONY: uninstall
.PHONY: changes

.DEFAULT_GOAL := all

# vim: set ts=4 sw=4 tw=0 noet :
