param(
    [string]$ProjectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'

$ProjectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
$outputDir = Join-Path $ProjectRoot 'app\build\outputs\apk\home\debug'
$targetPath = Join-Path $outputDir 'app-home-universal-debug.apk'

Push-Location $ProjectRoot
try {
    & .\gradlew :app:assembleHomeDebug
    if ($LASTEXITCODE -ne 0) {
        throw "Gradle build failed with exit code $LASTEXITCODE"
    }
} finally {
    Pop-Location
}

if (!(Test-Path -LiteralPath $targetPath)) {
    throw "Target APK was not produced: $targetPath"
}

Get-Item -LiteralPath $targetPath | Select-Object FullName, Length, LastWriteTime
