@rem save environment variables
@rem 
set PATH_=%PATH%
set PATH=bin
set LIB_=%LIB%
set LIB=lib
set INCLUDE_=%INCLUDE%
set INCLUDE=include

@rem the GCC compiler has been pre-compiled, so now we invoke MASM to assemble it.

ml /coff /c gcc.asm
ml /coff /c obstack.asm
ml /coff /c alloca.asm
ml /coff /c version.asm
ml /coff /c newargcv.asm
link  -out:xgcc.exe gcc.obj obstack.obj alloca.obj version.obj newargcv.obj -align:0x1000 -subsystem:console -entry:mainCRTStartup -stack:1000000,1000000 libc.lib oldnames.lib


ml /coff /c c-tab.asm
ml /coff /c c-decl.asm
ml /coff /c c-typeck.asm
ml /coff /c c-conv.asm
ml /coff /c toplev.asm
ml /coff /c version.asm
ml /coff /c tree.asm
ml /coff /c print-tree.asm
ml /coff /c stor-layout.asm
ml /coff /c fold-const.asm
ml /coff /c rtl.asm
ml /coff /c rtlanal.asm
ml /coff /c expr.asm
ml /coff /c stmt.asm
ml /coff /c expmed.asm
ml /coff /c explow.asm
ml /coff /c optabs.asm
ml /coff /c varasm.asm
ml /coff /c symout.asm
ml /coff /c dbxout.asm
ml /coff /c sdbout.asm
ml /coff /c emit-rtl.asm
ml /coff /c integrate.asm
ml /coff /c jump.asm
ml /coff /c cse.asm
ml /coff /c loop.asm
ml /coff /c flow.asm
ml /coff /c stupid.asm
ml /coff /c combine.asm
ml /coff /c regclass.asm
ml /coff /c local-alloc.asm
ml /coff /c global-alloc.asm
ml /coff /c reload.asm
ml /coff /c reload1.asm
ml /coff /c caller-save.asm
ml /coff /c final.asm
ml /coff /c recog.asm
ml /coff /c pragma.asm
ml /coff /c errno.asm
ml /coff /c insn-emt.asm
ml /coff /c insn-xrt.asm
ml /coff /c insn-out.asm
ml /coff /c insn-pep.asm
ml /coff /c insn-rcg.asm
ml /coff /c obstack.asm
ml /coff /c alloca.asm

link  -out:cc1.exe c-tab.obj c-decl.obj c-typeck.obj c-conv.obj toplev.obj version.obj  tree.obj print-tree.obj stor-layout.obj fold-const.obj rtl.obj rtlanal.obj  expr.obj stmt.obj expmed.obj explow.obj optabs.obj varasm.obj symout.obj  dbxout.obj sdbout.obj emit-rtl.obj integrate.obj jump.obj cse.obj  loop.obj flow.obj stupid.obj combine.obj regclass.obj local-alloc.obj global-alloc.obj  reload.obj reload1.obj caller-save.obj final.obj recog.obj pragma.obj errno.obj insn-emt.obj insn-xrt.obj insn-out.obj insn-pep.obj insn-rcg.obj  obstack.obj alloca.obj libc.lib oldnames.lib

ml /coff /c cccp.asm
ml /coff /c cexp.asm
ml /coff /c version.asm
ml /coff /c obstack.asm
ml /coff /c alloca.asm

link  -out:cccp.exe cccp.obj cexp.obj version.obj obstack.obj alloca.obj libc.lib oldnames.lib

@rem build the gnulib/gnulib2 native/gcc!
ml /c gnulib.asm
lib /out:gnulib.lib gnulib.obj

as -v gnulib2.S -o gnulib2.obj
lib /out:gnulib2.lib gnulib2.obj


@del /f *.obj

@rem restore some variables
set PATH=%PATH_%
set PATH_=
set LIB=%_LIB%
set LIB_=
set INCLUDE=%INCLUDE_%
set INCLUDE_=

@rem do some demos
cd hello
call build
pause
call clean
cd ..\phoon
call build
pause
call clean
cd ..\info
call build
pause
call clean
cd ..\trek
call build
pause
call clean
cd ..
call clean