# Connect the shared Drive media (music, sound effects) into this project on Windows (Mac: link_drive.sh).
# Run once:  powershell -ExecutionPolicy Bypass -File link_drive_windows.ps1
# Needs Google Drive for desktop, with "Clipping Studio Media" added to My Drive
# (in Drive on the web: Shared with me > right-click the folder > Organize > Add shortcut > My Drive).
Set-Location $PSScriptRoot

# Drive for desktop shows up as its own drive letter (usually G:) or, in mirror mode, in the user folder.
$roots = @(Get-PSDrive -PSProvider FileSystem | ForEach-Object { Join-Path $_.Root "My Drive" })
$roots += Join-Path $env:USERPROFILE "My Drive"
$media = $roots | ForEach-Object { Join-Path $_ "Clipping Studio Media" } |
         Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $media) {
    Write-Host "Can't find 'Clipping Studio Media' in Google Drive. Add the shortcut to My Drive first (see above)."
    exit 1
}

foreach ($d in "music", "sfx") {
    $link = "brand\$d"
    $target = Join-Path $media "brand\$d"
    $item = Get-Item $link -ErrorAction SilentlyContinue
    if ($item -and -not $item.LinkType) {
        Write-Host "$link already exists here as a real folder, left as is."
        continue
    }
    if ($item) { $item.Delete() }  # an old link: removes only the link, never the Drive files
    # A symbolic link reaches the Drive letter; it needs Windows Developer Mode (or an admin window).
    try {
        New-Item -ItemType SymbolicLink -Path $link -Target $target -ErrorAction Stop | Out-Null
        Write-Host "$link -> $target"
    } catch {
        Write-Host "Windows blocked the link for $link. Turn on Developer Mode"
        Write-Host "(Settings > System > For developers > Developer Mode), then run this again."
        exit 1
    }
}
Write-Host "Reference edits and clips: open them straight from the Drive folder ($media\clients)."
