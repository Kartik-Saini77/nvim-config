# My Neovim Configuration

A simple, modern Neovim Configuration.

## Features

-  **Plugin Management** with lazy.nvim
-  **Powerful fuzzy finding** with Telescope
-  **File management** with Oil
-  **LSP support** for Go, Python, C/C++
-  **Autocompletion** with nvim-cmp
-  **Syntax highlighting** with Treesitter
-  **Smart commenting** with Comment.nvim
-  **Tokyo Night theme** with transparency
-  **Smooth cursor animation** with smear-cursor
-  **Go-specific tooling** with go.nvim

## Requirements

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/font-downloads) (recommended: CaskaydiaMono Nerd Font)
- Go (for Go development features)
- Node.js (for some LSP servers)

## Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/Kartik-Saini77/nvim-config.git ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install language servers** (first time setup):
   ```vim
   :Mason
   ```

5. **Install Go tools** (for Go development):
   ```vim
   :GoInstallBinaries
   ```

##  Key Mappings

### General
| Key | Action |
|-----|---------|
| `<Space>` | Leader key |
| `gcc` | Toggle line comment |
| `gc` + motion | Comment with motion |
| `gbc` | Toggle block comment |
| `u` | Undo |
| `<C-r>` | Redo |

### File Navigation
| Key | Action |
|-----|---------|
| `-` | Open Oil file manager |
| `_` | Open current working directory |
| `` ` `` | Change directory to current Oil directory |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>t` | Open terminal |

### LSP Features
| Key | Action |
|-----|---------|
| `gd` | Go to definition |
| `gr` | Show references |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>r` | Rename symbol |
| `<leader>e` | Show diagnostics |
| `<C-o>` | Go back |

### Go-Specific
| Key | Action |
|-----|---------|
| `<leader>gt` | Run Go tests |
| `<leader>gr` | Run Go file |
| `<leader>gf` | Format Go code |
| `<leader>gi` | Go imports (organize imports) |
| `<leader>ga` | Toggle between test/source |

### Window Navigation
| Key | Action |
|-----|---------|
| `<C-h/j/k/l>` | Move between windows |
| `<A-j/k>` | Move lines up/down |

### Other Common Commands

| Command | Purpose |
|---------|---------|
| `:Mason` | Manage language servers |
| `:Lazy` | Manage plugins |
| `:Oil` | Open file manager |
| `:Telescope` | Access all telescope features |
