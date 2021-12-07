#include <emscripten.h>

// -----------------------------------------------------------------------------
// Declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Wrapper
// -----------------------------------------------------------------------------


#ifdef __cplusplus
extern "C" {
#endif

EMSCRIPTEN_KEEPALIVE void hello_world() {
    mylib_hello_world();
}

EMSCRIPTEN_KEEPALIVE int add(int a, int b) {
    return mylib_add(a, b);
}

EMSCRIPTEN_KEEPALIVE int version() {
    return mylib_version();
}

#ifdef __cplusplus
}
#endif