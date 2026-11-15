# One-time setup on a teammate's Windows PC (the Mac uses setup.sh instead).
# Run from the project folder:  powershell -ExecutionPolicy Bypass -File setup_windows.ps1
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is missing. Install 'App Installer' from the Microsoft Store, then run this again."
    exit 1
}

# ffmpeg, yt-dlp and Python 3.12 (same versions of the tools as the Mac setup)
foreach ($id in "Gyan.FFmpeg", "yt-dlp.yt-dlp", "Python.Python.3.12") {
    Write-Host "Installing $id ..."
    winget install --id $id -e --accept-source-agreements --accept-package-agreements --silent
}

# winget changes PATH for new windows only: reload it here so the next steps find the tools.
$env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" +
            [Environment]::GetEnvironmentVariable("Path", "User")
foreach ($tool in "ffmpeg", "ffprobe", "yt-dlp") {
    if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) {
        Write-Host "$tool is installed but not found yet. Close VS Code, open it again, and rerun this."
        exit 1
    }
}

if (-not (Test-Path ".venv")) { py -3.12 -m venv .venv }
& .venv\Scripts\python.exe -m pip install --upgrade pip
& .venv\Scripts\pip.exe install -r requirements-windows.txt
# RapidOCR without its own OpenCV copy (it would clash with opencv-contrib-python).
& .venv\Scripts\pip.exe install --no-deps rapidocr_onnxruntime==1.4.4

New-Item -ItemType Directory -Force -Path work, input, output | Out-Null
Write-Host "Done. Now link the shared Drive folders (START HERE.md, Windows step 6)."
