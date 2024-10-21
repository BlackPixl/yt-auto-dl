#!/bin/bash

# Define log file route.
LOGFILE="../logs/logs_yt-auto-dl.txt"

# log tiemstamp of execution start.
echo "---------------------------------------------------" >> "$LOGFILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Execution started" >> "$LOGFILE"
echo "---------------------------------------------------" >> "$LOGFILE"

# Activate virtual environment to run yt-dlp.
source ./virtual_environment/yt-dlp/bin/activate

# Define Playlist URL
PLAYLIST_URL=https://music.youtube.com/playlist?list=

# Start the download.
yt-dlp -f 140 --download-archive ./music_history -o "%(title)s - %(channel)s.%(ext)s" "$PLAYLIST_URL" >> "$LOGFILE" 2>&1

# log execution status.
if [$? -eq 0]; then
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Download Successful." >> "$LOGFILE"
else
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Error downloading." >> "$LOGFILE"
fi

# Deactivate virtual environment.
deactivate

# log end of execution.
echo "$(date '+%Y-%m-%d %H:%M:%S') - Execution ended." >> "$LOGFILE"
echo "" >> "$LOGFILE"
