#!/bin/bash
# Creates a new note named with the current date and time and opens it in a text editor.
# Nothing is written to disk until you save in the editor.
#
# Configuration (environment variables):
#   NOTES_DIR     Where notes are stored.  Default: $HOME/Documents/Notes
#   NOTES_EDITOR  Editor command.          Default: featherpad

NOTES_DIR="${NOTES_DIR:-$HOME/Documents/Notes}"
NOTES_EDITOR="${NOTES_EDITOR:-featherpad}"

if ! command -v "$NOTES_EDITOR" >/dev/null 2>&1; then
    echo "Editor '$NOTES_EDITOR' not found. Install it or set NOTES_EDITOR (for example: NOTES_EDITOR=mousepad)." >&2
    exit 1
fi

mkdir -p "$NOTES_DIR"

filename="$(date +%F_%r).txt"

"$NOTES_EDITOR" "$NOTES_DIR/$filename" &
