#!/bin/bash

player="spotify"
status=$(playerctl --player=$player status 2>/dev/null)
if [ "$status" = "Playing" ]; then
    artist=$(playerctl --player=$player metadata artist)
    title=$(playerctl --player=$player metadata title)
    echo "{\"text\": \" $artist - $title\", \"class\": \"custom-$player\", \"alt\": \"$player\"}"
elif [ "$status" = "Paused" ]; then
    echo "{\"text\": \" Paused\", \"class\": \"custom-$player\", \"alt\": \"$player\"}"
else
    echo ""
fi
