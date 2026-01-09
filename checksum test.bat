@echo off
set /p input=Enter expected SHA256 checksum: 
set /p dir=Enter full path to the file: 
REM above sets the variables for input and dir, respectively 

for /f "tokens=1" %%a in ('certutil -hashfile "%dir%" SHA256 ^| find /v "certutil" ^| find /v "hash"') do (
    set "output=%%a"
)
REM above creates a variable based on the output of the command, while also removing the words certutil and hash

if %input% == %output% (
echo is similar;  %output%
) else (
echo failed to verify, it's actually
echo %output%
echo vs expected checksum of
echo %input%
)
REM above allows you to compare input and output using if else

pause
