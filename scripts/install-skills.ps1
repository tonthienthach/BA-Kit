param (
    [string]$TargetPath = "",
    [switch]$Global
)

$SourceSkillsDir = Join-Path $PSScriptRoot "..\.agents\skills"

if (-not (Test-Path $SourceSkillsDir)) {
    Write-Error "Không tìm thấy thư mục nguồn: $SourceSkillsDir"
    exit 1
}

if ($Global) {
    $TargetDir = "$env:USERPROFILE\.gemini\config\skills"
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }
    Copy-Item -Path "$SourceSkillsDir\*" -Destination $TargetDir -Recurse -Force
    Write-Host "[SUCCESS] Đã cài đặt toàn bộ BA Skills vào Global: $TargetDir" -ForegroundColor Green
    exit 0
}

if ($TargetPath -ne "") {
    if (-not (Test-Path $TargetPath)) {
        Write-Error "Thư mục đích không tồn tại: $TargetPath"
        exit 1
    }
    $Dest = Join-Path $TargetPath ".agents\skills"
    if (-not (Test-Path $Dest)) {
        New-Item -ItemType Directory -Path $Dest -Force | Out-Null
    }
    Copy-Item -Path "$SourceSkillsDir\*" -Destination $Dest -Recurse -Force
    Write-Host "[SUCCESS] Đã cài đặt toàn bộ BA Skills vào Workspace: $Dest" -ForegroundColor Green
    exit 0
}

Write-Host "Vui lòng chọn tham số cài đặt:" -ForegroundColor Yellow
Write-Host "  -Global : Cài đặt cho tất cả dự án (Global)"
Write-Host "  -TargetPath <Path> : Cài đặt vào workspace cụ thể"
