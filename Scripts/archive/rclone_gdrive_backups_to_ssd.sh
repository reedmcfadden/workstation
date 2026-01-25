#!/bin/bash

# NOTE: this script is historic and no longer used because I switched from deja-dup to restic CLI, and my backups are now stored in a different gdrive location. Also, instead of cloning my gdrive backup to my external ssd, I am doing independent backups to each location. This should be better, in the case that my gdrive backups get corrupted, I won't be cloning back backups to my external ssd. So, there's more redundancy and safety.

rclone sync mygdrive:/fedora_laptop_backups /run/media/rmcfadden/421cc808-4ef1-432e-94df-9ec5f4b2321c --progress 
