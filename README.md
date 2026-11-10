My dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

## Targets

- **macOS**: zsh, Ghostty, Neovim, tmux, yazi, starship.
- **Vanilla Arch Linux** (`experimental/vanilla-arch` branch): Umbriel compositor,
  Noctalia shell + Noctalia Greeter, GTK apps, fcitx5/Mozc, QEMU/libvirt.

Linux scripts only run when `/etc/os-release` reports `ID=arch`.

## Vanilla Arch install

1. Install a minimal Arch system (e.g. `archinstall` with the *Minimal* profile,
   NetworkManager, PipeWire, a non-root sudo user, `linux` + firmware).
2. Log in on the TTY and run:

   ```sh
   sudo pacman -S --needed git chezmoi
   chezmoi init --apply --branch experimental/vanilla-arch https://github.com/cvans/dotfiles.git
   ```

3. Reboot. greetd starts the Noctalia Greeter; pick the **Umbriel** session.
4. First-login follow-ups (GUI-only settings):
   - Noctalia → Settings → Plugins → *Screen Toolkit*: set the OCR language to
     `jpn+eng` (use `jpn_vert` for vertical text).
   - Optional: `sudo noctalia-greeter-apply-appearance` after picking a wallpaper
     so the greeter matches the session.
   - `fcitx5-configtool` to adjust Mozc / the input-method toggle (default
     `Ctrl+Space`).

### What the scripts do

| Script | Purpose |
| --- | --- |
| `00_install-packages` | pacman (official) → yay (AUR, bootstrapped if missing) → Flatpak |
| `05_setup-mise` | mise via the official `mise.run` installer, then global tools (claude, codex, node) from `dot_config/mise/config.toml` |
| `10_setup-session` | greetd + Noctalia Greeter, gnome-keyring PAM, system services, docker group |
| `10_setup-libvirt` | libvirt/kvm groups, `libvirtd`, default NAT network |
| `10_setup-keyd` | Caps Lock → Super via keyd |
| `10_setup-defaultapps` | MIME defaults (Helium, Nautilus, Loupe, Papers, Foliate, mpv) |
| `10_setup-yazi` | yazi plugins and flavors |
| `20_deploy-initial-files` | One-time files apps later own (yazi theme, fcitx5 profile) |

### Testing in a VM

- In virt-manager use **Video: Virtio** with **3D acceleration** and
  **Display: Spice, Listen: None, OpenGL** enabled. Umbriel (wlroots) needs a
  working GPU renderer.
- The package script detects KVM/QEMU and adds `qemu-guest-agent` and
  `spice-vdagent`.
- Inside a VM console, Umbriel may pass shortcuts to the guest; `Super+Shift+Esc`
  toggles shortcut inhibition.

## Key bindings (Umbriel)

| Keys | Action |
| --- | --- |
| `Super` | Vicinae launcher |
| `Super+Ctrl+L` | Noctalia launcher |
| `Super+Return` | Ghostty |
| `Super+B` / `Super+Shift+B` | Helium / Helium incognito |
| `Super+E` | Nautilus |
| `Super+A` | Anki |
| `Super+Shift+N` | Neovim |
| `Super+W` / `Super+Q` | Close window |
| `Print` | Region screenshot |
| `Super+Shift+Print` or `Super+Shift+O` | OCR (Japanese + English) |
| `Super+S` | Control center |
| `Super+/` | Umbriel keybind cheatsheet |
