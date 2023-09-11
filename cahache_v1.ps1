Add-Type -AssemblyName PresentationFramework

$basePath = "$env:USERPROFILE\AppData\Local\Temp"

$pattern = "swcefcache*"

Write-Host "Searching for '$pattern' in $basePath .."

$target = Get-ChildItem -Path $basePath -Directory | Where-Object { $_.Name -like $pattern }

if ($target) {
    $target | ForEach-Object {
        Remove-Item -Path $_.FullName -Recurse -Force
    }
    Write-Host "-- Done --"
    [System.Windows.MessageBox]::Show("Target obliterated! 🚀", "CaHache v1.0")
} else {
    Write-Host "-- Done --"
    [System.Windows.MessageBox]::Show("Nothing hiding here :-)", "CaHache v1.0")
}
