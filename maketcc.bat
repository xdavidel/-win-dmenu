@echo off

rem Options
set PRJ=dmenu
set SRC=src/dmenu.c
set LIB=-lgdi32 -luser32 -lshlwapi
set OPT=all release debug test clean
set DEF=WLINES_REVISION
for /f %%a in ('git log -1 --date=short "--format=%%cd-%%h"') do (set REV=%%a)

goto :main

:all
call :release
call :debug
exit /b

:test
call :debug
if %ERRORLEVEL% NEQ 0 (exit /b)
type test_input.txt | bin\%PRJ%-debug.exe -i -l 7 -p "Hello World"
echo Error code: %ERRORLEVEL%
exit /b

:release
tcc.exe -m64 -Wall -Os -o bin\%PRJ%.exe "-D%DEF%=""%REV%""" %SRC% %LIB%
exit /b

:debug
tcc.exe -m64 -Wall -g -o bin\%PRJ%-debug.exe "-D%DEF%=""debug""" %SRC% %LIB%
exit /b

:clean
del bin\%PRJ%.exe bin\%PRJ%-debug.exe
exit /b

:main
if not exist "bin" mkdir "bin"
if "%1" == "" goto :%OPT%
(for %%a in (%OPT%) do (
    if "%1" == "%%a" goto :%%a
))

echo %OPT%