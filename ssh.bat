@rem %*
@echo off
setlocal
 
if "%1"=="" exit
 
set TT_HOME=D:\DownloadFiles\teraterm-4.89\
set TT_OPTS=/KR=UTF8 /KT=UTF8 /DS
 
set userhost=%1
shift
:loop
  if "%~1"=="-p" set port=%2
  if "%~1"=="-i" set keyfile=%2
  shift
if not "%~1"=="" goto loop

if not keyfile=="" set keyfile=E:\VMware\VirtualMacheines\id_rsa
 
start "" "%TT_HOME%\ttermpro.exe" %userhost%:%port% /ssh2 /auth=publickey /keyfile=%keyfile% %TT_OPTS%