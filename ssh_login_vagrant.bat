@echo off
 
setlocal enabledelayedexpansion
 
if "%1"=="" (
  @echo "ホスト名を入力してください Usage : vagrant ssh-config <Hostname>"
  set /P RHOST="Hostname: "
  ) else (
  set RHOST=%1
) 
 
set TT_HOME="D:\DownloadFiles\teraterm-4.89"
set RESULT=
 
for /f "usebackq tokens=2" %%i in (`vagrant ssh-config %RHOST% ^| findstr /c:Port /c:IdentityFile`) do (
  set RESULT=!RESULT! ^
%%i
)
echo !RESULT!
 
REM マクロの場所をフルパスで記述する
%TT_HOME%t\tpmacro.exe /I %~dp0vagrant_login.ttl %RESULT% 
 
endlocal