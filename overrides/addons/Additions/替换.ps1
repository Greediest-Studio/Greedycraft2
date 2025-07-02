<#
.SYNOPSIS
    �����������ļ���ɾ���ļ����е�"greedycraft-"����

.DESCRIPTION
    �˽ű�������ű�����Ŀ¼����������Ŀ¼�������ļ����а���"greedycraft-"���ļ���
    �����ļ����е�"greedycraft-"����ɾ����

.NOTES
    �ļ���: Remove-GreedycraftPrefix.ps1
    ����: ��������
    ��������: $(Get-Date -Format "yyyy-MM-dd")
#>

# ��ȡ�ű�����Ŀ¼
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# Ҫɾ�����ַ���
$stringToRemove = "greedycraft-"

# �ݹ�������а���ָ���ַ������ļ�
Get-ChildItem -Path $scriptDirectory -File -Recurse | 
Where-Object { $_.Name -like "*$stringToRemove*" } |
ForEach-Object {
    # �������ļ���
    $newName = $_.Name -replace $stringToRemove, ""
    
    # ������ļ����Ƿ�����ļ�����ͬ
    if ($newName -ne $_.Name) {
        try {
            # ������������·��
            $newFullPath = Join-Path -Path $_.Directory.FullName -ChildPath $newName
            
            # �������ļ�
            Rename-Item -Path $_.FullName -NewName $newName -ErrorAction Stop
            
            Write-Host "��������: $($_.Name) -> $newName" -ForegroundColor Green
        }
        catch {
            Write-Host "������ʧ��: $($_.FullName) - $_" -ForegroundColor Red
        }
    }
}

Write-Host "�������!" -ForegroundColor Cyan