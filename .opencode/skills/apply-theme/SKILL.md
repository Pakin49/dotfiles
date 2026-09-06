---
name: apply-theme
description: Apply a color theme across every theme file in the nixos-dotfiles repo. Use when the user says to apply/switch/change a theme, e.g. "apply gruvbox", "switch to kanagawa dragon", "change theme everywhere". Lists all files that carry theme colors and how to update each.
---

# Apply Theme

Applies a new color palette to **every theme-bearing file** in `nixos-dotfiles`
(excluding `archives/`). The repo currently runs the **kanagawa dragon** palette
(outside `archives/`).

**Always ask for confirmation before editing** (repo rule, see `AGENTS.md`).
Ask the target theme and, if it's a named theme, whether the terminal/status
bar should keep the current palette or be remapped.

## Master theme file list

| # | File | What carries the theme |
|---|------|------------------------|
| 1 | `config/.config/eza/theme.yml` | **Symlink** — repoint to `eza-themes/themes/<name>.yml` (kanagawa-dragon.yml, gruvbox-dark.yml, catppuccin-mocha.yml, ...) |
| 2 | `config/.config/nvim/lua/plugins/themes.lua` | nvim colorscheme plugin + `require("kanagawa").setup({ theme = "dragon" })` + `vim.cmd("colorscheme ...")`. Swap plugin repo + `theme =` for other schemes. |
| 3 | `config/.config/foot/foot.ini` | `[colors-dark]` ANSI block: `cursor`/`foreground`/`background`/`selection-*/` `regular0-7`/`bright0-7`. 6-digit hex, no `#`, `alpha=0.9`. |
| 4 | `files/Templates/nvim-palette` | foot theme template: `[colors-dark]` (sync with foot.ini) + `[colors-light]`. |
| 5 | `config/.config/dwl/config.h` | `rootcolor` + `colors[][3]` at lines ~42-53: `SchemeNorm/Sel/Urg/Bar`, each `{ fg, bg, border }`. Format `0xRRGGBBff`. |
| 6 | `config/.config/dwl/blocks.h` | someblocks status bar: `^fg(hex)` markers inside block commands (brightness, keymap, volume, wifi, battery, date, time). |
| 7 | `config/.config/dwl/autostart` | `waylock` colors: `-init-color 0xRRGGBB -input-color 0xRRGGBB -fail-color 0xRRGGBB`. |
| 8 | `home.nix` | **Real mako config** (`services.mako.settings`): `background-color`, `text-color`, `border-color`. This is what's deployed. |
| 9 | `config/.config/mako/config` | mako colors via symlink — **inert leftover** (mako is nix-managed in `home.nix`). Update only to keep the file consistent. |
| 10 | `config/.config/ncspot/config.toml` | `[theme]` keys: `background, primary, secondary, title, playing, playing_selected, playing_bg, highlight, highlight_bg, error, error_bg, statusbar, statusbar_progress, statusbar_bg, cmdline, cmdline_bg`. |
| 11 | `config/.zprofile` | `BEMENU_OPTS` bemenu colors: `--tf --tb --nf --nb --ff --fb --hf --hb --af --ab`. Backgrounds use 8-digit hex `#RRGGBBe6`. |
| 12 | `config/.zshrc` | `FZF_DEFAULT_OPTS` `--color=` values (spinner/hl/fg/bg/header/info/pointer/marker/fg+/prompt/hl+/bg+/border). |
| 13 | `config/.zshenv` | `BAT_THEME=<bat-builtin-name>` (bat has no kanagawa; keeps `gruvbox-dark` as closest). |
| 14 | `home-manager/theme.nix` | GTK theme (`gtk.theme`, `GTK_THEME`, `dconf` gtk-theme) + icon theme. Only for GTK themes packaged in nixpkgs. |
| 15 | `config/.config/starship.toml` | No colors currently (symbol overrides only); theme only if user adds a starship palette/preset. |

Tooling for the list: `grep` the old palette when remapping, and verify with
`grep -rn '<oldhex>' --exclude-dir={archives,node_modules,submodules,eza-themes,.git,.github} .`.

## Current kanagawa dragon roles → hex

Plug these in whenever a new palette needs mapped positions per app (they track
the nvim-dark roles the repo originally used).

| Role | nvim-dark (old) | kanagawa dragon (current) |
|------|-----------------|---------------------------|
| bg | `14161b` | `181616` (dragonBlack3) |
| bg darkest | `07080d` | `0d0c0c` (dragonBlack0) |
| bg selected | `2c2e33` | `282727` (dragonBlack4) |
| border / selection bg | `2c2e33` / `4f5258` | `393836` (dragonBlack5) |
| fg | `e0e2ea` | `c5c9c5` (dragonWhite) |
| fg dim | `c4c6cd` | `a6a69c` (dragonGray) |
| red | `ffc0b9` | `c4746e` (dragonRed) |
| green | `b3f6c0` | `8a9a7b` (dragonGreen2) / `87a987` |
| yellow | `fce094` | `c4b28a` (dragonYellow) / `dca561` |
| blue | `a6dbff` | `8ba4b0` (dragonBlue2) |
| magenta/violet | `ffcaff` | `8992a7` (dragonViolet) / `a292a3` (dragonPink) |
| cyan/aqua | `8cf8f7` | `8ea4a2` (dragonAqua) |

Special cases in the current state: waylock uses `input`=`2b3328` (winterGreen),
`fail`=`43242b` (winterRed); foot `regular3`=`dca561` (autumnYellow);

## Apply flow

1. Confirm target theme + scope with the user.
2. Run every file in the master list through the mapping; edit each hex/value.
   - `eza/theme.yml`: `ln -sfn eza-themes/themes/<name>.yml config/.config/eza/theme.yml`
   - Keep `foot.ini` and `nvim-palette` dark section identical.
   - Keep `config/.config/mako/config` matching `home.nix` mako colors.
3. Verify: grep for leftover old palette hexes (list above).
4. Tell the user what needs redeploy/restart (below).

## Deploy/restart notes

- `home.nix`, `home-manager/theme.nix`, dwl (`config.h`/`blocks.h` are
  compiled), mako → `sudo nixos-rebuild switch --flake ~/'nixos-dotfiles?submodules=1#'nixos-T480` (`rebuild` alias).
- `foot`, `ncspot`, `eza`, `nvim` → reload the app (`nvim` re-sources plugins
  on restart; kanagawa diff colors need `:colorscheme` re-run).
- `.zshrc` / `.zprofile` / `.zshenv` → new shell or login.
- `dwl/autostart` (waylock) → applies on next lock.