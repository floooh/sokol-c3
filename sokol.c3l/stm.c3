// machine generated, do not edit

module sokol::stm;
import sokol;

extern fn void setup() @cname("stm_setup");
extern fn ulong now() @cname("stm_now");
extern fn ulong diff(ulong new_ticks, ulong old_ticks) @cname("stm_diff");
extern fn ulong since(ulong start_ticks) @cname("stm_since");
extern fn ulong laptime(ulong* last_time) @cname("stm_laptime");
extern fn ulong round_to_common_refresh_rate(ulong frame_ticks) @cname("stm_round_to_common_refresh_rate");
extern fn double sec(ulong ticks) @cname("stm_sec");
extern fn double ms(ulong ticks) @cname("stm_ms");
extern fn double us(ulong ticks) @cname("stm_us");
extern fn double ns(ulong ticks) @cname("stm_ns");


