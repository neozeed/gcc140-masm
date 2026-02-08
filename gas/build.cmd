@rem save environment variables
@rem 
set PATH_=%PATH%
set PATH=..\bin
set LIB_=%LIB%
set LIB=..\lib
set INCLUDE_=%INCLUDE%
set INCLUDE=..\include

@rem the GNU GAS / Xenix assembler has been pre-compiled, so now we invoke MASM to assemble it.

ml /coff /c app.asm
ml /coff /c append.asm
ml /coff /c as.asm
ml /coff /c atof-generic.asm
ml /coff /c atof-ieee.asm
ml /coff /c bignum-copy.asm
ml /coff /c expr.asm
ml /coff /c flonum-const.asm
ml /coff /c flonum-copy.asm
ml /coff /c flonum-mult.asm
ml /coff /c frags.asm
ml /coff /c hash.asm
ml /coff /c hex-value.asm
ml /coff /c i386.asm
ml /coff /c input-file.asm
ml /coff /c input-scrub.asm
ml /coff /c messages.asm
ml /coff /c obstack.asm
ml /coff /c omfwrite.asm
ml /coff /c output-file.asm
ml /coff /c read.asm
ml /coff /c subsegs.asm
ml /coff /c symbols.asm
ml /coff /c version.asm
ml /coff /c write.asm
ml /coff /c xenixomf.asm
ml /coff /c xmalloc.asm
ml /coff /c xrealloc.asm


link -out:as386.exe *.obj libc.lib kernel32.lib oldnames.lib 

@del /f *.obj

@rem restore some variables
set PATH=%PATH_%
set PATH_=
set LIB=%_LIB%
set LIB_=
set INCLUDE=%INCLUDE_%
set INCLUDE_=


