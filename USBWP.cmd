:: USB Write Protection
:: Enables or disables the USB write protection.
::
:: From Gaijin.at --- https://www.gaijin.at/

@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Remove possible quotes from parameters.
set state=%~1
set sleep=%~2

:: Validate the sleep parameter (must be between 0 and 99).
set sleepv=0
for /f "delims=0123456789" %%i in ("%sleep%") do set sleepv=%%i
if "%sleepv%" neq "0" set sleep=0
if "%sleep%" equ "" set sleep=0
if %sleep% lss 0 set sleep=0
if %sleep% gtr 99 set sleep=0

if "%state%" equ "" goto :PRINTSTATE
if /I "%state%" equ "SHOW" goto :PRINTSTATE

:: Change numbers in state to commands.
if "%state%" equ "0" set state=OFF
if "%state%" equ "1" set state=ON
if "%state%" equ "2" set state=CHANGE

if /I "%state%" equ "ON" (
	call :SETWPVAL 1
	goto :PRINTSTATE
)

if /I "%state%" equ "OFF" (
	call :SETWPVAL 0
	goto :PRINTSTATE
)

if /I "%state%" equ "CHANGE" (
	call :GETWPVAL
	if "!wpval!" equ "1" (
		call :SETWPVAL 0
	) else (
		call :SETWPVAL 1
	)
	goto :PRINTSTATE
)

:: Print help for all other commands.
echo Enables or disables the USB write protection or shows the protection state.
echo.
echo USBWP [Command] [Sleep]
echo.
echo   Command:
echo     CHANGE  changes the write protection to the opposite state
echo     ON      enables the write protection
echo     OFF     disables the write protection
echo     SHOW    shows the current state ^(can be omitted or empty ""^)
echo.
echo   Sleep:
echo     Specifies the number of seconds ^(1-99^) to pause the script at the end.
echo     To show the current state for 2 seconds per shortcut link befor the console
echo     window is closed automatically, use: USBWP SHOW 2
echo.
echo   NOTES: You need administrator rights to change the USB write protection.
echo          After changing the state, the USB device must be re-attached.
echo.
echo Visit Gaijin.at for the newest version. ^(https://www.gaijin.at/^)
goto :END

:PRINTSTATE
cls
echo.
echo                          ˛˛    ˛˛    ˛˛˛˛˛˛˛   ˛˛˛˛˛˛˛
echo                          ˛˛    ˛˛   ˛˛         ˛˛    ˛˛
echo                          ˛˛    ˛˛    ˛˛˛˛˛˛    ˛˛˛˛˛˛˛
echo                          ˛˛    ˛˛         ˛˛   ˛˛    ˛˛
echo                           ˛˛˛˛˛˛    ˛˛˛˛˛˛˛    ˛˛˛˛˛˛˛
echo.
echo                         W R I T E    P R O T E C T I O N
echo.
echo                                       I S
echo.

:: Get the current value from the Registry and show the current state of the write protection.
call :GETWPVAL
if "%wpval%" equ "1" (
	call :PRINTON
) else (
	call :PRINTOFF
)

:: Sleep for ... seconds
sleep %sleep%

goto :END

:SETWPVAL
reg.exe add HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies /v WriteProtect /t REG_DWORD /d %1 /f > nul

:GETWPVAL
set wpval=0
:: Get value of registry key "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies", value "WriteProtect".
:: REG.EXE returns 2 lines or an error message if it is not found:
::   1: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies
::   2: WriteProtect    REG_DWORD    0x1
:: Process each line with FOR and assign the 3rd token to variable wpval.
:: So the final result is the 3rd token of the last line.
for /F "tokens=3 usebackq" %%F in (
  `reg.exe query HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies /v WriteProtect`
  ) do set wpval=%%F

:: Set the variable wpval to the state of the write protection (1=on or 0=off).
if "%wpval%" equ "0x1" set wpval=1
goto :EOF

:PRINTON
echo    ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
echo    €                                                                       €
echo    €                           €€€€€€    €€€   €€                          €
echo    €                          €€    €€   €€€€  €€                          €
echo    €                          €€    €€   €€ €€ €€                          €
echo    €                          €€    €€   €€  €€€€                          €
echo    €                           €€€€€€    €€   €€€                          €
echo    €                                                                       €
echo    ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
goto :EOF

:PRINTOFF
echo    ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹
echo    €                                                                       €
echo    €                      €€€€€€    €€€€€€€€   €€€€€€€€                    €
echo    €                     €€    €€   €€         €€                          €
echo    €                     €€    €€   €€€€€      €€€€€                       €
echo    €                     €€    €€   €€         €€                          €
echo    €                      €€€€€€    €€         €€                          €
echo    €                                                                       €
echo    ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ
goto :EOF

:END
endlocal
