# V WebAssembly demo

Compile a simple V library into WebAssembly!

Require Emscripten or Docker

## Build

### emcc
```
make
```
### docker
```
docker run --rm -v $(pwd):/src qxip/emscripten-v:latest make
```

## Test
To see the output from the console, you need to run a simple web server.
You can use python:
```
python -m http.server 8080
```

## License
No credit required but appreciated - CC0
