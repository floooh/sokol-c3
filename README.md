[![C3](https://github.com/floooh/sokol-c3/actions/workflows/build.yml/badge.svg)](https://github.com/floooh/sokol-c3/actions/workflows/build.yml)

Auto-generated [C3](https://github.com/c3lang/c3c) bindings for the [sokol headers](https://github.com/floooh/sokol).

For C3 version 0.8.x

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
    c3c compile-run --libdir .. --lib sokol ../examples/instancing-compute/*.c3 ../examples/math/*.c3 -o instancing-compute
    c3c compile-run --libdir .. --lib sokol ../examples/mrt/*.c3 ../examples/math/*.c3 -o mrt
    ```

    By default, the backend 3D API will be selected based on the target platform:

    - macOS: Metal
    - Windows: D3D11
    - Linux: GL

    To change the default backend edit `sokol.c3l/manifest.json`.

## Dear ImGui integration

> _The section below is LLM-generated._

sokol-c3 ships bindings for `sokol_imgui.h`, `sokol_gfx_imgui.h` and
`sokol_app_imgui.h` as the C3 modules `sokol::simgui`, `sokol::sgimgui` and
`sokol::sappimgui`. `sokol.c3l/c/sokol.c` does **not** `#include` these
headers — Dear ImGui (C++) is not part of the library and must be supplied
by your project.

To use them:

1. Clone [dcimgui](https://github.com/floooh/dcimgui) (an all-in-one Dear
   ImGui + `cimgui.h` C-API drop) into your project. Use `src/` for the
   regular flavour or `src-docking/` for the docking flavour.

2. Compile `sokol.c3l/c/sokol_imgui.c` (and the other stubs as needed)
   against your dcimgui checkout. The backend define (`-DSOKOL_METAL`
   below, or `-DSOKOL_D3D11`/`-DSOKOL_GLCORE`/`-DSOKOL_GLES3`) must
   match the one sokol-gfx was built with — otherwise the imgui
   renderer picks a different backend than sokol-gfx. Example (macOS
   arm64 Metal):

    ```bash
    c++ -c -O2 -std=c++17 -I path/to/dcimgui/src \
        path/to/dcimgui/src/*.cpp
    ar rcs libimgui.a *.o
    MACOSX_DEPLOYMENT_TARGET=14.0 cc -c -O2 -x objective-c -arch arm64 \
        -std=c11 -DIMPL -DSOKOL_METAL \
        -I path/to/dcimgui/src \
        path/to/sokol-c3/sokol.c3l/c/sokol_imgui.c
    ar rcs libsokol_imgui.a sokol_imgui.o
    ```

3. `import sokol::simgui;` in your C3 code. Add `libimgui.a`,
   `libsokol_imgui.a` and `-lc++` (or `-lstdc++` on Linux) to your
   program's link options.

The same flow applies to `sokol_gfx_imgui.h` and `sokol_app_imgui.h`.
