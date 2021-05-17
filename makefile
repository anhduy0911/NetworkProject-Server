CXX_STD_FLAGS := -std=c++17

G_BIN_DIR := $(shell realpath ./bin)
G_OBJ_DIR := $(shell realpath ./obj)

export CXX_STD_FLAGS
export G_BIN_DIR
export G_OBJ_DIR

CXX_DEBUG_FLAGS := $(if $(DEBUG), -g,)
export CXX_DEBUG_FLAGS

all: build_protobuf build_server build_client build_gamelogic
	

build_protobuf:
	$(MAKE) -C protobuf

build_server:
	$(MAKE) -C server

build_client:
	$(MAKE) -C client

build_gamelogic:
	$(MAKE) -C gamelogic

.PHONY: clean

clean:
	$(MAKE) -C protobuf clean
	$(MAKE) -C server clean
	$(MAKE) -C client clean
	$(MAKE) -C gamelogic clean

	rm -rf $(G_OBJ_DIR)