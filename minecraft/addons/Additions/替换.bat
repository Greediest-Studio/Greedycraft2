@echo off
setlocal enabledelayedexpansion

:: 获取当前文件夹路径
set "folder=%~dp0"

:: 遍历当前文件夹及其子文件夹中的所有文件
for /r "%folder%" %%f in (*greedycraft-*) do (
    set "filename=%%~nxf"
    set "newname=!filename:greedycraft-=!"
    if not "!filename!"=="!newname!" (
        echo Renaming "%%f" to "%%~dpf!newname!"
        ren "%%f" "!newname!"
    )
)

echo Finished renaming.
pause
