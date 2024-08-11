@echo off
setlocal enabledelayedexpansion

:: Check if a file was dragged and dropped onto the batch file
if "%~1"=="" (
    :: No file was provided, ask the user for the input file
    set /p input_file="Enter the full path of the video file: "
) else (
    :: A file was dropped onto the batch file
    set input_file=%~1
)

:: Check if the file exists
if not exist "%input_file%" (
    echo Error: The file "%input_file%" does not exist.
    pause
    exit /b
)

echo Processing file: %input_file%

:: Set output file name (can be customized or derived from input)
set output_file=%~dpn1_cropped.mp4

:: Step 1: Detect the crop values
echo Detecting crop values...
for /f "tokens=2 delims==" %%a in ('ffmpeg -i "%input_file%" -vf "cropdetect=24:16:0" -f null - 2^>^&1 ^| findstr /r /c:"crop="') do (
    set crop_params=%%a
)

:: Trim any unwanted characters (like trailing ']')
set crop_params=%crop_params:]=%

:: Check if crop parameters were correctly extracted
if "%crop_params%"=="" (
    echo Error: Failed to detect crop values. Please check the video file.
    pause
    exit /b
)

echo Detected crop values: %crop_params%

:: Step 2: Apply the detected crop values with verbose output
echo Applying crop: %crop_params%
ffmpeg -i "%input_file%" -vf "crop=%crop_params%" -c:a copy "%output_file%" -v verbose

if %errorlevel% neq 0 (
    echo Error: Failed to crop the video.
    pause
    exit /b
)

echo Cropping completed! Output file: %output_file%
pause
