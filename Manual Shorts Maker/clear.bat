@echo off
if exist "output" (
    echo Clearing output folder...
    del /q "output\*"
    echo Folder cleared successfully!
) else (
    echo Output folder does not exist yet.
)
pause
