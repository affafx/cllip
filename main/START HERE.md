# Start here: Clipping Studio for the team

This folder is the studio's brain: rules, client styles, lessons and the editing scripts. Everyone works from the same copy on GitHub, so when someone improves something, everyone gets it.
Videos, music and B-roll are too big for GitHub. They live in the shared Google Drive folder **Clipping Studio Media**.

## One-time setup (Mac, about 20 minutes)
1. Install **VS Code** (code.visualstudio.com), then the **Claude Code** extension inside it, and sign in with your Claude account.
2. Install **GitHub Desktop** (desktop.github.com) and sign in with the GitHub account Talha invited.
3. In GitHub Desktop: **File › Clone repository**, pick **clipping-studio**, and save it in your home folder.
4. Open that folder in VS Code (File › Open Folder). In the Claude panel, type: **run the setup**. Claude runs `setup.sh`, which installs ffmpeg, yt-dlp and Python. Say yes when it asks.
5. Install **Google Drive for desktop** and sign in. In Drive on the web, open **Shared with me**, right-click **Clipping Studio Media** › **Organize › Add shortcut › My Drive**. Then tell Claude: **run link_drive.sh**. That connects the music and sound effects.
6. Install **CapCut** from the App Store if you finish edits in CapCut.
7. In the Claude panel, type: **connect GitHub**. Claude shows a code: open github.com/login/device, type it, click **Authorize**. From then on Claude sends your work to GitHub itself.

## Every day
1. **Before you start:** nothing. When you open Claude it pulls everyone's latest rules and lessons by itself.
2. **Work:** in the Claude panel, use `/clip <client>` and `/edit <page>`. To finish an edit in CapCut, ask Claude to "make a CapCut project". Quit CapCut first.
3. **When you finish:** nothing. Claude shares your changes on its own (`/share`): new rules go to Talha as a pull request, scripts go straight in. It tells you what it sent. Finished videos never go to GitHub.

## The one rule about rules
Changes to **CLAUDE.md, LESSONS.md, a client's clipping.md, a style file or a preset** need Talha's approval. Claude puts them on a new branch and opens a pull request: GitHub emails Talha, who approves or comments. Scripts and new client folders go straight in.
GitHub Desktop still works for anything by hand, but you shouldn't need it.

## One-time setup (Windows, about 30 minutes)
Same studio, Windows tools. The Mac files (setup.sh, link_drive.sh) are not used on Windows.
1. Install **VS Code** (code.visualstudio.com), then the **Claude Code** extension inside it, and sign in with your Claude account.
2. Install **Git for Windows** (git-scm.com, default options). Claude Code on Windows needs it.
3. Install **GitHub Desktop** (desktop.github.com) and sign in with the GitHub account Talha invited.
4. In GitHub Desktop: **File › Clone repository**, pick **clipping-studio**, and save it in your user folder (for example C:\Users\<you>\clipping-studio).
5. Open that folder in VS Code (File › Open Folder). In the Claude panel, type: **run the Windows setup**. Claude runs `setup_windows.ps1`, which installs ffmpeg, yt-dlp and Python with winget. Say yes when it asks. If it says a tool isn't found yet, close and reopen VS Code and ask again.
6. Install **Google Drive for desktop** and sign in. Add **Clipping Studio Media** to My Drive as in Mac step 5. Turn on **Developer Mode** (Settings › System › For developers), then tell Claude: **run link_drive_windows.ps1**.
7. In the Claude panel, type: **connect GitHub** (same as Mac step 7).
8. Python on Windows is `.venv\Scripts\python.exe` (on Mac `.venv/bin/python`). Claude handles this.

### What's different on Windows
- `/clip` and `/edit` both work. Face tracking and the QC watermark check use OpenCV and RapidOCR instead of Apple Vision. The first edit downloads a small face model (0.3 MB).
- Face centring matches the Mac. When a B-roll shot has no face, the fallback that finds bodies or the main object is weaker than the Mac's: check those shots by eye.
- The CapCut project builder is Mac-only for now. Post the rendered clip from the output folder.
- Emoji in hooks use Windows' emoji design.
