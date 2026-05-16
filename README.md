# Dhio WSL Dotfiles

Portable setup for Ubuntu on WSL with zsh, Powerlevel10k, Zellij, LazyVim,
Codex, Chrome DevTools MCP, Figma MCP, Serena, Caveman, RTK, Zed helpers,
Obsidian helpers, and Antigravity launchers.

The rule for this repo: LazyVim and Zellij stay standard; custom polish is
small, visible, and easy to delete.

## Restore On A New Device

1. Install Windows apps:

```powershell
winget install Microsoft.WindowsTerminal
winget install Google.Chrome
winget install Google.Antigravity
winget install Docker.DockerDesktop
winget install Git.Git
winget install OpenJS.NodeJS
```

2. Install Ubuntu from Microsoft Store, then in WSL:

```bash
sudo apt update
sudo apt install -y git curl zsh keychain fd-find ripgrep bat eza fzf zoxide direnv build-essential unzip
git clone git@github.com:dhiodhaha/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

3. Re-authenticate private tools:

```bash
gh auth login
codex login
codex mcp login figma
```

4. Open a new Windows Terminal tab, then verify:

```bash
zsh --version
nvim --version
zellij --version
codex --version
docker --version
```

## Daily Commands

```bash
zn              # zellij + nvim workspace
zdev            # zellij dev layout
agw .           # Windows Antigravity into current WSL project
agy .           # alias path to Antigravity
agl .           # fallback Linux Antigravity build only
chrome-debug    # start Windows Chrome with DevTools remote debugging
rtk git status  # compact token-saving command output
```

## Terminal Workflow

Use a normal terminal tab for quick commands and auth flows. Use Zellij when
you are coding.

```bash
cd ~/my-project
zn
```

Inside Zellij, use separate panes for editor, agent and server:

```text
pane 1: nvim
pane 2: codex
pane 3: npm run dev
pane 4: git / docker / tests
```

Useful Zellij keys:

```text
Ctrl-p n    new pane
Ctrl-p x    close pane
Ctrl-t n    new tab
Ctrl-o d    detach
```

## Codex MCP Servers

Configured in `.codex/config.toml`:

- `figma`: official remote Figma MCP, requires `codex mcp login figma`.
- `serena`: semantic code intelligence via `uvx`.
- `caveman-mcp`: prompt/context compression tools via `uvx`.
- `chrome-devtools`: runs Windows `npx.cmd` and connects to Chrome debug port `9222`.

Before using Chrome DevTools MCP, run:

```bash
chrome-debug
```

Restart Codex after changing MCP config or installing new skills.

## LazyVim

This config intentionally stays close to LazyVim defaults:

- keep LazyVim's default formatting, diagnostics, LSP and toggle keymaps;
- add project workflow commands only where they do not overwrite LazyVim namespaces;
- use LazyVim extras for language support instead of hand-rolled plugin setup;
- keep personal UI choices isolated in plugin files that can be removed safely.

Kept Craftzdog-inspired polish:

- Catppuccin Mocha with Linear-style color overrides;
- Snacks picker shortcuts;
- simple incline buffer label;
- Zellij plus Neovim workflow;
- Obsidian note workflow;
- optional cursor animation toggle.

Useful LazyVim defaults:

```vim
<leader>ff   find files
<leader>/    search text
<leader>e    file explorer
<leader>cf   format now
<leader>uf   toggle autoformat globally
<leader>uF   toggle autoformat for current buffer
<leader>uw   toggle wrap
<leader>qq   quit all
```

Custom keys:

```vim
;f           find files
;r           search text
\            buffers
;;           resume picker
<leader>ac   Codex terminal
<leader>aC   Codex resume
<leader>aa   Claude terminal
<leader>az   floating shell
<leader>on   new Obsidian note
<leader>oo   open Obsidian note
<leader>os   search Obsidian notes
<leader>uS   toggle cursor animation
```

Markdown uses LazyVim's standard formatting flow:

```text
prettier -> markdownlint-cli2 -> markdown-toc
```

## What Is Intentionally Not Saved

These are machine-private and ignored:

- Codex auth, history, logs, SQLite state.
- GitHub CLI tokens in `.config/gh/hosts.yml`.
- Antigravity browser/app state and cookies.
- Shell history, `.env`, `.ssh`, `.aws`, browser caches.

## Notes

- Docker CLI runs in WSL; Docker Desktop runs in Windows with WSL integration.
- Node is managed by `nvm`; current setup uses Node 26.
- The Obsidian vault lives outside WSL at:
  `/mnt/c/Users/dopamine/Documents/catatandhafin`.
