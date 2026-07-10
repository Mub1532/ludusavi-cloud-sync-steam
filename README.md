## Steam Cloud Backup (to your own cloud)

- Script for Steam Games, to sync save data to your own cloud automatically, for games which do not support steam cloud.
- Designed to be as seamless and close to steam cloud as possible, without needing to run in the background all the time and with the least interruptions as possible.

- This script automatically backs up, syncs and restores save data from your own cloud for games which do not support steam cloud. It only runs when needed when a game is launched.

- Uses [Ludusavi](https://github.com/mtkennerly/ludusavi) for the heavy lifting such as backup, restore, cloud, fixing conflict etc

## How It Works:

**On game launch:**
- It checks the cloud backup and local backup and syncs (or prompts about conflicts)
- It then restores that to the save data if needed, (or prompts about conflicts)

**On game exit:**
- It backs up your save data, then syncs it with the cloud
- Sends a notification if successful/failed

## Usage

Add this launch option to any steam game you want to back up

```
<location of script>/game-backup-linux.sh %command%
````
#### Example:
<img width="420" height="126" alt="image" src="https://github.com/user-attachments/assets/98e1d05a-bece-4710-a987-a1f1f8adb0a1" />


## Notes & Future Improvements
This script is for linux only.

## Requirements
- [Ludusavi setup with cloud enabled](https://github.com/mtkennerly/ludusavi)
- notify-send (if you do not want notifs you can comment this out in the file)
