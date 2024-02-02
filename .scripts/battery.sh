#!/bin/bash
battery=$(acpi | grep -P -o '\d+(?=%)')
if [ "$battery" -lt 10 ]; then
    notify-send --urgency=critical "Low Battery"
fi
