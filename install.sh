#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

link_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" ]] && [[ "$(realpath "$src")" == "$(realpath "$dst")" ]]; then
    return
  fi
  if [[ -d "$dst" && ! -L "$dst" ]]; then
    echo "Skipping existing directory: $dst"
    return
  fi
  ln -sfn "$src" "$dst"
}

echo "Linking portable config from $DOTFILES_DIR"

link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.markdownlint.json" "$HOME/.markdownlint.json"
link_file "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
link_file "$DOTFILES_DIR/.config/nix" "$HOME/.config/nix"
link_file "$DOTFILES_DIR/.config/zellij" "$HOME/.config/zellij"
link_file "$DOTFILES_DIR/.config/zed" "$HOME/.config/zed"
link_file "$DOTFILES_DIR/.config/fastfetch" "$HOME/.config/fastfetch"
link_file "$DOTFILES_DIR/.config/lazygit" "$HOME/.config/lazygit"
link_file "$DOTFILES_DIR/.config/glow" "$HOME/.config/glow"
link_file "$DOTFILES_DIR/.config/git" "$HOME/.config/git"
link_file "$DOTFILES_DIR/.config/gh/config.yml" "$HOME/.config/gh/config.yml"
link_file "$DOTFILES_DIR/.codex/config.toml" "$HOME/.codex/config.toml"
link_file "$DOTFILES_DIR/.codex/themes" "$HOME/.codex/themes"
mkdir -p "$HOME/.codex/skills"
for skill in "$DOTFILES_DIR"/.codex/skills/*; do
  [[ -d "$skill" ]] || continue
  link_file "$skill" "$HOME/.codex/skills/$(basename "$skill")"
done

mkdir -p "$HOME/.local/bin"
for script in "$DOTFILES_DIR"/.local/bin/*; do
  [[ -f "$script" ]] || continue
  link_file "$script" "$HOME/.local/bin/$(basename "$script")"
  chmod +x "$script"
done

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

if ! command -v rtk >/dev/null 2>&1; then
  curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/master/install.sh | sh
fi

if ! command -v yt-dlp >/dev/null 2>&1; then
  mkdir -p "$HOME/.local/bin"
  if [[ "$(uname -s)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
    brew install yt-dlp ffmpeg
  else
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o "$HOME/.local/bin/yt-dlp"
    chmod +x "$HOME/.local/bin/yt-dlp"
  fi
fi

if ! command -v fastfetch >/dev/null 2>&1; then
  if [[ "$(uname -s)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
    brew install fastfetch
  else
    tmp="$(mktemp -d)"
    curl -L https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.tar.gz -o "$tmp/fastfetch.tar.gz"
    tar -xzf "$tmp/fastfetch.tar.gz" -C "$tmp"
    install -m 0755 "$(find "$tmp" -maxdepth 4 -type f -name fastfetch | head -n1)" "$HOME/.local/bin/fastfetch"
    rm -rf "$tmp"
  fi
fi

echo "Done. Open a new terminal or run: source ~/.zshrc"
