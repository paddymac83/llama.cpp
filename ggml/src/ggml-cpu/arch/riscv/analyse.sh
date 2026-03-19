#!/usr/bin/env bash

SEP="────────────────────────────────────────────────────────"

kernel_body() {
    local file=$1
    local fn=$2
    if [[ "$file" == *.ll ]]; then
        awk "/define.*@${fn}[^a-zA-Z0-9_]/,/^[}]/" "$file"
    else
        awk "
            /^${fn}:/ { found=1 }
            found { print }
            /^[a-zA-Z_][a-zA-Z0-9_]*:/ && !/^${fn}:/ { if (found) exit }
        " "$file"
    fi
}

count() {
    echo "$1" | grep -cE "$2" 2>/dev/null || echo 0
}

report() {
    local label=$1 v48=$2 v416=$3
    printf "  %-44s %8s %12s\n" "$label" "$v48" "$v416"
}

header() {
    echo ""
    echo "$SEP"
    echo "  $1"
    echo "$SEP"
    printf "  %-44s %8s %12s\n" "Metric" "4x8" "4x16"
    printf "  %-44s %8s %12s\n" "------" "---" "----"
}

GEMM_FN="ggml_gemm_q4_0_8x8_q8_0"
GEMV_FN="ggml_gemv_q4_0_8x8_q8_0"
GEMM16_FN="ggml_gemm_q4_0_8x8_q8_0_4x16"

echo "Extracting kernel bodies..."
IR48=$(kernel_body  repack.ll    "$GEMM_FN")
IR48V=$(kernel_body repack.ll    "$GEMV_FN")
IR416=$(kernel_body repack_4x16.ll "$GEMM16_FN")

ASM48=$(kernel_body  repack.s    "$GEMM_FN")
ASM48V=$(kernel_body repack.s    "$GEMV_FN")
ASM416=$(kernel_body repack_4x16.s "$GEMM16_FN")

echo "IR48:  $(echo "$IR48"  | wc -l) lines"
echo "IR48V: $(echo "$IR48V" | wc -l) lines"
echo "IR416: $(echo "$IR416" | wc -l) lines"
echo "ASM48:  $(echo "$ASM48"  | wc -l) lines"
echo "ASM48V: $(echo "$ASM48V" | wc -l) lines"
echo "ASM416: $(echo "$ASM416" | wc -l) lines"

# ═══════════════════════════════════════════════════════
# LLVM IR — GEMM kernels
# ═══════════════════════════════════════════════════════
header "LLVM IR — GEMM kernels (prefill path)"

t48=$(echo "$IR48"   | grep -cE "^\s+[a-z%]")
t416=$(echo "$IR416" | grep -cE "^\s+[a-z%]")
report "Total IR instructions"               "$t48"  "$t416"

a48=$(count  "$IR48"  "alloca")
a416=$(count "$IR416" "alloca")
report "alloca (spills/frame slots)"         "$a48"  "$a416"

vi48=$(count  "$IR48"  "@llvm\.riscv\.")
vi416=$(count "$IR416" "@llvm\.riscv\.")
report "RVV intrinsic calls"                 "$vi48"  "$vi416"

wm48=$(count  "$IR48"  "llvm\.riscv\.vwmul\b")
wm416=$(count "$IR416" "llvm\.riscv\.vwmul\b")
report "vwmul intrinsics"                    "$wm48"  "$wm416"

wma48=$(count  "$IR48"  "llvm\.riscv\.vwmacc")
wma416=$(count "$IR416" "llvm\.riscv\.vwmacc")
report "vwmacc intrinsics"                   "$wma48"  "$wma416"

fm48=$(count  "$IR48"  "llvm\.riscv\.vfmul")
fm416=$(count "$IR416" "llvm\.riscv\.vfmul")
report "vfmul intrinsics"                    "$fm48"  "$fm416"

fma48=$(count  "$IR48"  "llvm\.riscv\.vfmacc")
fma416=$(count "$IR416" "llvm\.riscv\.vfmacc")
report "vfmacc intrinsics"                   "$fma48"  "$fma416"

