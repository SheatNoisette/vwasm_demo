# Get compilers
EMSCRIPTEM_CC = $(shell which emcc)
V_CC = $(shell which v)

# Library c file
LIB = mylib.c

# Wrapper used for V => C
WRAPPER_FILE = mylib_wrapper.c
WRAPPER = mylib/$(WRAPPER_FILE)

# Tell Emscripten to treat the code as a library (no main function)
EMCC_FLAGS = --no-entry
# Export the functions that interface JS <=> Wasm
EMCC_FLAGS += -s "EXPORTED_RUNTIME_METHODS=['ccall','cwrap']"
# Tell Emscriptem to make add,hello_world, vhash and version functions visible
EMCC_FLAGS += -s EXPORTED_FUNCTIONS=_add,_hello_world,_version,_v_hash
# Force set linux macro
EMCC_FLAGS += -D__linux__

# Misc - Enable optimizations
EMCC_OPT = -O2

# Flags to the V Compiler
V_FLAGS = -prod -shared -gc none -d no_backtrace

all: lib emscripten

# Build the library using V, then inject emscripten wrapper into the C generated
# file
lib:
	$(V_CC) mylib $(V_FLAGS) -o $(LIB)
	cat $(WRAPPER) >> $(LIB)

# Generate a JS and a wasm file
emscripten:
	$(EMSCRIPTEM_CC) $(LIB) -o mylib.js $(EMCC_FLAGS) $(EMCC_OPT)

clean:
	$(RM) *.wasm *.js *.c *.h