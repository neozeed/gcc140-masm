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


call comp file
call comp funcs
call comp infocom
call comp init
call comp input
call comp interp
call comp io
call comp jump
call comp object
call comp options
call comp page
call comp print
call comp property
call comp support
call comp term
call comp variable

call ll.cmd

@set TMP=%TMP_%
@set TMP_=

@rem del /f *.obj

@set PATH=%PATH_%
@set PATH_=
@set LIB=%LIB_%
@set LIB_=
@set INCLUDE=%INCLUDE_%
@set INCLUDE_=

info planetfa