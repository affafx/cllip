#!/bin/bash
# One-time setup on a teammate's Mac. Run from the project folder: bash setup.sh
set -e
cd "$(dirname "$0")"
command -v brew >/dev/null || { echo "Install Homebrew first: https://brew.sh"; exit 1; }
xcode-select -p >/dev/null 2>&1 || { echo "Installing Apple's command line tools (needed for face tracking)..."; xcode-select --install; exit 1; }
brew install ffmpeg yt-dlp python@3.12 gh
[ -d .venv ] || "$(brew --prefix python@3.12)/bin/python3.12" -m venv .venv
.venv/bin/pip install -r requirements.txt
mkdir -p work input output
echo "Done. Now link the shared Drive folders (see START HERE.md, step 5), then tell Claude: connect GitHub."
