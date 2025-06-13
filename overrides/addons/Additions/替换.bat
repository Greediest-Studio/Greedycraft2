@echo off
setlocal enabledelayedexpansion

:: 设置要查找和替换的字符串
set "search=greedycraft-"
set "replace="

:: 遍历当前目录及子目录中所有包含search字符串的文件
for /r %%F in ("*%search%*") do (
    set "oldname=%%~nxF"
    set "newname=!oldname:%search%=%replace%!"
    
    :: 只有当新文件名与旧文件名不同时才重命名
    if not "!oldname!"=="!newname!" (
        echo 正在重命名: "%%F" 到 "%%~dpF!newname!"
        ren "%%F" "!newname!"
    )
)

echo 重命名完成。
pause