vl48=$(count  "$IR48"  "llvm\.riscv\.vle")
vl416=$(count "$IR416" "llvm\.riscv\.vle")
report "vle (vector load) intrinsics"        "$vl48"  "$vl416"

vst48=$(count  "$IR48"  "llvm\.riscv\.vse")
vst416=$(count "$IR416" "llvm\.riscv\.vse")
report "vse (vector store) intrinsics"       "$vst48"  "$vst416"

sl48=$(count  "$IR48"  "load i64")
sl416=$(count "$IR416" "load i64")
report "load i64 (LHS scalar reads)"         "$sl48"  "$sl416"

cv48=$(count  "$IR48"  "llvm\.riscv\.vfcvt")
cv416=$(count "$IR416" "llvm\.riscv\.vfcvt")
report "vfcvt (int to float) intrinsics"    "$cv48"  "$cv416"

nr48=$(count  "$IR48"  "llvm\.riscv\.vnsrl")
nr416=$(count "$IR416" "llvm\.riscv\.vnsrl")
report "vnsrl (narrowing shift) intrinsics"  "$nr48"  "$nr416"

vmv48=$(count  "$IR48"  "llvm\.riscv\.vmv")
vmv416=$(count "$IR416" "llvm\.riscv\.vmv")
report "vmv (broadcast) intrinsics"          "$vmv48"  "$vmv416"

vg48=$(count  "$IR48"  "llvm\.vector\.extract")
vg416=$(count "$IR416" "llvm\.vector\.extract")
report "vget (split m4->m2) intrinsics"      "$vg48"  "$vg416"

vwadd48=$(count  "$IR48"  "llvm\.riscv\.vwadd")
vwadd416=$(count "$IR416" "llvm\.riscv\.vwadd")
report "vwadd (widening add) intrinsics"     "$vwadd48"  "$vwadd416"

vadd48=$(count  "$IR48"  "llvm\.riscv\.vadd")
vadd416=$(count "$IR416" "llvm\.riscv\.vadd")
report "vadd intrinsics"                     "$vadd48"  "$vadd416"

ad48=$(awk  "BEGIN{if($t48>0)  printf \"%.1f%%\", ($vi48/$t48)*100;  else print \"n/a\"}")
ad416=$(awk "BEGIN{if($t416>0) printf \"%.1f%%\", ($vi416/$t416)*100; else print \"n/a\"}")
report "Vector arithmetic density"           "$ad48"  "$ad416"

vex48=$(count  "$IR48"  "llvm\.vector\.extract")
vex416=$(count "$IR416" "llvm\.vector\.extract")
report "vector.extract (vget splits)"        "$vex48"  "$vex416"

bc48=$(count  "$IR48"  "bitcast")
bc416=$(count "$IR416" "bitcast")
report "bitcast (zero-cost vreinterpret)"    "$bc48"  "$bc416"

# ═══════════════════════════════════════════════════════
# LLVM IR — GEMV kernel
# ═══════════════════════════════════════════════════════
header "LLVM IR — GEMV kernel (decode path)"

tv=$(echo "$IR48V" | grep -cE "^\s+[a-z%]")
viv=$(count "$IR48V" "@llvm\.riscv\.")
printf "  %-44s %8s\n" "Total IR instructions"      "$tv"
printf "  %-44s %8s\n" "RVV intrinsic calls"        "$viv"
printf "  %-44s %8s\n" "alloca (spills)"            "$(count "$IR48V" "alloca")"
printf "  %-44s %8s\n" "vle intrinsics"             "$(count "$IR48V" "llvm\.riscv\.vle")"
printf "  %-44s %8s\n" "vse intrinsics"             "$(count "$IR48V" "llvm\.riscv\.vse")"
printf "  %-44s %8s\n" "vwmul intrinsics"           "$(count "$IR48V" "llvm\.riscv\.vwmul")"
printf "  %-44s %8s\n" "vwmacc intrinsics"          "$(count "$IR48V" "llvm\.riscv\.vwmacc")"
printf "  %-44s %8s\n" "vfmacc intrinsics"          "$(count "$IR48V" "llvm\.riscv\.vfmacc")"
printf "  %-44s %8s\n" "vmv (broadcast) intrinsics" "$(count "$IR48V" "llvm\.riscv\.vmv")"
printf "  %-44s %8s\n" "load i64 (LHS reads)"       "$(count "$IR48V" "load i64")"

