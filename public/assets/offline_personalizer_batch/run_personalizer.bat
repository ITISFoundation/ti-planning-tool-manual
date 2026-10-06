@echo off
setlocal EnableDelayedExpansion

REM ============================================================================
REM  Personalizer Pipeline Launcher
REM
REM  Installs the personalizer package into Sim4Life's Python environment
REM  and runs the pipeline via the CLI entry point.
REM ============================================================================

REM --- Default Sim4Life installation path ---
SET "SIM4LIFE_DIR=C:\Program Files\Sim4Life_9.4"

REM --- Personalizer wheel URL ---
SET "WHEEL_URL=https://itis.swiss/assets/wheels/personalizer-2.1.2.tar.gz"

REM --- Initialize variables ---
SET "SUBJECT_ID="
SET "PROJECT_ROOT="
SET "ELECTRODE_RADIUS="
SET "ELECTRODE_TYPE="
SET "RESAMPLE_RES="
SET "ATLAS="
SET "DTI="
SET "REGISTER_DTI="
SET "DENOISE_DTI="
SET "MAX_BVAL="
SET "DTI_MODEL="
SET "NO_ELECTRODES="
SET "SKIP_ELECTRODE_CLASH_CHECK="
SET "NO_ANONYMIZE="
SET "ZIP_OUTPUT="
SET "FORCE_DOWNLOAD="
SET "LOG_LEVEL="
SET "SHOW_HELP="

REM --- Parse arguments ---
:parse_args
if "%~1"=="" goto done_args

