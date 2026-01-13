#!/bin/bash
# lib/constants.sh - Centralized constants for usb-driver
# All configurable values and defaults should be defined here.
# shellcheck disable=SC2034 # These constants are used by other sourced files

# =========================
# Paths
# =========================
DEFAULT_MOUNT_POINT="/mnt/usb-driver"
LEGACY_MOUNT_POINT="/mnt/bkp-pendrive"
CONFIG_DIR="$HOME/.config/usb-driver"

# =========================
# usbipd-win
# =========================
USBIPD_EXE='C:\Program Files\usbipd-win\usbipd.exe'

# =========================
# Retry & Timeout Settings
# =========================
ATTACH_RETRIES="${ATTACH_RETRIES:-3}"
ATTACH_DELAY="${ATTACH_DELAY:-3}"
STABILIZATION_DELAY="${STABILIZATION_DELAY:-5}"
DEVICE_DETECTION_RETRIES="${DEVICE_DETECTION_RETRIES:-15}"

# =========================
# Filesystem Support
# =========================
SUPPORTED_FS="ext4|ntfs|vfat|exfat|fuseblk"

# =========================
# USB Device Filters
# =========================
USB_STORAGE_FILTER="Mass Storage|Armazenamento|UAS|SCSI"

# =========================
# Helper: Parse usbipd state
# Input: A line from `usbipd list`
# Output: Prints one of: Attached, Shared, NotShared
# =========================
parse_usbipd_state() {
    local line="$1"
    
    if echo "$line" | grep -qi "Attached"; then
        echo "Attached"
    elif echo "$line" | grep -qi "Not shared"; then
        echo "NotShared"
    elif echo "$line" | grep -qi "Shared"; then
        echo "Shared"
    else
        # Fallback: extract last word
        echo "$line" | awk '{print $NF}'
    fi
}
