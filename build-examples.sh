#!/usr/bin/env bash

script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
build_dir="$script_dir/build"

mkdir -p "$build_dir"
cd "$build_dir"

c3c compile --libdir .. --lib sokol ../examples/clear/*.c3 -o clear
c3c compile --libdir .. --lib sokol ../examples/triangle/*.c3 -o triangle
c3c compile --libdir .. --lib sokol ../examples/quad/*.c3 -o quad
c3c compile --libdir .. --lib sokol ../examples/bufferoffsets/*.c3 -o bufferoffsets
c3c compile --libdir .. --lib sokol ../examples/cube/*.c3 ../examples/math/*.c3 -o cube
c3c compile --libdir .. --lib sokol ../examples/texcube/*.c3 ../examples/math/*.c3 -o texcube
