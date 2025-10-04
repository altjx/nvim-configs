# Neovim Configuration

A comprehensive Neovim configuration based on [NvChad v2.5](https://github.com/NvChad/NvChad), optimized for Ruby and web development with enhanced git integration.

## Overview

This configuration uses NvChad as a plugin foundation and extends it with additional plugins and custom configurations for a modern development workflow.

## Prerequisites

- Neovim >= 0.10.0
- Git
- [fd](https://github.com/sharkdp/fd) (for faster file finding)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for grep functionality)
- A [Nerd Font](https://www.nerdfonts.com/) as your terminal font
- Optional: `ruby-lsp`, `rubocop` (for Ruby development)

## Installation

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/your-username/nvim-configs ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

3. Launch Neovim:
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## Features

### Plugin Highlights

- **[NvChad](https://github.com/NvChad/NvChad)** - Fast and minimal base configuration
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer with git integration
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder with performance optimizations
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Advanced syntax highlighting and text objects
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git decorations with inline blame
- **[diffview.nvim](https://github.com/sindrets/diffview.nvim)** - Comprehensive git diff viewer
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration

### Configured Language Support

**LSP Servers:**
- Ruby (ruby-lsp)
- HTML
- CSS

**Formatters:**
- Lua (stylua)
- Ruby (rubocop via bundle exec)

**Treesitter Parsers:**
- vim, lua, vimdoc, html, css, ruby, javascript, typescript, json, yaml, markdown

### UI Customizations

- **Theme:** GitHub Dark
- **Statusline:** Shows relative file paths from current working directory
- **Neo-tree:** Auto-opens on startup with git status integration

## Key Mappings

**Leader key:** `<Space>`

### General

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `;` | `:` | Enter command mode |
| i | `jk` | `<ESC>` | Exit insert mode |

### File Explorer (Neo-tree)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<C-n>` | Toggle Neo-tree | Toggle file explorer |
| n | `<leader>e` | Focus Neo-tree | Focus file explorer |
| n | `<leader>be` | Neo-tree buffers | Show buffer list |
| n | `<leader>ge` | Neo-tree git status | Show git status |

### Git Operations (Gitsigns)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>gd` | Toggle inline diffs | Toggle word diff and deleted lines |
| n | `<leader>gD` | Git diff split | Show file diff in split |
| n | `<leader>gp` | Preview hunk | Show hunk in floating window |
| n | `<leader>gr` | Reset hunk | Reset current hunk |
| n | `<leader>gR` | Reset buffer | Reset all changes in buffer |
| n | `<leader>gs` | Stage hunk | Stage current hunk |
| n | `<leader>gS` | Stage buffer | Stage all changes in buffer |
| n | `<leader>gu` | Undo stage hunk | Undo last staged hunk |
| n | `[c` | Previous hunk | Jump to previous git hunk |
| n | `]c` | Next hunk | Jump to next git hunk |

### Git Operations (Diffview)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>gdo` | Open Diffview | Open diff view |
| n | `<leader>gdc` | Close Diffview | Close diff view |
| n | `<leader>gdh` | File history | Show current file history |
| n | `<leader>gdH` | Branch history | Show full branch history |

### Git Operations (Telescope)

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>gc` | Git commits | Browse git commits |
| n | `<leader>gb` | Git branches | Browse git branches |
| n | `<leader>gt` | Git status | Browse changed files |

### Formatting

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n | `<leader>fm` | Format file | Format current file with conform.nvim |

### Terminal

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| n, t | `<leader>tf` | Toggle terminal | Toggle floating terminal |

### Treesitter Text Objects

**Selection:**
- `af`/`if` - outer/inner function
- `ac`/`ic` - outer/inner class
- `aa`/`ia` - outer/inner parameter
- `ab`/`ib` - outer/inner block
- `ai`/`ii` - outer/inner conditional
- `al`/`il` - outer/inner loop

**Navigation:**
- `]f`/`[f` - next/previous function start
- `]F`/`[F` - next/previous function end
- `]c`/`[c` - next/previous class start
- `]C`/`[C` - next/previous class end
- `]a`/`[a` - next/previous parameter

## Configuration Structure

```
.
├── init.lua                 # Entry point
├── lua/
│   ├── options.lua         # Vim options
│   ├── mappings.lua        # Key mappings
│   ├── autocmds.lua        # Autocommands
│   ├── chadrc.lua          # NvChad UI configuration
│   ├── plugins/
│   │   └── init.lua        # Plugin specifications
│   └── configs/
│       ├── lazy.lua        # Lazy.nvim configuration
│       ├── lspconfig.lua   # LSP server configurations
│       └── conform.lua     # Formatter configurations
├── .stylua.toml            # Stylua formatter config
└── lazy-lock.json          # Plugin version lockfile
```

## Customization

This configuration is designed to be forked and customized:

1. **Add plugins:** Edit `lua/plugins/init.lua`
2. **Modify keymaps:** Edit `lua/mappings.lua`
3. **Adjust LSP servers:** Edit `lua/configs/lspconfig.lua`
4. **Configure formatters:** Edit `lua/configs/conform.lua`
5. **Change theme/UI:** Edit `lua/chadrc.lua`

## Performance Optimizations

- Telescope configured with `fd` for faster file finding
- Ignored patterns for common build directories (`node_modules`, `dist`, `build`, etc.)
- Lazy-loading plugins where appropriate
- Neo-tree uses libuv file watcher for efficient file system monitoring

## Credits

- [NvChad](https://github.com/NvChad/NvChad) - Base configuration
- [LazyVim starter](https://github.com/LazyVim/starter) - Inspiration for starter structure