# ═══════════════════════════════════════════════════════
# Assembly — GEMM kernels
# ═══════════════════════════════════════════════════════
header "Assembly — GEMM kernels (prefill path)"

ta48=$(echo "$ASM48"  | grep -cE "^\s+[a-z]")
ta416=$(echo "$ASM416" | grep -cE "^\s+[a-z]")
report "Total assembly instructions"         "$ta48"  "$ta416"

vs_a48=$(echo "$ASM48"  | grep -cE "vsetvli|vsetivli")
vs_a416=$(echo "$ASM416" | grep -cE "vsetvli|vsetivli")
report "vsetvl(i) instructions"              "$vs_a48"  "$vs_a416"

vops48=$(echo "$ASM48"  | grep -cE "^\s+v[a-z]")
vops416=$(echo "$ASM416" | grep -cE "^\s+v[a-z]")
report "Total vector instructions"           "$vops48"  "$vops416"

vle48=$(echo "$ASM48"  | grep -cE "^\s+vle[0-9]")
vle416=$(echo "$ASM416" | grep -cE "^\s+vle[0-9]")
report "vle (vector load)"                   "$vle48"  "$vle416"

vse48=$(echo "$ASM48"  | grep -cE "^\s+vse[0-9]")
vse416=$(echo "$ASM416" | grep -cE "^\s+vse[0-9]")
report "vse (vector store)"                  "$vse48"  "$vse416"

vwm48=$(echo "$ASM48"  | grep -cE "^\s+vwmul\.")
vwm416=$(echo "$ASM416" | grep -cE "^\s+vwmul\.")
report "vwmul"                               "$vwm48"  "$vwm416"

vwma48=$(echo "$ASM48"  | grep -cE "^\s+vwmacc\.")
vwma416=$(echo "$ASM416" | grep -cE "^\s+vwmacc\.")
report "vwmacc"                              "$vwma48"  "$vwma416"

vfm48=$(echo "$ASM48"  | grep -cE "^\s+vfmul\.")
vfm416=$(echo "$ASM416" | grep -cE "^\s+vfmul\.")
report "vfmul"                               "$vfm48"  "$vfm416"

vfma48=$(echo "$ASM48"  | grep -cE "^\s+vfmacc\.")
vfma416=$(echo "$ASM416" | grep -cE "^\s+vfmacc\.")
report "vfmacc"                              "$vfma48"  "$vfma416"

vfcv48=$(echo "$ASM48"  | grep -cE "^\s+vfcvt\.")
vfcv416=$(echo "$ASM416" | grep -cE "^\s+vfcvt\.")
report "vfcvt (int to float convert)"       "$vfcv48"  "$vfcv416"

vmv_a48=$(echo "$ASM48"  | grep -cE "^\s+vmv\.")
vmv_a416=$(echo "$ASM416" | grep -cE "^\s+vmv\.")
report "vmv (vector move/broadcast)"         "$vmv_a48"  "$vmv_a416"

vns48=$(echo "$ASM48"  | grep -cE "^\s+vnsrl\.")
vns416=$(echo "$ASM416" | grep -cE "^\s+vnsrl\.")
report "vnsrl (narrowing shift)"             "$vns48"  "$vns416"

vadd_a48=$(echo "$ASM48"  | grep -cE "^\s+vadd\.")
vadd_a416=$(echo "$ASM416" | grep -cE "^\s+vadd\.")
report "vadd"                                "$vadd_a48"  "$vadd_a416"

