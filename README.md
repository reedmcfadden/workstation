# workstation

Personal laptop configuration using Ansible. Includes package installation, dotfiles, wallpaper rotation, and automated restic backups to S3.

## Quick Start

On a fresh Fedora install:

```bash
curl -fsSL https://raw.githubusercontent.com/reedmcfadden/workstation/main/bootstrap.sh | bash
```

Or manually:

```bash
sudo dnf install -y ansible git
git clone git@github.com:reedmcfadden/workstation.git ~/Repos/workstation
cd ~/Repos/workstation
ansible-playbook setup.yml --ask-become-pass
```

## What's Included

### Ansible Roles

| Role | Description |
|------|-------------|
| `packages` | CLI tools, desktop apps, dev tools, containers |
| `dotfiles` | Symlinks .bashrc, .vimrc, .tmux.conf, .profile and scripts |
| `gnome` | Dark mode, night light, and monospace font settings |
| `restic` | Automated daily backups to S3 with systemd timer and failure notifications |
| `wallpaper` | Wallpaper rotation from folder with systemd timer |

### Scripts

The following scripts are included and symlinked to `~/.local/bin`:

| Script | Description |
|--------|-------------|
| `dockerrun` | Run a command in a docker container |
| `get_custom_time` | Get the time in a custom format |
| `inpath` | Check if a command is in the path |
| `new_note` | Create a new note |
| `notify-failure` | Send a desktop notification on service failure |
| `restic-status` | Check the status of restic backups |
| `rotate-wallpaper.sh` | Rotate the wallpaper |
| `startscreenkey` | Start screenkey |
| `take_note` | Take a quick note |
| `todays_note` | Open today's note |

### Packages

**CLI:** git, vim, tmux, htop, curl, wget, rsync, tree, jq, yq, ripgrep, fzf, gh

**Desktop:** gnome-tweaks, firefox, libreoffice, virt-manager, Joplin (flatpak)

**Dev:** gcc, make, ansible, ansible-lint, ShellCheck, python3, podman

### Dotfiles

- `.bashrc` - Vanilla RHEL with vi mode
- `.vimrc` - Vanilla with 2-space tabs
- `.tmux.conf` - Vanilla with vi mode
- `.profile` - Standard path setup

## Post-Setup

After running the playbook, configure restic backups:

```bash
vim ~/.config/restic/env  # Add AWS credentials and password
source ~/.config/restic/env
restic init
```

## Backup Commands

```bash
# Check backup status
systemctl --user list-timers

# Run backup manually
systemctl --user start restic-backup.service

# View snapshots
source ~/.config/restic/env && restic snapshots

# Restore files
restic restore latest --target /tmp/restore --include Documents
```

## Customization

Edit package lists in `roles/packages/vars/main.yml`.
