module mylib

// Hide signal from WASM
#define signal(x,y)

[export: 'mylib_add']
pub fn add(a int, b int) int {
	return a + b
}

[export: 'mylib_hello_world']
pub fn hello_world() {
	println("Hello, world!")
}

[export: 'mylib_version']
pub fn version() int {
	return 42
}
