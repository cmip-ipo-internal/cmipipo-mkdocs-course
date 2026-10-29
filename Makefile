# ── CMIP IPO MkDocs course ──────────────────────────────────────────────────
# Run every command from the repository root.
# Config lives in src/mkdocs.yml. Built site goes to build/.

MKDOCS_CONFIG := src/mkdocs.yml
BUILD_DIR     := build
PORT          ?= 48217
ADDR          := 127.0.0.1:$(PORT)
PYTHON        ?= python

# mkdocs watches docs/ and the config by default. These add the theme
# overrides and hooks, so template edits also trigger a reload.
#
# --livereload is passed explicitly on purpose. mkdocs sets it by default via a
# hidden click flag, and click 8.3 does not apply that default, which silently
# disables watching entirely. Passing it works on every click version.
SERVE_OPTS    := --livereload --watch src/overrides --watch src/hooks

.DEFAULT_GOAL := help
.PHONY: help install build serve dev kill clean

help:
	@echo ""
	@echo "  make install  Install Python dependencies (src/requirements.txt)"
	@echo "  make build    Build the static site into $(BUILD_DIR)/"
	@echo "  make serve    Serve with live reload at http://$(ADDR)"
	@echo "  make dev      Restart the server and open it in your browser"
	@echo "  make kill     Stop everything listening on port $(PORT)"
	@echo "  make clean    Remove $(BUILD_DIR)/"
	@echo ""
	@echo "  Override the port:    make serve PORT=7654"
	@echo "  Override the Python:  make install PYTHON=python3"
	@echo ""

install:
	$(PYTHON) -m pip install -r src/requirements.txt

build:
	mkdocs build --config-file $(MKDOCS_CONFIG)

serve:
	mkdocs serve --config-file $(MKDOCS_CONFIG) --dev-addr $(ADDR) $(SERVE_OPTS)

# The server runs in the foreground so it keeps live-reloading and Ctrl-C
# stops it. Only the browser-opening is backgrounded.
dev:
	-@pkill -f "[m]kdocs serve" 2>/dev/null || true
	@( sleep 2 && $(PYTHON) -m webbrowser http://$(ADDR)/ >/dev/null 2>&1 ) &
	mkdocs serve --config-file $(MKDOCS_CONFIG) --dev-addr $(ADDR) $(SERVE_OPTS)

kill:
	@pids=$$(lsof -ti tcp:$(PORT) -sTCP:LISTEN); \
	if [ -n "$$pids" ]; then \
		kill $$pids && echo "Stopped process(es) on port $(PORT): $$pids"; \
	else \
		echo "Nothing is listening on port $(PORT)"; \
	fi

clean:
	rm -rf $(BUILD_DIR)