if /I "%~1"=="--help" (
    SET "SHOW_HELP=1"
    shift
    goto parse_args
)
if /I "%~1"=="-h" (
    SET "SHOW_HELP=1"
    shift
    goto parse_args
)
if /I "%~1"=="--sim4life" (
    SET "SIM4LIFE_DIR=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--subject-id" (
    SET "SUBJECT_ID=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--project-root" (
    SET "PROJECT_ROOT=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--electrode-radius" (
    SET "ELECTRODE_RADIUS=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--electrode-type" (
    SET "ELECTRODE_TYPE=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--resample-res" (
    SET "RESAMPLE_RES=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--atlas" (
    SET "ATLAS=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--dti" (
    SET "DTI=1"
    shift
    goto parse_args
)
if /I "%~1"=="--register-dti" (
    SET "REGISTER_DTI=1"
    shift
    goto parse_args
)
if /I "%~1"=="--denoise-dti" (
    SET "DENOISE_DTI=1"
    shift
    goto parse_args
)
if /I "%~1"=="--max-bval" (
    SET "MAX_BVAL=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--dti-model" (
    SET "DTI_MODEL=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--no-electrodes" (
    SET "NO_ELECTRODES=1"
    shift
    goto parse_args
)
if /I "%~1"=="--skip-electrode-clash-check" (
    SET "SKIP_ELECTRODE_CLASH_CHECK=1"
    shift
    goto parse_args
)
if /I "%~1"=="--no-anonymize" (
    SET "NO_ANONYMIZE=1"
    shift
    goto parse_args
)
if /I "%~1"=="--zip-output" (
    SET "ZIP_OUTPUT=%~2"
    shift & shift
    goto parse_args
)
if /I "%~1"=="--force-download-atlas" (
    SET "FORCE_DOWNLOAD=1"
    shift
    goto parse_args
)
if /I "%~1"=="--log-level" (
    SET "LOG_LEVEL=%~2"
    shift & shift
    goto parse_args
)

echo ERROR: Unknown option: %~1
echo Run with --help for usage information.
exit /b 1

:done_args

REM --- Show help ---
if defined SHOW_HELP (
    echo Personalizer Pipeline Launcher
    echo.
    echo Usage: %~nx0 [options]
    echo.
    echo Required:
    echo   --project-root PATH     Project root directory ^(contains inputs/ and outputs/^)
    echo.
    echo Required ^(at least one^):
    echo   --electrode-radius MM   Electrode radius in mm ^(e.g. 7.0^)
    echo   --electrode-type TYPE   Electrode type: ROUND_1_6CM2 or ROUND_3CM2
    echo.
    echo Optional:
    echo   --sim4life PATH         Sim4Life installation directory
    echo                           ^(default: %SIM4LIFE_DIR%^)
    echo   --subject-id ID         Subject identifier ^(recorded in personalizer_args.json^)
    echo   --resample-res MM       Resampling resolution in mm ^(default: 0.3^)
    echo   --atlas NAME            Atlas to register ^(e.g. ICBM_152^)
    echo   --dti                   Process DTI for anisotropic conductivity
    echo   --register-dti          Register DTI to MRI ^(safe only for minor translations, no rotation^)
    echo   --denoise-dti           Denoise DTI data before conductivity extraction
    echo   --max-bval INT          Exclude DTI shells above this b-value ^(e.g. 1000^)
    echo   --dti-model MODEL       Diffusion model: auto, dti, or dki ^(default: auto^)
    echo   --no-electrodes         Skip electrode placement
    echo   --skip-electrode-clash-check
    echo                           Skip the electrode/head-mesh clash check after placement
    echo   --no-anonymize          Disable T1 anonymization ^(defacing^)
    echo   --zip-output PATH       Zip archive path ^(default: PROJECT_ROOT\outputs\results.zip^)
    echo   --force-download-atlas  Force re-download of atlas data
    echo   --log-level LEVEL       DEBUG, INFO, WARNING, or ERROR ^(default: INFO^)
    echo   --help, -h              Show this help message
    echo.
    echo Examples:
    echo   %~nx0 --project-root C:\data\subj01 --electrode-radius 7.0
    echo   %~nx0 --project-root C:\data\subj01 --electrode-type ROUND_3CM2 --subject-id patient_42
    echo   %~nx0 --sim4life "C:\Program Files\Sim4Life_9.2.2.20674" ^
    echo          --project-root C:\data\subj01 --electrode-radius 7.0 --atlas ICBM_152
    exit /b 0
)

REM --- Validate: electrode config ---
if not defined ELECTRODE_RADIUS (
    if not defined ELECTRODE_TYPE (
        echo ERROR: At least one of --electrode-radius or --electrode-type is required.
        echo Run with --help for usage information.
        exit /b 1
    )
)

REM --- Validate: project location ---
if not defined PROJECT_ROOT (
    echo ERROR: --project-root is required.
    echo Run with --help for usage information.
    exit /b 1
)

REM --- Validate Sim4Life installation ---
if not exist "%SIM4LIFE_DIR%" (
    echo ERROR: Sim4Life directory not found: %SIM4LIFE_DIR%
    echo.
    echo Please specify a valid Sim4Life installation ^(^>= 9.4^) using --sim4life:
    echo   %~nx0 --sim4life "C:\Program Files\Sim4Life_X.Y.Z.BUILD" ...
    echo.
    echo Typical locations:
    echo   C:\Program Files\Sim4Life_9.4.0.21184
    exit /b 1
)

SET "PYTHON_EXE=%SIM4LIFE_DIR%\Python\python.exe"
if not exist "%PYTHON_EXE%" (
    echo ERROR: Python not found at: %PYTHON_EXE%
    exit /b 1
)

REM --- Default zip-output if not set ---
if not defined ZIP_OUTPUT (
    SET "ZIP_OUTPUT=!PROJECT_ROOT!\outputs\results.zip"
)

REM --- Write CLI arguments to a temporary file (avoids quoting issues with spaces) ---
SET "ARGS_FILE=%TEMP%\personalizer_args_%RANDOM%.txt"
> "!ARGS_FILE!" echo.--project-root
>>"!ARGS_FILE!" echo.!PROJECT_ROOT!
>>"!ARGS_FILE!" echo.--sim4life-version
>>"!ARGS_FILE!" echo.!PYTHON_EXE!
if defined ELECTRODE_RADIUS (>>"!ARGS_FILE!" echo.--electrode-radius
                             >>"!ARGS_FILE!" echo.!ELECTRODE_RADIUS!)
if defined ELECTRODE_TYPE   (>>"!ARGS_FILE!" echo.--electrode-type
                             >>"!ARGS_FILE!" echo.!ELECTRODE_TYPE!)
if defined RESAMPLE_RES     (>>"!ARGS_FILE!" echo.--resample-res
                             >>"!ARGS_FILE!" echo.!RESAMPLE_RES!)
if defined ATLAS            (>>"!ARGS_FILE!" echo.--atlas
                             >>"!ARGS_FILE!" echo.!ATLAS!)
if defined DTI              >>"!ARGS_FILE!" echo.--dti
if defined REGISTER_DTI     >>"!ARGS_FILE!" echo.--register-dti
if defined DENOISE_DTI      >>"!ARGS_FILE!" echo.--denoise-dti
if defined MAX_BVAL         (>>"!ARGS_FILE!" echo.--max-bval
                             >>"!ARGS_FILE!" echo.!MAX_BVAL!)
if defined DTI_MODEL         (>>"!ARGS_FILE!" echo.--dti-model
                             >>"!ARGS_FILE!" echo.!DTI_MODEL!)
if defined NO_ELECTRODES    >>"!ARGS_FILE!" echo.--no-electrodes
if defined SKIP_ELECTRODE_CLASH_CHECK >>"!ARGS_FILE!" echo.--skip-electrode-clash-check
if defined NO_ANONYMIZE     >>"!ARGS_FILE!" echo.--no-anonymize
if defined ZIP_OUTPUT       (>>"!ARGS_FILE!" echo.--zip-output
                             >>"!ARGS_FILE!" echo.!ZIP_OUTPUT!)
if defined FORCE_DOWNLOAD   >>"!ARGS_FILE!" echo.--force-download-atlas
if defined LOG_LEVEL        (>>"!ARGS_FILE!" echo.--log-level
                             >>"!ARGS_FILE!" echo.!LOG_LEVEL!)
if defined SUBJECT_ID       (>>"!ARGS_FILE!" echo.--subject-id
                             >>"!ARGS_FILE!" echo.!SUBJECT_ID!)

REM --- Pre-flight: verify pip is healthy ---
REM  A corrupted/partially-upgraded pip in the Sim4Life Python (common when
REM  Program Files was written without admin rights, or a pip self-upgrade was
REM  interrupted) fails with errors like:
REM    ImportError: cannot import name 'RequirementInformation'
REM                 from 'pip._vendor.resolvelib.structs'
REM  Detect this early and attempt a self-repair via ensurepip.
echo Checking pip health...
"%PYTHON_EXE%" -m pip --version >nul 2>&1
if errorlevel 1 (
    echo WARNING: pip appears to be broken in this Sim4Life Python.
    echo Attempting automatic repair via ensurepip...
    "%PYTHON_EXE%" -m ensurepip --upgrade
    "%PYTHON_EXE%" -m pip install --upgrade --force-reinstall pip
    "%PYTHON_EXE%" -m pip --version >nul 2>&1
    if errorlevel 1 (
        echo.
        echo ERROR: pip is broken in this Sim4Life Python and could not be repaired
        echo automatically:
        echo   %PYTHON_EXE%
        echo.
        echo This is an environment problem, not a problem with the pipeline.
        echo Please try the following ^(this location is under Program Files, so an
        echo elevated/Administrator terminal is usually required^):
        echo.
        echo   "%PYTHON_EXE%" -m ensurepip --upgrade
        echo   "%PYTHON_EXE%" -m pip install --upgrade --force-reinstall pip
        echo.
        echo If it still fails, check for a conflicting PYTHONPATH/PIP_TARGET:
        echo   "%PYTHON_EXE%" -m site
        echo.
        echo As a last resort, repair or reinstall Sim4Life to restore its pip.
        exit /b 1
    )
    echo pip repaired successfully.
)

REM --- Install personalizer package ---
REM  --no-warn-script-location suppresses expected "script is not on PATH"
REM  warnings: Sim4Life's Python\Scripts folder is never added to PATH, and
REM  nothing in this pipeline relies on it being there.
echo Installing personalizer package...
"%PYTHON_EXE%" -m pip install "%WHEEL_URL%" --no-cache-dir --force-reinstall --no-warn-script-location --quiet
if errorlevel 1 (
    echo.
    echo ERROR: Failed to install personalizer package.
    echo.
    echo If the error above mentions pip._vendor, resolvelib, or an ImportError,
    echo the Sim4Life Python's pip is corrupted. Repair it with ^(Administrator
    echo terminal^):
    echo   "%PYTHON_EXE%" -m ensurepip --upgrade
    echo   "%PYTHON_EXE%" -m pip install --upgrade --force-reinstall pip
    exit /b 1
)
echo Personalizer installed successfully.

REM --- Run the pipeline ---
echo.
echo Running personalizer pipeline...
echo   Sim4Life:    %SIM4LIFE_DIR%
echo   Python:      %PYTHON_EXE%
echo   Project:     %PROJECT_ROOT%
echo.

"%PYTHON_EXE%" -c "import sys;a=[l.strip() for l in open(sys.argv[1]) if l.strip()];sys.argv=['cli']+a;from personalizer.cli import main;main()" "!ARGS_FILE!"
SET "EXIT_CODE=%ERRORLEVEL%"
del "!ARGS_FILE!" 2>nul

if %EXIT_CODE% NEQ 0 (
    echo.
    echo Pipeline failed with exit code %EXIT_CODE%.
    exit /b %EXIT_CODE%
)

echo.
echo Pipeline completed successfully.
exit /b 0
