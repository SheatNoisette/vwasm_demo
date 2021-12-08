module mylib

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

[export: 'mylib_v_hash']
pub fn v_hash() string {
	return @VHASH
}

[export: 'mylib_string_custom_reverse']
pub fn string_custom_reverse(input string) string {
	return input.reverse()
}
