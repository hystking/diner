#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$0")"
. "$SCRIPT_DIR/variables.sh"

echo remove scripts

rm -rf "$EXPORT_DIR"

echo unload launchd

launchctl unload -w "$LAUNCHD_DIR/com.diner.startup.plist"

echo remove launchd plists

rm "$LAUNCHD_DIR/com.diner.startup.plist"
