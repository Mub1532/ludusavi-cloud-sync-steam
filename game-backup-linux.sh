#!/bin/bash

# Steam launch options (same for every game): <location of script>/game-backup-linux.sh %command%

# get the game from ludusavi, from the steam id and the icon for the notification
APPID="$SteamAppId"
ICON="steam_icon_${APPID}"
GAME_NAME=$(ludusavi find --steam-id "$APPID" 2>/dev/null | head -1)
[ -z "$GAME_NAME" ] && GAME_NAME="AppID $APPID"

# Restore Save if needed: (checks cloud sync, prompts if conflict or save data is newer than the backup etc, applies backup to live save if any changes)
ludusavi restore --cloud-sync --gui --force --no-force-cloud-conflict --ask-downgrade "$GAME_NAME"

# launch the game after this is done
"$@"

# backup the game to the cloud, only prompting if any conflicts
ludusavi backup --force --no-force-cloud-conflict --gui "$GAME_NAME"

# Send notification if it was successfull or failed, NOTE: if you do not want notifications, comment out all the lines under this
if [ $? -eq 0 ]; then
    notify-send -a "Ludusavi Game Backup" -i "$ICON" -t 5000 "$GAME_NAME" "Backup Complete"
else
    notify-send -a "Ludusavi Game Backup" -u critical -i "$ICON" -t 5000 "$GAME_NAME" "Backup Failed"
fi
