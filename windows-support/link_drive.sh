#!/bin/bash
# Connect the shared Drive media (music, sound effects) into this project. Run once: bash link_drive.sh
# Needs Google Drive for desktop, with "Clipping Studio Media" added to My Drive
# (in Drive on the web: Shared with me › right-click the folder › Organize › Add shortcut › My Drive).
cd "$(dirname "$0")"
media=$(find "$HOME/Library/CloudStorage" -maxdepth 4 -type d -name "Clipping Studio Media" 2>/dev/null | grep -v "/.Encrypted/" | head -1)
[ -n "$media" ] || { echo "Can't find 'Clipping Studio Media' in Google Drive. Add the shortcut to My Drive first (see above)."; exit 1; }
for d in music sfx; do
    if [ -L "brand/$d" ] || [ ! -e "brand/$d" ]; then
        ln -sfn "$media/brand/$d" "brand/$d"
        echo "brand/$d -> $media/brand/$d"
    else
        echo "brand/$d already exists here as a real folder, left as is."
    fi
done
echo "Reference edits and clips: open them straight from the Drive folder ($media/clients)."
