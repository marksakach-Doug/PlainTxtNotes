# Linux Note Scripts

Two small Bash scripts for keeping plain-text notes:

- **`new-note.sh`** opens a new text file named with the current date and time.
- **`search-notes.sh`** searches all your notes for a word, shows the matching lines, and lets you open a matching file by number.

Notes are ordinary `.txt` files in a folder outside this repository, so your personal notes are never committed.

## Requirements

- Linux with Bash 4 or newer and `grep`
- A GUI text editor (FeatherPad by default)

## Setup

```bash
chmod +x new-note.sh search-notes.sh
```

To run them from anywhere, link them into a folder on your `PATH`:

```bash
mkdir -p ~/.local/bin
ln -s "$PWD/new-note.sh" ~/.local/bin/new-note
ln -s "$PWD/search-notes.sh" ~/.local/bin/search-notes
```

## Usage

```bash
./new-note.sh       # opens a new note; nothing is saved until you save in the editor
./search-notes.sh   # type a word, then a number to open a match; press Enter to quit
```

Example note name: `2026-09-24_07:30:00 PM.txt`

## Configuration

Set these environment variables to change the defaults:

| Variable | Default | Purpose |
|---|---|---|
| `NOTES_DIR` | `$HOME/Documents/Notes` | Where notes are stored |
| `NOTES_EDITOR` | `featherpad` | Editor command used to open notes |

For example: `NOTES_EDITOR=mousepad ./new-note.sh`

## How search works

Search is case-insensitive and matches **whole words only**, so searching for `tone` will not match `tones`. It treats what you type as plain text, not a pattern, so characters like `.` and `*` are safe to search for.
