@set PATH_=%PATH%
@set PATH=..\bin
@set LIB_=%LIB%
@set LIB=..\lib
@set INCLUDE_=%INCLUDE%
@set INCLUDE=../include

@set TMP_=%TMP%
@set TMP=.
@copy /Y ..\cccp.exe cpp.exe 
@copy /Y ..\cc1.exe .
..\xgcc -B. -v -c hello.c -I../include -o hello.obj
link /NOLOGO hello.obj ../gnulib.lib kernel32.lib libc.lib -align:0x1000 -subsystem:console -entry:mainCRTStartup -stack:1000000,1000000
hello 
@del /q cc1.exe cpp.exe 
@set TMP=%TMP_%
@set TMP_=

@rem del /f *.obj

@set PATH=%PATH_%
@set PATH_=
@set LIB=%LIB_%
@set LIB_=
@set INCLUDE=%INCLUDE_%
@set INCLUDE_=