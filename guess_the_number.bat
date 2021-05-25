@ECHO off
CLS
Set "WIN_SOUND=%~dp0\sound\win.wav"
Set "LOSE_SOUND=%~dp0\sound\lose.wav"
SET /A TURNS_TAKEN=0
SET /A TURNS_LEFT=11
SET /A NUMBER = %RANDOM%%%100+1

:MAIN
SET /A TURNS_TAKEN=%TURNS_TAKEN%+1
SET /A TURNS_LEFT=%TURNS_LEFT%-1
IF %TURNS_LEFT% EQU 0 GOTO LOST

ECHO you have %TURNS_LEFT% turns left
SET /P USER_GUESS=What is you guess?: 
IF %USER_GUESS% GTR %NUMBER% GOTO SMALLER
IF %USER_GUESS% LSS %NUMBER% GOTO BIGGER
IF %USER_GUESS% EQU %NUMBER% GOTO CORRECT
GOTO MAIN

:SMALLER
CLS
ECHO Smaller
GOTO MAIN

:BIGGER
CLS
ECHO Bigger
GOTO MAIN

:CORRECT
CLS
ECHO Correct
ECHO It took you %TURNS_TAKEN% turns
Call audio.bat "%WIN_SOUND%"
GOTO :EOF

:LOST
CLS
ECHO You lost. The number was %NUMBER%
Call audio.bat "%LOSE_SOUND%"
GOTO :EOF

REM lose sound from https://www.soundjay.com/failure-sound-effect.html
REM win sound from windows
REM audio code found here and trimmed down for convenience https://stackoverflow.com/a/39815802
REM everything else by me
