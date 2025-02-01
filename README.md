[![C3](https://github.com/floooh/sokol-c3/actions/workflows/main.yml/badge.svg)](https://github.com/floooh/sokol-c3/actions/workflows/main.yml)

Auto-generated [C3](https://github.com/c3lang/c3c) bindings for the [sokol headers](https://github.com/floooh/sokol).

For C3 version 0.6.6

To include sokol in your project you can copy the [sokol.c3l](sokol.c3l/) directory.

## BUILD

Supported platforms are: Windows, macOS, Linux (with X11)

On Linux install the following packages: libglu1-mesa-dev, mesa-common-dev, xorg-dev, libasound-dev
(or generally: the dev packages required for X11, GL and ALSA development)

1. Create a build directory and cd into it:
    ```bash
    mkdir build
    cd build
    ```

2. Build and run the samples:
    ```bash
    c3c compile-run --libdir .. --lib sokol ../examples/clear/*.c3 -o clear
    c3c compile-run --libdir .. --lib sokol ../examples/triangle/*.c3 -o triangle
    c3c compile-run --libdir .. --lib sokol ../examples/quad/*.c3 -o quad
    c3c compile-run --libdir .. --lib sokol ../examples/bufferoffsets/*.c3 -o bufferoffsets
    c3c compile-run --libdir .. --lib sokol ../examples/cube/*.c3 ../examples/math/*.c3 -o cube
    c3c compile-run --libdir .. --lib sokol ../examples/noninterleaved/*.c3 ../examples/math/*.c3 -o noninterleaved
    c3c compile-run --libdir .. --lib sokol ../examples/texcube/*.c3 ../examples/math/*.c3 -o texcube
    c3c compile-run --libdir .. --lib sokol ../examples/vertexpull/*.c3 ../examples/math/*.c3 -o vertexpull
    c3c compile-run --libdir .. --lib sokol ../examples/shapes/*.c3 ../examples/math/*.c3 -o shapes
    c3c compile-run --libdir .. --lib sokol ../examples/offscreen/*.c3 ../examples/math/*.c3 -o offscreen
    c3c compile-run --libdir .. --lib sokol ../examples/instancing/*.c3 ../examples/math/*.c3 -o instancing
    c3c compile-run --libdir .. --lib sokol ../examples/mrt/*.c3 ../examples/math/*.c3 -o mrt
    ```

    By default, the backend 3D API will be selected based on the target platform:

    - macOS: Metal
    - Windows: D3D11
    - Linux: GL

    To change the default backend edit `sokol.c3l/manifest.json`.
