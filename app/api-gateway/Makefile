OUT_DIR ?= ./bin
OUT_NAME ?= api-gateway
ABS_OUT := $(abspath $(OUT_DIR)/$(OUT_NAME))

ifeq ($(ABS_OUT),/)
$(error ERROR: OUT_DIR/OUT_NAME must not be the root directory)
endif

.PHONY: build
build:
	@go build -o "$(ABS_OUT)"

.PHONY: clean
clean:
	@rm -f "$(ABS_OUT)"

.PHONY: clean-all
clean-all: clean
	@go clean -cache -testcache -modcache -i

.PHONY: lint
lint:
	@:
