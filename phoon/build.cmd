@set PATH_=%PATH%
@set PATH=..\bin
@set LIB_=%LIB%
@set LIB=..\lib
@set INCLUDE_=%INCLUDE%
@set INCLUDE=../include

@call comp astro 
@call comp date_p 
@call comp phoon 
@call ll.cmd 
phoon 

@set PATH=%PATH_%
@set PATH_=
@set LIB=%LIB_%
@set LIB_=
@set INCLUDE=%INCLUDE_%
@set INCLUDE_=