#!/bin/bash
# Long-running: keeps NVML initialized in one nvidia-smi process instead of
# re-spawning + re-initializing NVML on every poll (waybar runs this once,
# not on a per-interval timer).
#
# Self-cleanup: waybar SIGKILLs this script the instant it dies (crash or
# kill -9), which never lets a bash `trap ... EXIT` here run. So nvidia-smi
# itself is launched through pdeathsig_exec.py, which registers its own
# kernel-level parent-death signal — it self-terminates as soon as THIS
# script dies, for any reason, without depending on this script's own
# signal handling.
exec 3< <(exec python3 ~/.config/waybar/scripts/pdeathsig_exec.py \
  nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits -lms 2000)

while read -r -u 3 temp; do
  printf '{ "text":"\xf3\xb0\xa2\xae %s°C", "tooltip":"GPU Temp: %s°C" }\n' "$temp" "$temp"
done
