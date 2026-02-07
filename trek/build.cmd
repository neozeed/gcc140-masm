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


call comp attack
call comp autover
call comp abandon
call comp capture
call comp cgetc
call comp check_out
call comp checkcond
call comp compkl
call comp computer
call comp damage
call comp damaged
call comp dcrept
call comp destruct
call comp dock
call comp dumpgame
call comp dumpme
call comp dumpssradio
call comp events
call comp externs
call comp getcodi
call comp getpar
call comp help
call comp impulse
call comp initquad
call comp kill
call comp klmove
call comp lose
call comp lrscan
call comp main
call comp move
call comp nova
call comp nullsleep
call comp out
call comp phaser
call comp play
call comp ram
call comp ranf
call comp rest
call comp schedule
call comp score
call comp setup
call comp setwarp
call comp shield
call comp sleep
call comp snova
call comp srscan
call comp systemname
call comp torped
call comp utility
call comp visual
call comp warp
call comp win

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

trek