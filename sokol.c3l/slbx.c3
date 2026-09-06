// machine generated, do not edit

module sokol::slbx;
import sokol;

extern fn SlbxViewport letterbox(CInt width, CInt height, SlbxLetterboxDesc* desc) @cname("slbx_letterbox");

struct SlbxBorder
{
    CInt left;
    CInt right;
    CInt top;
    CInt bottom;
}

constdef SlbxAnchor : uint
{
    CENTER = 0,
    TOP = 1,
    BOTTOM = 2,
    LEFT = 3,
    RIGHT = 4,
}

struct SlbxLetterboxDesc
{
    float content_aspect_ratio;
    SlbxAnchor anchor;
    SlbxBorder border;
}

struct SlbxViewport
{
    CInt x;
    CInt y;
    CInt width;
    CInt height;
}


