// machine generated, do not edit

module sokol::stm;
import sokol;

extern fn void setup() @extern("stm_setup");
extern fn ulong now() @extern("stm_now");
extern fn ulong diff(ulong new_ticks, ulong old_ticks) @extern("stm_diff");
extern fn ulong since(ulong start_ticks) @extern("stm_since");
extern fn ulong laptime(ulong* last_time) @extern("stm_laptime");
extern fn ulong round_to_common_refresh_rate(ulong frame_ticks) @extern("stm_round_to_common_refresh_rate");
extern fn double sec(ulong ticks) @extern("stm_sec");
extern fn double ms(ulong ticks) @extern("stm_ms");
extern fn double us(ulong ticks) @extern("stm_us");
extern fn double ns(ulong ticks) @extern("stm_ns");


