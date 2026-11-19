@echo off
setlocal EnableExtensions DisableDelayedExpansion

REM ============================================================================
REM  Personalizer Pipeline Orchestrator
REM
REM  Selects a Sim4Life installation, prepares its bundled Python environment,
REM  then hands the pipeline arguments to the Personalizer CLI.
REM ============================================================================

REM --- Installation inputs ---
set "SIM4LIFE_DIR="
for %%D in ("%~dp0..") do set "PERSONALIZER_ROOT=%%~fD"

REM --- Read launcher options only ---
REM SHIFT changes the numbered arguments but leaves %%* available for forwarding.
:scan_args
if "%~1"=="" goto empty_arg
if "%~1"=="--" goto resolve_installation
if "%~1"=="--launcher-help" goto launcher_help
if not "%~1"=="--sim4life" (
    shift /1
    goto scan_args
)
if "%~2"=="" (
    echo ERROR: --sim4life requires an installation directory. 1>&2
    exit /b 1
)
if defined SIM4LIFE_DIR (
    echo ERROR: Specify --sim4life only once. 1>&2
    exit /b 1
)
set "SIM4LIFE_DIR=%~f2"
shift /1
shift /1
goto scan_args

:empty_arg
if "%1"=="" goto resolve_installation
shift /1
goto scan_args

:launcher_help
echo Usage: run_personalizer.bat [--sim4life PATH] [Personalizer options]
echo.
echo   --sim4life PATH   Use the specified Sim4Life installation.
echo   --launcher-help   Show this help without installing Personalizer.
echo   --help, -h        Show help for the matched Personalizer release.
echo                     This refreshes the published package before showing help.
echo.
echo Supported Sim4Life releases: 9.4 and 10.0.
exit /b 0

REM --- Find or select a Sim4Life installation ---
:resolve_installation
if defined SIM4LIFE_DIR goto validate_installation

echo Searching for supported Sim4Life installations...
set "INSTALL_COUNT=0"
set "SEARCH_DIR=%ProgramFiles%"
if defined SEARCH_DIR call :search_directory
set "SEARCH_DIR=%USERPROFILE%"
if defined SEARCH_DIR if /i not "%SEARCH_DIR%"=="%ProgramFiles%" call :search_directory

if "%INSTALL_COUNT%"=="0" (
    echo ERROR: No supported Sim4Life installation found. 1>&2
    echo Specify the installation directory with --sim4life, for example: 1>&2
    echo   run_personalizer.bat --sim4life "C:\Program Files\Sim4Life_10.0" --help 1>&2
    exit /b 1
)
if "%INSTALL_COUNT%"=="1" (
    set "SIM4LIFE_DIR=%INSTALL_1%"
    goto validate_installation
)

set "SELECTION="
set /p "SELECTION=Select a Sim4Life installation [1-%INSTALL_COUNT%]: "
setlocal EnableDelayedExpansion
for /l %%I in (1,1,%INSTALL_COUNT%) do if "!SELECTION!"=="%%I" (
    for /f "delims=" %%D in ("!INSTALL_%%I!") do (
        endlocal
        set "SIM4LIFE_DIR=%%D"
        goto validate_installation
    )
)
endlocal
echo ERROR: Invalid selection. Run again or specify --sim4life PATH. 1>&2
exit /b 1

REM --- Resolve bundled Python and the matching Personalizer release ---
:validate_installation
set "PYTHON_EXE=%SIM4LIFE_DIR%\Python\python.exe"
if not exist "%PYTHON_EXE%" (
    echo ERROR: Sim4Life Python not found at "%PYTHON_EXE%". 1>&2
    exit /b 1
)
set "VERSION_INI=%SIM4LIFE_DIR%\version.ini"
if not exist "%VERSION_INI%" (
    echo ERROR: version.ini not found at "%VERSION_INI%". 1>&2
    exit /b 1
)
call :read_sim4life_version
if errorlevel 1 (
    echo ERROR: Missing or invalid product version in "%VERSION_INI%". 1>&2
    exit /b 1
)
call :resolve_release
if errorlevel 1 (
    echo ERROR: Unsupported Sim4Life version %SIM4LIFE_VERSION%. Supported releases are 9.4 and 10.0. 1>&2
    exit /b 1
)
echo Using Sim4Life %SIM4LIFE_VERSION% at "%SIM4LIFE_DIR%".
echo   Python: "%PYTHON_EXE%"

