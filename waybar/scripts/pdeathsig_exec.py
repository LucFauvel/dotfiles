#!/usr/bin/env python3
# Runs argv[1:] with PR_SET_PDEATHSIG registered, so the kernel sends SIGTERM
# to this process (replaced in-place by exec) the moment its direct parent
# dies for ANY reason, including SIGKILL. Needed because a bash `trap ... EXIT`
# in the parent can't run at all if the parent itself is killed with SIGKILL.
import ctypes
import os
import signal
import sys

libc = ctypes.CDLL("libc.so.6", use_errno=True)
PR_SET_PDEATHSIG = 1
libc.prctl(PR_SET_PDEATHSIG, signal.SIGTERM, 0, 0, 0)

os.execvp(sys.argv[1], sys.argv[1:])
