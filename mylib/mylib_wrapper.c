#include <emscripten.h>
// Should be already included
#include <string.h>

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

EMSCRIPTEN_KEEPALIVE char* v_hash() {
    string hsh = mylib_v_hash();
    return (char *)hsh.str;
}

EMSCRIPTEN_KEEPALIVE char* string_custom_reverse(char* input) {
    string tmp;
    tmp.str = (byte *)input;
    tmp.len = strlen(input);
    tmp.is_lit = 1;

    string hsh = mylib_string_custom_reverse(tmp);
    return (char *)hsh.str;
}

#ifdef __cplusplus
}
#endif