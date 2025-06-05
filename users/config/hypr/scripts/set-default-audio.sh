#!/run/current-system/sw/bin/bash
# Set internal audio as default
sleep 2  # Let PipeWire initialize first
wpctl set-default 218
