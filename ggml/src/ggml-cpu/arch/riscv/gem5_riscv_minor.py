# gem5_riscv_minor.py
# Run with:
# ./build/RISCV/gem5.opt gem5_riscv_minor.py
#
# Models an in-order RISC-V core with caches approximating
# a SiFive X280-class edge AI core.

import argparse
import sys

from gem5.components.boards.simple_board import SimpleBoard
from gem5.components.cachehierarchies.classic.private_l1_private_l2_cache_hierarchy import (
    PrivateL1PrivateL2CacheHierarchy,
)
from gem5.components.memory.single_channel import SingleChannelDDR4_2400
from gem5.components.processors.simple_processor import SimpleProcessor
from gem5.components.processors.cpu_types import CPUTypes
from gem5.isas import ISA
from gem5.resources.resource import BinaryResource
from gem5.simulate.simulator import Simulator

# ── Parse the binary path ─────────────────────────────────────────────────────
parser = argparse.ArgumentParser()
parser.add_argument("--cmd",      required=True, help="Path to static RISC-V binary")
parser.add_argument("--options",  default="",    help="Arguments to pass to binary")
parser.add_argument("--l1d",      default="32kB", help="L1 data cache size")
parser.add_argument("--l1i",      default="32kB", help="L1 instruction cache size")
parser.add_argument("--l2",       default="512kB", help="L2 cache size")
parser.add_argument("--clock",    default="1.5GHz", help="CPU clock")
args = parser.parse_args()

# ── Cache hierarchy ───────────────────────────────────────────────────────────
# Private L1 I/D + private L2 — matches SiFive X280 cache layout
cache_hierarchy = PrivateL1PrivateL2CacheHierarchy(
    l1d_size=args.l1d,
    l1i_size=args.l1i,
    l2_size=args.l2,
)

# ── Memory ────────────────────────────────────────────────────────────────────
# 2GB DDR4 — bandwidth will show the amortisation benefit
memory = SingleChannelDDR4_2400("2GiB")

# ── Processor ─────────────────────────────────────────────────────────────────
# MinorCPU = gem5's in-order pipeline model
# This is the right model for SiFive X280/X390 class cores
processor = SimpleProcessor(
    cpu_type=CPUTypes.MINOR,
    isa=ISA.RISCV,
    num_cores=1,
)

# ── Board ─────────────────────────────────────────────────────────────────────
board = SimpleBoard(
    clk_freq=args.clock,
    processor=processor,
    memory=memory,
    cache_hierarchy=cache_hierarchy,
)

# ── Workload ──────────────────────────────────────────────────────────────────
cmd = [args.cmd] + (args.options.split() if args.options else [])
board.set_se_binary_workload(
    BinaryResource(local_path=args.cmd),
)

# ── Run ───────────────────────────────────────────────────────────────────────
simulator = Simulator(board=board)
simulator.run()

print(f"\nSimulation complete.")
print(f"Stats written to: m5out/stats.txt")
