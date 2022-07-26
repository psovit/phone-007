FLUTTER ?= fvm flutter # $(shell command -v flutter 2> /dev/null)

.PHONY: run-web
run-web:
	$(FLUTTER) run -d chrome

.PHONY: run-web-html
run-web-html:
	$(FLUTTER) run -d chrome --web-renderer html

.PHONY: run-web-canvas
run-web-canvas:
	$(FLUTTER) run -d chrome --web-renderer canvaskit
