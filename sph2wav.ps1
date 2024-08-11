# 接收两个参数，分别是源目录和目标目录  
param (  
    [Parameter(Mandatory=$true)][string]$sourceDir,  
    [Parameter(Mandatory=$true)][string]$destinationDir  
)  
  
# 使用 Resolve-Path 获取绝对路径  
$sourceDir = (Resolve-Path $sourceDir).Path  
$destinationDir = (Resolve-Path $destinationDir).Path  
  
# 检查源目录是否存在  
if (-not (Test-Path -Path $sourceDir -PathType Container)) {  
    Write-Host "$sourceDir does not exist!"  
    exit 1  
}  
  
# 检查目标目录是否存在  
if (-not (Test-Path -Path $destinationDir -PathType Container)) {  
    Write-Host "$destinationDir does not exist!"  
    exit 1  
}  
  
# 使用 Get-ChildItem 查找所有.sph文件  
$files = Get-ChildItem -Path $sourceDir -Filter "*.sph" -File -Recurse  
  
# 计算找到的文件数量  
$cnt = $files.Count  
Write-Host "$cnt files in total"  
  
# 遍历每个文件  
foreach ($srcFile in $files) {  
    # 构造目标文件名  
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($srcFile.FullName)  
    $destFile = Join-Path -Path $destinationDir -ChildPath "$baseName.wav"  
      
    # 输出目标文件名  
    Write-Host $destFile  
      
    # 调用 sph2pipe.exe 转换文件  
    & .\sph2pipe.exe -f wav $srcFile.FullName > $destFile  
}  
  
# 输出转换完成的总文件数  
Write-Host "A total of $cnt files were converted"