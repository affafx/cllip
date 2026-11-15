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

## Every day
1. **Before you start:** in GitHub Desktop, click **Fetch origin**, then **Pull**. You now have everyone's latest rules and lessons.
2. **Work:** in the Claude panel, use `/clip <client>` and `/edit <page>`. To finish an edit in CapCut, ask Claude to "make a CapCut project". Quit CapCut first.
3. **When you finish:** in GitHub Desktop, write a short note of what changed (e.g. "new client: Lucas") and click **Commit**, then **Push**.

## The one rule about rules
Changes to **CLAUDE.md, LESSONS.md, a client's clipping.md, a style file or a preset** go to Talha for approval:
- Make them on a new branch: GitHub Desktop › Branch › New branch.
- Push the branch, then click **Create Pull Request**.
- Talha approves or comments on it.

Scripts and new client folders can go straight in. Claude knows this and asks before changing a rule.

## Windows
The face tracking that centres B-roll, and the CapCut project builder, are Mac-only for now. On Windows you can do clipping (`/clip`). Ask Talha before editing on Windows.
