@echo off
setlocal EnableDelayedExpansion

REM Ruta base
set "base_path=public\data"

REM Cambiar al directorio base
cd /d "%~dp0%base_path%"

echo Escaneando carpetas internas y generando index.json...

REM Iterar sobre todas las carpetas dentro de data
for /d %%F in (*) do (
    set "folder=%%F"
    set "json_content=["
    set "file_list="

    REM Iterar sobre los archivos dentro de la carpeta, excluyendo index.json
    for %%A in ("%%F\*") do (
        if /I not "%%~nxA"=="index.json" (
            set "file=%%~nxA"
            set "json_content=!json_content!"!file!","
            set "file_list=!file_list! !file!"
        )
    )

    REM Eliminar la última coma y cerrar el array
    if not "!json_content!"=="[" (
        set "json_content=!json_content:~0,-1!"
    )
    set "json_content=!json_content!]"

    REM Escribir en index.json
    (
        echo !json_content!
    ) > "%%F\index.json"

    REM Mensaje de archivos agregados
    echo Se ha actualizado %%F\index.json con los archivos: !file_list!
)

echo.
echo Todos los index.json han sido actualizados correctamente.
pause
