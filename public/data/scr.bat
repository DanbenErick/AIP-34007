@echo off
setlocal enabledelayedexpansion


set "CSV_FILE=estudiantes.csv"


set "JSON_CONTENT=[""""]"


if not exist "%CSV_FILE%" (
    echo Error: CSV file '%CSV_FILE%' not found in the current directory.
    echo Please make sure '%CSV_FILE%' is in the same directory as this script.
    pause
    exit /b 1
)

echo Reading data from '%CSV_FILE%' and creating DNI-only folders with index.json files...


for /f "skip=1 tokens=1,2 delims=;" %%a in ('type "%CSV_FILE%"') do (
    set "DNI=%%a"
    set "FULL_NAME=%%b"

    
    for /f "delims=" %%x in ("!DNI!") do set "FOLDER_NAME=%%x"

    
    mkdir "!FOLDER_NAME!"

    
    if exist "!FOLDER_NAME!\" (
        
        set "JSON_FILE_PATH=!FOLDER_NAME!\index.json"

        
        echo !JSON_CONTENT! > "!JSON_FILE_PATH!"

        echo Created folder and index.json: "!FOLDER_NAME!"
    ) else (
        echo Failed to create folder: "!FOLDER_NAME!". Skipping index.json creation.
    )
)

echo Creado archivos index.json del DNI '%CSV_FILE%'.
pause