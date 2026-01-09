@echo off
set /p input=Enter expected SHA256 checksum: 
set /p dir=Enter full path to the file: 

for /f "tokens=1" %%a in ('certutil -hashfile "%dir%" SHA256 ^| find /v "certutil" ^| find /v "hash"') do (
    set "output=%%a"
)
if %input% == %output% (
echo is similar;  %output%
) else (
echo faild to verify, its actually
echo %output%
echo vs expected checksum of
echo %input%
)
pause