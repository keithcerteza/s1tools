@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
  echo Requesting Administrative Privileges...
  goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  set params = %*:"=""
  echo UAC.ShellExecute "%~s0", "%params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
 "%temp%\getadmin.vbs"
  exit /B

:gotAdmin
  if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
  pushd "%CD%"
  CD /D "%~dp0"
  echo 202.92.144.22   rodolfo.uplb.edu.ph >> %windir%\System32\drivers\etc\hosts
  echo 202.92.144.23   dioscoro.uplb.edu.ph >> %windir%\System32\drivers\etc\hosts
  echo 202.92.144.24   eduardo.uplb.edu.ph >> %windir%\System32\drivers\etc\hosts
  echo Done.
  pause
