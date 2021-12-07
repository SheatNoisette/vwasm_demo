EMSCRIPTEM_CC = $(shell which emcc)
V_CC = $(shell which v)

LIB = mylib.c
LIB_H = mylib.h

WRAPPER_FILE = mylib_wrapper.c
WRAPPER = mylib/$(WRAPPER_FILE)

EMCC_FLAGS = --no-entry -s "EXPORTED_RUNTIME_METHODS=['ccall','cwrap']" -s EXPORTED_FUNCTIONS=_add,_hello_world,_version
EMCC_OPT = -O2

all: lib emscripten

lib:
	$(V_CC) mylib -prod -shared -o $(LIB)
	cat $(WRAPPER) >> $(LIB)

emscripten:
	$(EMSCRIPTEM_CC) $(LIB) -o mylib.js $(EMCC_FLAGS) $(EMCC_OPT)

clean:
	$(RM) *.wasm *.js *.c *.h