<#
.SYNOPSIS
    批量重命名文件，删除文件名中的"greedycraft-"部分

.DESCRIPTION
    此脚本会遍历脚本所在目录及其所有子目录，查找文件名中包含"greedycraft-"的文件，
    并将文件名中的"greedycraft-"部分删除。

.NOTES
    文件名: Remove-GreedycraftPrefix.ps1
    作者: 您的名字
    创建日期: $(Get-Date -Format "yyyy-MM-dd")
#>

# 获取脚本所在目录
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# 要删除的字符串
$stringToRemove = "greedycraft-"

# 递归查找所有包含指定字符串的文件
Get-ChildItem -Path $scriptDirectory -File -Recurse | 
Where-Object { $_.Name -like "*$stringToRemove*" } |
ForEach-Object {
    # 构造新文件名
    $newName = $_.Name -replace $stringToRemove, ""
    
    # 检查新文件名是否与旧文件名不同
    if ($newName -ne $_.Name) {
        try {
            # 构建完整的新路径
            $newFullPath = Join-Path -Path $_.Directory.FullName -ChildPath $newName
            
            # 重命名文件
            Rename-Item -Path $_.FullName -NewName $newName -ErrorAction Stop
            
            Write-Host "已重命名: $($_.Name) -> $newName" -ForegroundColor Green
        }
        catch {
            Write-Host "重命名失败: $($_.FullName) - $_" -ForegroundColor Red
        }
    }
}

Write-Host "操作完成!" -ForegroundColor Cyan