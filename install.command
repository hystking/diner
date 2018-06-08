#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$0")"
. "$SCRIPT_DIR/variables.sh"

echo copying scripts

mkdir -p $EXPORT_DIR

cp "$RESOURCE_DIR/startup.command" "$EXPORT_DIR/startup.command"

echo copying launchd plists

mkdir -p "$LAUNCHD_DIR"

sed "s#SCRIPTCOMMAND#$EXPORT_DIR/startup.command#" "$SCRIPT_DIR/resource/com.diner.startup.plist.template" > "$LAUNCHD_DIR/com.diner.startup.plist"

echo installing launchd

launchctl load -w "$LAUNCHD_DIR/com.diner.startup.plist"

echo install end
