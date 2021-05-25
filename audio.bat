:AUDIO
SET "_vbs=%tmp%\%~n0.vbs"
(
ECHO Play "%~1"
ECHO Sub Play(URL^)
ECHO    Dim Sound
ECHO    Set Sound = CreateObject("WMPlayer.OCX"^)
ECHO    Sound.URL = URL
ECHO    Sound.settings.volume = 100
ECHO    Sound.Controls.play
ECHO    do while Sound.currentmedia.duration = 0
ECHO        wscript.sleep 100
ECHO    loop
ECHO    wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000
ECHO End Sub
)>"%_vbs%"
cscript /nologo "%_vbs%"

REM code found from here https://stackoverflow.com/a/39815802