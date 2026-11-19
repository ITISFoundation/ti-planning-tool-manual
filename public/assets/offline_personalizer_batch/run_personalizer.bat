@echo off
setlocal DisableDelayedExpansion

set "SCRIPT_URL=https://raw.githubusercontent.com/ITISFoundation/ti-planning-tool-manual/main/public/assets/offline_personalizer_batch/orchestrator.bat"
set "TEMP_DIR=%TEMP%\personalizer-%RANDOM%-%RANDOM%"
set "TEMP_SCRIPT=%TEMP_DIR%\orchestrator.bat"

mkdir "%TEMP_DIR%" || exit /b 1
curl --fail --silent --show-error --location -H "Cache-Control: no-cache" --output "%TEMP_SCRIPT%" "%SCRIPT_URL%"
if errorlevel 1 (
    echo ERROR: Could not download the personalizer launcher. 1>&2
    if exist "%TEMP_SCRIPT%" del "%TEMP_SCRIPT%"
    rmdir "%TEMP_DIR%"
    exit /b 1
)

rem Raw downloads may use LF, which cmd can mishandle when resolving labels.
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -NonInteractive -Command "$ErrorActionPreference = 'Stop'; $path = $env:TEMP_SCRIPT; $text = [IO.File]::ReadAllText($path); [IO.File]::WriteAllText($path, ($text -replace '\r\n?|\n', [Environment]::NewLine))"
if errorlevel 1 (
    echo ERROR: Could not prepare the downloaded Personalizer launcher for cmd.exe. 1>&2
    del "%TEMP_SCRIPT%"
    rmdir "%TEMP_DIR%"
    exit /b 1
)

call "%TEMP_SCRIPT%" %*
set "EXIT_CODE=%ERRORLEVEL%"
del "%TEMP_SCRIPT%"
rmdir "%TEMP_DIR%"
exit /b %EXIT_CODE%
