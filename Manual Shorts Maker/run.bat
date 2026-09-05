@echo off
setlocal enabledelayedexpansion

:: --- CONFIGURATION ---
set "INPUT_VIDEO=input.mp4"
set "OUTPUT_FOLDER=output"
:: ---------------------

if not exist "%OUTPUT_FOLDER%" mkdir "%OUTPUT_FOLDER%"

set "START_TIME="
set "END_TIME="

:: Scan for start and end text files
for %%F in (*.txt) do (
    set "filename=%%~nF"
    
    :: Clean up characters to leave just the digits
    set "clean=!filename:[=!"
    set "clean=!clean:]=!"
    set "clean=!clean:(=!"
    set "clean=!clean:)=!"
    set "clean=!clean:hr=!"
    set "clean=!clean:min=!"
    set "clean=!clean:sec=!"
    set "clean=!clean: =!"

    :: Assign based on suffix
    if not "!filename:- start=!"=="!filename!" (
        set "clean=!clean:-start=!"
        set "START_TIME=!clean:~0,2!:!clean:~2,2!:!clean:~4,2!"
    )
    if not "!filename:- end=!"=="!filename!" (
        set "clean=!clean:-end=!"
        set "END_TIME=!clean:~0,2!:!clean:~2,2!:!clean:~4,2!"
    )
)

if "%START_TIME%"=="" (
    echo Error: Could not find or parse '- start' text file.
    pause
    exit /b
)
if "%END_TIME%"=="" (
    echo Error: Could not find or parse '- end' text file.
    pause
    exit /b
)

echo Found timestamps! Cutting from %START_TIME% to %END_TIME%...

:: Run ffmpeg to cut, scale to 1080 width, pad to 1920 height with black bars, and center it
ffmpeg -y -ss %START_TIME% -to %END_TIME% -i "%INPUT_VIDEO%" -vf "scale=1080:-1,pad=1080:1920:(ow-iw)/2:(oh-ih)/2:black" -c:v libx264 -c:a aac "%OUTPUT_FOLDER%\short_form.mp4"

echo Done! Video saved to %OUTPUT_FOLDER%\short_form.mp4
pause
