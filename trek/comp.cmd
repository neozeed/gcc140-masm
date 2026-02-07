@set TMP_=%TMP%
@set TMP=.
@copy /Y ..\cccp.exe cpp.exe
@copy /Y ..\cc1.exe .
..\xgcc -msoft-float -B. -D_M_IX86 -v -S %1.c -I../include -o %1.S
as -v %1.S -o %1.obj
@del /q cc1.exe cpp.exe
@set TMP=%TMP_%
@set TMP_=