REM --- Pre-flight: verify pip is healthy ---
call :check_pip
if errorlevel 1 exit /b 1

REM --- Install Personalizer when needed ---
call :prepare_personalizer
if errorlevel 1 exit /b 1

REM --- Run the Personalizer CLI and preserve its exit code ---
REM Read the small Python argument adapter below, leaving validation to the package CLI.
"%PYTHON_EXE%" -c "import sys; path = sys.argv.pop(1); exec(open(path, encoding='utf-8').read().split('\n:python\n', 1)[1])" "%~f0" %*
exit /b %ERRORLEVEL%

REM ============================================================================
REM  Sim4Life discovery and release mapping
REM ============================================================================

:search_directory
for /d %%D in ("%SEARCH_DIR%\Sim4Life_*") do (
    set "SIM4LIFE_DIR=%%~fD"
    call :add_installation
)
exit /b 0

:add_installation
if not exist "%SIM4LIFE_DIR%\Python\python.exe" exit /b 0
set "VERSION_INI=%SIM4LIFE_DIR%\version.ini"
if not exist "%VERSION_INI%" exit /b 0
call :read_sim4life_version
if errorlevel 1 exit /b 0
call :resolve_release
if errorlevel 1 exit /b 0
set /a INSTALL_COUNT+=1
set "INSTALL_%INSTALL_COUNT%=%SIM4LIFE_DIR%"
echo   %INSTALL_COUNT%. Sim4Life %SIM4LIFE_VERSION% - "%SIM4LIFE_DIR%"
exit /b 0

REM --- Read [PRODUCT], not [PYTHON], from version.ini ---
:read_sim4life_version
setlocal EnableDelayedExpansion
for %%V in (MAJOR MINOR UPDATE BUILD) do set "VERSION_%%V="
set "IN_PRODUCT="
REM FOR /F needs the space delimiter last, after the tab.
for /f "usebackq tokens=1,2,* delims==	 " %%A in ("!VERSION_INI!") do (
    set "KEY=%%A"
    if "!KEY:~0,1!"=="[" set "IN_PRODUCT="
    if /i "!KEY!"=="[PRODUCT]" set "IN_PRODUCT=1"
    if defined IN_PRODUCT (
        set "VALUE=%%B"
        if not "%%C"=="" set "VALUE="
        for /f "eol=0 delims=0123456789" %%N in ("!VALUE!") do set "VALUE="
        if /i "!KEY!"=="MajorVersion" set "VERSION_MAJOR=!VALUE!"
        if /i "!KEY!"=="MinorVersion" set "VERSION_MINOR=!VALUE!"
        if /i "!KEY!"=="UpdateVersion" set "VERSION_UPDATE=!VALUE!"
        if /i "!KEY!"=="BuildVersion" set "VERSION_BUILD=!VALUE!"
    )
)
for %%V in (MAJOR MINOR UPDATE BUILD) do if not defined VERSION_%%V exit /b 1
endlocal & set "SIM4LIFE_RELEASE=%VERSION_MAJOR%.%VERSION_MINOR%" & set "SIM4LIFE_VERSION=%VERSION_MAJOR%.%VERSION_MINOR%.%VERSION_UPDATE%.%VERSION_BUILD%"
exit /b 0

:resolve_release
set "PERSONALIZER_VERSION="
if "%SIM4LIFE_RELEASE%"=="9.4" set "PERSONALIZER_VERSION=2.1.3"
if "%SIM4LIFE_RELEASE%"=="10.0" set "PERSONALIZER_VERSION=2.2.2"
if not defined PERSONALIZER_VERSION exit /b 1
set "PACKAGE_URL=https://itis.swiss/assets/wheels/personalizer-%PERSONALIZER_VERSION%.tar.gz"
exit /b 0

REM ============================================================================
REM  Prepare the selected Sim4Life Python environment
REM ============================================================================

:check_pip
REM A partially upgraded pip can fail to import its vendored dependencies.
echo Checking pip health...
"%PYTHON_EXE%" -m pip --version >nul 2>&1
if not errorlevel 1 exit /b 0

