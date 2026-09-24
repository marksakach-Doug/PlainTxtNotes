#!/bin/bash
# Search notes by keyword. Shows matching lines, then lets you open a matched
# file directly by number instead of hunting for it in a file manager.
#
# Configuration (environment variables):
#   NOTES_DIR     Where notes are stored.  Default: $HOME/Documents/Notes
#   NOTES_EDITOR  Editor command.          Default: featherpad

NOTES_DIR="${NOTES_DIR:-$HOME/Documents/Notes}"
NOTES_EDITOR="${NOTES_EDITOR:-featherpad}"

if [[ ! -d "$NOTES_DIR" ]]; then
    echo "Notes folder not found: $NOTES_DIR" >&2
    echo "Create a note first with new-note.sh, or set NOTES_DIR." >&2
    exit 1
fi

while true; do
    echo "Enter the word you want to find (or press Enter to quit):"
    read -r word
    echo

    [[ -z "$word" ]] && break

    mapfile -t matches < <(grep -R -l -i -w -F -- "$word" "$NOTES_DIR")

    if [[ ${#matches[@]} -eq 0 ]]; then
        echo "No matches found."
        echo
        continue
    fi

    for i in "${!matches[@]}"; do
        file="${matches[$i]}"
        printf "%d) %s\n" "$((i + 1))" "$(basename "$file")"
        grep -i -w -F --color=always -- "$word" "$file" | sed 's/^/     /'
        echo
    done

    echo "Enter a number to open that file in $NOTES_EDITOR, or press Enter to search again:"
    read -r choice

    if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 1 && choice <= ${#matches[@]} )); then
        "$NOTES_EDITOR" "${matches[$((choice - 1))]}" &
    fi
    echo
done
