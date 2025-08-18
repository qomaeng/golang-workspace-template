APP_DIR := ./app
PKG_DIR := ./pkg

APPS := user-service auth-service api-gateway
PKGS := core

.PHONY: all
all: build

# -------------------------------------------------------------------
# Delegate goals to sub makefile
# -------------------------------------------------------------------

# GENERAL_GOALS := build clean lint
#
# .PHONY: $(APPS)
# $(APPS):
# 	@$(MAKE) --no-print-directory -C $(APP_DIR)/$@ $(filter-out $@,$(MAKECMDGOALS))
#
# .PHONY: $(PKGS)
# $(PKGS):
# 	@$(MAKE) --no-print-directory -C $(PKG_DIR)/$@ $(filter-out $@,$(MAKECMDGOALS))
#
# $(filter-out $(APPS) $(PKGS) $(GENERAL_GOALS), $(MAKECMDGOALS)):
# 	@:

# -------------------------------------------------------------------
# General goals
# -------------------------------------------------------------------

.PHONY: build
build: pkg-build app-build

.PHONY: clean clean-all
clean: pkg-clean app-clean
clean-all: pkg-clean-all app-clean-all

.PHONY: lint
lint: pkg-lint app-lint

app-%:
	@for app in $(APPS); do \
		echo "==> $* on $(APP_DIR)/$$app..."; \
		$(MAKE) --no-print-directory -C $(APP_DIR)/$$app $* $(MAKEFLAGS) || exit 1; \
	done

pkg-%:
	@for pkg in $(PKGS); do \
		echo "==> $* on $(PKG_DIR)/$$pkg..."; \
		$(MAKE) --no-print-directory -C $(PKG_DIR)/$$pkg $* $(MAKEFLAGS) || exit 1; \
	done
