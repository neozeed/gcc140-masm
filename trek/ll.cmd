link /NOLOGO *.obj  ..\gnulib.lib kernel32.lib libc.lib -align:0x1000 -subsystem:console -entry:mainCRTStartup -stack:1000000,1000000 -out:trek.exe
