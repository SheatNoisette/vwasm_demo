FROM emscripten/emsdk:latest

# Add vlang layer
ENV VVV  /opt/vlang
ENV PATH "/opt/vlang::${PATH}"
RUN git clone https://github.com/vlang/v /opt/vlang && cd /opt/vlang && make && ./v symlink