echo WARNING: pip appears to be broken in this Sim4Life Python.
echo Attempting automatic repair via ensurepip...
"%PYTHON_EXE%" -m ensurepip --upgrade
"%PYTHON_EXE%" -m pip install --upgrade --force-reinstall pip
"%PYTHON_EXE%" -m pip --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: pip is broken and could not be repaired in "%PYTHON_EXE%". 1>&2
    call :show_pip_repair_commands
    echo If repair still fails, check for a conflicting PYTHONPATH or PIP_TARGET: 1>&2
    echo   "%PYTHON_EXE%" -m site 1>&2
    echo As a last resort, repair or reinstall Sim4Life. 1>&2
    exit /b 1
)
echo pip repaired successfully.
exit /b 0

:show_pip_repair_commands
echo Try the following in Command Prompt ^(as Administrator if Sim4Life is under Program Files^): 1>&2
echo   "%PYTHON_EXE%" -m ensurepip --upgrade 1>&2
echo   "%PYTHON_EXE%" -m pip install --upgrade --force-reinstall pip 1>&2
exit /b 0

:prepare_personalizer
REM A checkout takes precedence over the published release. The downloaded
REM orchestrator has no adjacent workspace and always uses the published path.
if exist "%PERSONALIZER_ROOT%\pyproject.toml" (
    echo Using local workspace package: "%PERSONALIZER_ROOT%"
    call :install_with_constraints editable
) else (
    echo Installing published Personalizer %PERSONALIZER_VERSION%...
    call :install_with_constraints published
)
if not errorlevel 1 exit /b 0

echo ERROR: Failed to install Personalizer into "%PYTHON_EXE%". 1>&2
echo If pip reported an internal import error, try repairing pip. 1>&2
call :show_pip_repair_commands
exit /b 1

:install_with_constraints
setlocal
set "INSTALL_TEMP=%TEMP%\personalizer-install-%RANDOM%-%RANDOM%"
mkdir "%INSTALL_TEMP%" || exit /b 1
set "CONSTRAINTS=%INSTALL_TEMP%\constraints.txt"

REM Pin installed versions without including editable or local file references.
echo Capturing Sim4Life dependency constraints...
"%PYTHON_EXE%" -m pip list --format=freeze --exclude personalizer > "%CONSTRAINTS%"
if errorlevel 1 (
    echo ERROR: Could not capture dependency constraints from Sim4Life Python. 1>&2
    set "INSTALL_EXIT=1"
    goto clean_install_temp
)

REM Sim4Life's Python\Scripts directory does not need to be on PATH.
if "%~1"=="editable" (
    "%PYTHON_EXE%" -m pip install -e "%PERSONALIZER_ROOT%" -c "%CONSTRAINTS%" --no-warn-script-location --quiet
) else (
    REM The published artifact can be replaced without a version bump.
    "%PYTHON_EXE%" -m pip uninstall --yes personalizer --quiet
    if errorlevel 1 (
        echo ERROR: Could not uninstall the existing Personalizer package. 1>&2
        set "INSTALL_EXIT=1"
        goto clean_install_temp
    )
    "%PYTHON_EXE%" -m pip install "%PACKAGE_URL%" -c "%CONSTRAINTS%" --no-cache-dir --no-warn-script-location --quiet
)
set "INSTALL_EXIT=%ERRORLEVEL%"
if "%INSTALL_EXIT%"=="0" echo Personalizer installed successfully.

:clean_install_temp
if exist "%CONSTRAINTS%" del "%CONSTRAINTS%"
rmdir "%INSTALL_TEMP%"
exit /b %INSTALL_EXIT%

REM ============================================================================
REM  Python CLI handoff (read by the invocation above, never executed by cmd)
REM ============================================================================

:python
import argparse
import sys
from pathlib import Path

launcher = argparse.ArgumentParser(prog="run_personalizer.bat", add_help=False, allow_abbrev=False)
launcher.add_argument("--sim4life")
_, cli_args = launcher.parse_known_args()

# Preserve the old batch defaults without turning this into a second CLI parser.
defaults = argparse.ArgumentParser(prog=launcher.prog, add_help=False, allow_abbrev=False)
defaults.add_argument("--project-root")
defaults.add_argument("--zip-output")
options, _ = defaults.parse_known_args(cli_args)

extra = ["--sim4life-version", sys.executable]
if not any(flag in cli_args for flag in ("-h", "--help")):
    if not options.project_root:
        defaults.error("--project-root is required")
    if options.zip_output is None:
        extra.extend(["--zip-output", str(Path(options.project_root) / "outputs" / "results.zip")])

sys.argv = [launcher.prog, *extra, *cli_args]
from personalizer.cli import main

main()
