@ECHO off

SET ip=192.168.178.1


ECHO "Waiting for shutdown... [%ip%]"


:fbon
PING %ip% -n 1 -w 1 | FIND /i "TTL" >nul 2>&1


if errorlevel 1 (
GOTO fboff
) else (
timeout 1 >nul
echo|set /p="."
GOTO fbon
)


:fboff
ECHO "Shutdown complete! [%ip%]"


ECHO "Waiting for turn on... [%ip%]"


:fbstilloff
PING %ip% -n 1 -w 1 | FIND /i "TTL" >nul 2>&1


if errorlevel 1 (
timeout 1 >nul
echo|set /p="."
GOTO fbstilloff
)


ECHO "Connection found! [%ip%]"


FTP %ip%