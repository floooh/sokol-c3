// machine generated, do not edit

module sokol::saudio;
import sokol;

extern fn void setup(SaudioDesc* desc) @extern("saudio_setup");
extern fn void shutdown() @extern("saudio_shutdown");
extern fn bool isvalid() @extern("saudio_isvalid");
extern fn void* userdata() @extern("saudio_userdata");
extern fn SaudioDesc query_desc() @extern("saudio_query_desc");
extern fn CInt sample_rate() @extern("saudio_sample_rate");
extern fn CInt buffer_frames() @extern("saudio_buffer_frames");
extern fn CInt channels() @extern("saudio_channels");
extern fn bool suspended() @extern("saudio_suspended");
extern fn CInt expect() @extern("saudio_expect");
extern fn CInt push(float* frames, CInt num_frames) @extern("saudio_push");

enum SaudioLogItem : const int
{
    OK = 0,
    MALLOC_FAILED = 1,
    ALSA_SND_PCM_OPEN_FAILED = 2,
    ALSA_FLOAT_SAMPLES_NOT_SUPPORTED = 3,
    ALSA_REQUESTED_BUFFER_SIZE_NOT_SUPPORTED = 4,
    ALSA_REQUESTED_CHANNEL_COUNT_NOT_SUPPORTED = 5,
    ALSA_SND_PCM_HW_PARAMS_SET_RATE_NEAR_FAILED = 6,
    ALSA_SND_PCM_HW_PARAMS_FAILED = 7,
    ALSA_PTHREAD_CREATE_FAILED = 8,
    WASAPI_CREATE_EVENT_FAILED = 9,
    WASAPI_CREATE_DEVICE_ENUMERATOR_FAILED = 10,
    WASAPI_GET_DEFAULT_AUDIO_ENDPOINT_FAILED = 11,
    WASAPI_DEVICE_ACTIVATE_FAILED = 12,
    WASAPI_AUDIO_CLIENT_INITIALIZE_FAILED = 13,
    WASAPI_AUDIO_CLIENT_GET_BUFFER_SIZE_FAILED = 14,
    WASAPI_AUDIO_CLIENT_GET_SERVICE_FAILED = 15,
    WASAPI_AUDIO_CLIENT_SET_EVENT_HANDLE_FAILED = 16,
    WASAPI_CREATE_THREAD_FAILED = 17,
    AAUDIO_STREAMBUILDER_OPEN_STREAM_FAILED = 18,
    AAUDIO_PTHREAD_CREATE_FAILED = 19,
    AAUDIO_RESTARTING_STREAM_AFTER_ERROR = 20,
    USING_AAUDIO_BACKEND = 21,
    AAUDIO_CREATE_STREAMBUILDER_FAILED = 22,
    COREAUDIO_NEW_OUTPUT_FAILED = 23,
    COREAUDIO_ALLOCATE_BUFFER_FAILED = 24,
    COREAUDIO_START_FAILED = 25,
    BACKEND_BUFFER_SIZE_ISNT_MULTIPLE_OF_PACKET_SIZE = 26,
}

struct SaudioLogger
{
    LogCb func;
    void* user_data;
}

struct SaudioAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SaudioDesc
{
    CInt sample_rate;
    CInt num_channels;
    CInt buffer_frames;
    CInt packet_frames;
    CInt num_packets;
    StreamCb stream_cb;
    StreamDataCb stream_userdata_cb;
    void* user_data;
    SaudioAllocator allocator;
    SaudioLogger logger;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias StreamCb = fn void(float*, CInt, CInt);
alias StreamDataCb = fn void(float*, CInt, CInt, void*);

