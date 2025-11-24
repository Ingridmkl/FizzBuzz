param([Parameter(ValueFromRemainingArguments=$true)][string[]]$args)

$scriptPath = $MyInvocation.MyCommand.Definition
$repoRoot = Split-Path -Parent $scriptPath
$mavenBase = Join-Path $repoRoot ".maven"
$mavenDir = Join-Path $mavenBase "apache-maven-3.9.6"

if (-not (Test-Path (Join-Path $mavenDir "bin\mvn.cmd"))) {
    New-Item -ItemType Directory -Force -Path $mavenBase | Out-Null
    $zip = Join-Path $mavenBase "maven.zip"
    $url = "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip"
    Write-Host "Downloading Maven..."
    Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
    Write-Host "Extracting Maven..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zip, $mavenBase)
    Remove-Item $zip -Force
}

& (Join-Path $mavenDir "bin\mvn.cmd") @args
