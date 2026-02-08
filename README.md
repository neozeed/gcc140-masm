---

# 📦 gcc140-masm

**GCC 1.40 adapted for MASM-friendly assembly**

This repository contains **GNU Compiler Collection (GCC) 1.40** converted into **MASM-compatible assembly** so that the entire compiler can be assembled and linked *without requiring a C compiler*.

---

## 🚀 What this project is

GCC 1.40 was originally designed decades ago using GAS as its native assembler. This project:

✔ Converts the GCC 1.40 backend into assembly that can be fed directly to **Microsoft Macro Assembler (MASM)**
✔ Allows the compiler frontends (`cc1`, etc.) to be rebuilt using MASM 7.x and MSVC tooling
✔ Produces native Win32 executables like `xgcc.exe` `cccp.exe` and `cc1.exe`
✔ Demonstrates that GCC can be ported through assembly re-assembly alone

---

## 📜 Why this exists

Back in the early 1990s, GNU toolchains were highly portable, but modern assemblers and linkers are much stricter than their historical counterparts. It turns out that, *with a few manual transformations*, Microsoft C/386 8.0 `.asm` output can be reassembled:

* with **MASM 7.10** (the version paired with MSVC 2003)
* using **Win32 COFF** object format
* without ever invoking a C compiler to rebuild from C source

This is an exercise in:

* toolchain archaeology
* assembly portability experimentation
* understanding object format and ABI issues across decades

---

## 📂 What’s in this repo

* `gcc/`, etc. — GCC 1.40 assembly modules adapted for MASM
* Build scripts to assemble and link the compiler components
* Demonstrations (e.g., `Hello World`, `phoon`, `trek`, `Infocom87`) showing that resulting binaries work

---

## 📌 Supported workflow

**MASM backend path**

   * Use `ml.exe` (MASM 7.10 or similar)
   * Assemble adapted `.asm` files
   * Link to produce Win32 tools (`as.exe`, `cc1.exe`, etc.)
   * *No C compiler required once assembly is generated*

---

## 🔌 Batteries *not* included

This is *not* a full modern build system.

⚠️ Requirements:

* MASM 7.10 (from MSVC 2003) or equivalent assembler
* MSVC toolchain capable of linking Win32 COFF
* Classic OMF-aware tools if using the OMF path
* Some manual build steps

---

## ⚠️ Known limitations

* Floating-point support in GAS may require special runtime handling (currently not working)
* The MASM path depends on legacy tooling that only exists in older MSVC releases
* This is a proof-of-concept and educational artifact, not a professionally maintained distribution
* Modern GCC versions may not be reconstructible with the same pipeline

---

## 🛠 Build summary (simple)

Example minimal MASM build:

```bat
ml /c /coff *.asm
link *.obj kernel32.lib libc.lib oldnames.lib -subsystem:console -entry:_mainCRTStartup
```

---

## 📖 Background context

Historically:

* GCC 1.40 was released during a time when assemblers and linkers were more permissive
* MASM and GAS had overlapping “Intel style” syntax, but different expectations
* Object formats (OMF vs COFF) were major barriers
* Linkers often did auto-conversion (e.g., Win32 linker accepts Xenix OMF)

This repo harnesses those historical compatibilities.

---

## ❓ Why might someone use this?

* Retro toolchain enthusiasts
* Historical compiler research
* Assembly portability exploration
* Reproducing classic GCC builds for vintage systems
* Understanding ABI/format evolution

---

## 💬 A note to future maintainers

This project demonstrates a very specific and delicate compatibility envelope — assembly interop across decades of tooling assumptions. If you dive into this world, expect:

* implicit runtime dependencies
* fragile assumptions about FP and exception handling
* code that “just worked then” for reasons that may not be obvious today

Detailed comments and documentation are encouraged!

---

## 📝 License

The original GCC 1.40 code is under the GNU GPL (v1). This repository preserves the original copyright notices.
Secondary tooling (MASM normalization, build scripts) should specify license terms if different.

---
