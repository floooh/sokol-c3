// machine generated, do not edit

module sokol::sfetch;
import sokol;

extern fn void setup(SfetchDesc* desc) @cname("sfetch_setup");
extern fn void shutdown() @cname("sfetch_shutdown");
extern fn bool valid() @cname("sfetch_valid");
extern fn SfetchDesc desc() @cname("sfetch_desc");
extern fn CInt max_userdata_bytes() @cname("sfetch_max_userdata_bytes");
extern fn CInt max_path() @cname("sfetch_max_path");
extern fn SfetchHandle send(SfetchRequest* request) @cname("sfetch_send");
extern fn bool handle_valid(SfetchHandle h) @cname("sfetch_handle_valid");
extern fn void dowork() @cname("sfetch_dowork");
extern fn void bind_buffer(SfetchHandle h, SfetchRange buffer) @cname("sfetch_bind_buffer");
extern fn void* unbind_buffer(SfetchHandle h) @cname("sfetch_unbind_buffer");
extern fn void cancel(SfetchHandle h) @cname("sfetch_cancel");
extern fn void pause(SfetchHandle h) @cname("sfetch_pause");
extern fn void continue_fetching(SfetchHandle h) @cname("sfetch_continue");

constdef SfetchLogItem : int
{
    OK = 0,
    MALLOC_FAILED = 1,
    FILE_PATH_UTF8_DECODING_FAILED = 2,
    SEND_QUEUE_FULL = 3,
    REQUEST_CHANNEL_INDEX_TOO_BIG = 4,
    REQUEST_PATH_IS_NULL = 5,
    REQUEST_PATH_TOO_LONG = 6,
    REQUEST_CALLBACK_MISSING = 7,
    REQUEST_CHUNK_SIZE_GREATER_BUFFER_SIZE = 8,
    REQUEST_USERDATA_PTR_IS_SET_BUT_USERDATA_SIZE_IS_NULL = 9,
    REQUEST_USERDATA_PTR_IS_NULL_BUT_USERDATA_SIZE_IS_NOT = 10,
    REQUEST_USERDATA_SIZE_TOO_BIG = 11,
    CLAMPING_NUM_CHANNELS_TO_MAX_CHANNELS = 12,
    REQUEST_POOL_EXHAUSTED = 13,
}

struct SfetchLogger
{
    LogCb func;
    void* user_data;
}

struct SfetchRange
{
    void* ptr;
    usz size;
}

struct SfetchAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SfetchDesc
{
    uint max_requests;
    uint num_channels;
    uint num_lanes;
    SfetchAllocator allocator;
    SfetchLogger logger;
}

struct SfetchHandle
{
    uint id;
}

constdef SfetchError : int
{
    NO_ERROR = 0,
    FILE_NOT_FOUND = 1,
    NO_BUFFER = 2,
    BUFFER_TOO_SMALL = 3,
    UNEXPECTED_EOF = 4,
    INVALID_HTTP_STATUS = 5,
    CANCELLED = 6,
    JS_OTHER = 7,
}

struct SfetchResponse
{
    SfetchHandle handle;
    bool dispatched;
    bool fetched;
    bool paused;
    bool finished;
    bool failed;
    bool cancelled;
    SfetchError error_code;
    uint channel;
    uint lane;
    ZString path;
    void* user_data;
    uint data_offset;
    SfetchRange data;
    SfetchRange buffer;
}

struct SfetchRequest
{
    uint channel;
    ZString path;
    ResponseCb callback;
    uint chunk_size;
    SfetchRange buffer;
    SfetchRange user_data;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias ResponseCb = fn void(SfetchResponse*);