vwadd_a48=$(echo "$ASM48"  | grep -cE "^\s+vwadd\.")
vwadd_a416=$(echo "$ASM416" | grep -cE "^\s+vwadd\.")
report "vwadd (widening add)"                "$vwadd_a48"  "$vwadd_a416"

ld48=$(echo "$ASM48"  | grep -cE "^\s+ld\s")
ld416=$(echo "$ASM416" | grep -cE "^\s+ld\s")
report "ld (scalar load)"                    "$ld48"  "$ld416"

sd48=$(echo "$ASM48"  | grep -cE "^\s+sd\s")
sd416=$(echo "$ASM416" | grep -cE "^\s+sd\s")
report "sd (scalar store)"                   "$sd48"  "$sd416"

pro48=$(echo "$ASM48"  | head -30 | grep -cE "sd\s.*,\s*-?[0-9]+\(sp\)")
pro416=$(echo "$ASM416" | head -30 | grep -cE "sd\s.*,\s*-?[0-9]+\(sp\)")
report "Prologue sd sp (callee saves)"       "$pro48"  "$pro416"

epi48=$(echo "$ASM48"  | tail -30 | grep -cE "ld\s.*,\s*-?[0-9]+\(sp\)")
epi416=$(echo "$ASM416" | tail -30 | grep -cE "ld\s.*,\s*-?[0-9]+\(sp\)")
report "Epilogue ld sp (callee restores)"    "$epi48"  "$epi416"

ad_a48=$(awk  "BEGIN{if($ta48>0)  printf \"%.1f%%\", ($vops48/$ta48)*100;  else print \"n/a\"}")
ad_a416=$(awk "BEGIN{if($ta416>0) printf \"%.1f%%\", ($vops416/$ta416)*100; else print \"n/a\"}")
report "Vector arithmetic density"           "$ad_a48"  "$ad_a416"

# ═══════════════════════════════════════════════════════
# Assembly — GEMV kernel
# ═══════════════════════════════════════════════════════
header "Assembly — GEMV kernel (decode path)"

tav=$(echo "$ASM48V" | grep -cE "^\s+[a-z]")
printf "  %-44s %8s\n" "Total assembly instructions"    "$tav"
printf "  %-44s %8s\n" "vsetvl(i)"                      "$(echo "$ASM48V" | grep -cE "vsetvli|vsetivli")"
printf "  %-44s %8s\n" "Total vector instructions"      "$(echo "$ASM48V" | grep -cE "^\s+v[a-z]")"
printf "  %-44s %8s\n" "vle"                            "$(echo "$ASM48V" | grep -cE "^\s+vle[0-9]")"
printf "  %-44s %8s\n" "vse"                            "$(echo "$ASM48V" | grep -cE "^\s+vse[0-9]")"
printf "  %-44s %8s\n" "vwmul"                          "$(echo "$ASM48V" | grep -cE "^\s+vwmul\.")"
printf "  %-44s %8s\n" "vwmacc"                         "$(echo "$ASM48V" | grep -cE "^\s+vwmacc\.")"
printf "  %-44s %8s\n" "vfmacc"                         "$(echo "$ASM48V" | grep -cE "^\s+vfmacc\.")"
printf "  %-44s %8s\n" "vmv"                            "$(echo "$ASM48V" | grep -cE "^\s+vmv\.")"
printf "  %-44s %8s\n" "ld scalar"                      "$(echo "$ASM48V" | grep -cE "^\s+ld\s")"
printf "  %-44s %8s\n" "Prologue sd sp"                 "$(echo "$ASM48V" | head -30 | grep -cE "sd\s.*,\s*-?[0-9]+\(sp\)")"
printf "  %-44s %8s\n" "Epilogue ld sp"                 "$(echo "$ASM48V" | tail -30 | grep -cE "ld\s.*,\s*-?[0-9]+\(sp\)")"

echo ""
echo "$SEP"
echo "  Done."
echo "$SEP"
echo ""