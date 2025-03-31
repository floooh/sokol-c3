// machine generated, do not edit

module sokol::saudio;
import sokol;

extern fn void setup(Desc* desc) @extern("saudio_setup");
extern fn void shutdown() @extern("saudio_shutdown");
extern fn bool isvalid() @extern("saudio_isvalid");
extern fn void* userdata() @extern("saudio_userdata");
extern fn Desc query_desc() @extern("saudio_query_desc");
extern fn CInt sample_rate() @extern("saudio_sample_rate");
extern fn CInt buffer_frames() @extern("saudio_buffer_frames");
extern fn CInt channels() @extern("saudio_channels");
extern fn bool suspended() @extern("saudio_suspended");
extern fn CInt expect() @extern("saudio_expect");
extern fn CInt push(float* frames, CInt num_frames) @extern("saudio_push");

typedef LogItem = int;
module sokol::saudio::log_item;
const LogItem OK = 0;
const LogItem MALLOC_FAILED = 1;
const LogItem ALSA_SND_PCM_OPEN_FAILED = 2;
const LogItem ALSA_FLOAT_SAMPLES_NOT_SUPPORTED = 3;
const LogItem ALSA_REQUESTED_BUFFER_SIZE_NOT_SUPPORTED = 4;
const LogItem ALSA_REQUESTED_CHANNEL_COUNT_NOT_SUPPORTED = 5;
const LogItem ALSA_SND_PCM_HW_PARAMS_SET_RATE_NEAR_FAILED = 6;
const LogItem ALSA_SND_PCM_HW_PARAMS_FAILED = 7;
const LogItem ALSA_PTHREAD_CREATE_FAILED = 8;
const LogItem WASAPI_CREATE_EVENT_FAILED = 9;
const LogItem WASAPI_CREATE_DEVICE_ENUMERATOR_FAILED = 10;
const LogItem WASAPI_GET_DEFAULT_AUDIO_ENDPOINT_FAILED = 11;
const LogItem WASAPI_DEVICE_ACTIVATE_FAILED = 12;
const LogItem WASAPI_AUDIO_CLIENT_INITIALIZE_FAILED = 13;
const LogItem WASAPI_AUDIO_CLIENT_GET_BUFFER_SIZE_FAILED = 14;
const LogItem WASAPI_AUDIO_CLIENT_GET_SERVICE_FAILED = 15;
const LogItem WASAPI_AUDIO_CLIENT_SET_EVENT_HANDLE_FAILED = 16;
const LogItem WASAPI_CREATE_THREAD_FAILED = 17;
const LogItem AAUDIO_STREAMBUILDER_OPEN_STREAM_FAILED = 18;
const LogItem AAUDIO_PTHREAD_CREATE_FAILED = 19;
const LogItem AAUDIO_RESTARTING_STREAM_AFTER_ERROR = 20;
const LogItem USING_AAUDIO_BACKEND = 21;
const LogItem AAUDIO_CREATE_STREAMBUILDER_FAILED = 22;
const LogItem USING_SLES_BACKEND = 23;
const LogItem SLES_CREATE_ENGINE_FAILED = 24;
const LogItem SLES_ENGINE_GET_ENGINE_INTERFACE_FAILED = 25;
const LogItem SLES_CREATE_OUTPUT_MIX_FAILED = 26;
const LogItem SLES_MIXER_GET_VOLUME_INTERFACE_FAILED = 27;
const LogItem SLES_ENGINE_CREATE_AUDIO_PLAYER_FAILED = 28;
const LogItem SLES_PLAYER_GET_PLAY_INTERFACE_FAILED = 29;
const LogItem SLES_PLAYER_GET_VOLUME_INTERFACE_FAILED = 30;
const LogItem SLES_PLAYER_GET_BUFFERQUEUE_INTERFACE_FAILED = 31;
const LogItem COREAUDIO_NEW_OUTPUT_FAILED = 32;
const LogItem COREAUDIO_ALLOCATE_BUFFER_FAILED = 33;
const LogItem COREAUDIO_START_FAILED = 34;
const LogItem BACKEND_BUFFER_SIZE_ISNT_MULTIPLE_OF_PACKET_SIZE = 35;
module sokol::saudio;
import sokol;

struct Logger
{
    LogCb func;
    void* user_data;
}

struct Allocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct Desc
{
    CInt sample_rate;
    CInt num_channels;
    CInt buffer_frames;
    CInt packet_frames;
    CInt num_packets;
    StreamCb stream_cb;
    StreamDataCb stream_userdata_cb;
    void* user_data;
    Allocator allocator;
    Logger logger;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias StreamCb = fn void(float*, CInt, CInt);
alias StreamDataCb = fn void(float*, CInt, CInt, void*);

