# Neovim config

A small Neovim setup built on the native plugin manager (`vim.pack`). It targets TypeScript/Node, Go, Svelte/Solid, C# and SQL (SQLite first).

Theme: **Everforest** (medium). It switches between light and dark with the macOS appearance, checked at startup and whenever Neovim regains focus, so it also works inside tmux. The statusline is custom and uses no plugin.

## Requirements

| Tool | Why |
| --- | --- |
| Neovim **≥ 0.12** | `vim.pack`, `vim.lsp.config` |
| git, curl | plugins, blink prebuilt binary |
| [ripgrep](https://github.com/BurntSushi/ripgrep), [fd](https://github.com/sharkdp/fd) | pickers |
| [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter) + a C compiler | parsers (nvim-treesitter `main`) |
| A [Nerd Font](https://www.nerdfonts.com/) | icons |
| node (and optionally bun) | JS/TS language servers, prettier |
| go | gopls, goimports |
| .NET SDK | C# (roslyn) |
| sqlite3 | SQL with dadbod |
| [lazygit](https://github.com/jesseduffield/lazygit) | `<leader>gg` |

On macOS: `brew install neovim ripgrep fd tree-sitter lazygit sqlite go node`

Language servers and formatters are installed by **Mason** on first start (see `lua/lsp/mason.lua`). Restart Neovim once they finish installing.

## Install

```bash
mv ~/.config/nvim{,.bak}                 # optional backup
git clone https://github.com/harelog3/nvim.git ~/.config/nvim
nvim                                      # installs plugins, parsers and tools
```

Plugin versions are pinned in `nvim-pack-lock.json`. To update: `:lua vim.pack.update()`.

## Layout

```
init.lua
lua/core/       options, keymaps, autocmds, statusline
lua/plugins/    init.lua (vim.pack.add) + one file per area
lua/lsp/        init.lua (diagnostics, keymaps), servers.lua (overrides), mason.lua
lua/vscode_init.lua   used when running inside VS Code (vscode-neovim)
snippets/       extra VS Code-style snippets
```

## Keymaps

Leader is `<Space>`. Press `<leader>` and wait to see hints (mini.clue).

**Editing / windows**

| Key | Action |
| --- | --- |
| `<leader>w` | write |
| `<leader>y` / `p` / `d` | system clipboard yank / paste / delete |
| `<leader>\|` / `<leader>-` | vertical / horizontal split |
| `<leader>h/j/k/l` | move between windows |
| `<S-Arrows>` | resize |
| `<leader>qw` / `<leader>qb` | close window / buffer |
| `gsa` `gsd` `gsr` | add / delete / replace surrounding |
| `J` / `K` (visual) | move lines |

**Find (pickers)**

| Key | Action |
| --- | --- |
| `<leader>tf` | smart find (recent + files) |
| `<leader>th` | files |
| `<leader>ts` / `<leader>tw` | grep / grep word |
| `<leader>tr` / `<leader>tb` | recent / buffers |
| `<leader>td` / `<leader>tD` | diagnostics (workspace / buffer) |
| `<leader>tl` / `<leader>tL` | symbols (document / workspace) |
| `<leader>tg` | git status |
| `<leader>tt` | TODO / FIXME |
| `<leader>tk` / `<leader>tH` | keymaps / help |
| `<leader>tc` | config files |
| `<leader>t.` | resume last picker |

**Files (mini.files)**: there is no sidebar. `-` opens the current file's directory in columns; `<leader>pv` opens the project root. `l`/`<CR>` goes in or opens a file, and `h` goes up. Edit the listing like text: add a line to create a file (end it with `/` for a directory), change a name to rename, `dd` to delete (it goes to the trash), or cut a line and paste it in another directory to move it. Press `=` to apply the changes and `q` to close. `g.` toggles hidden files, and `<C-s>`/`<C-x>` open the file in a vertical/horizontal split.

**LSP**

| Key | Action |
| --- | --- |
| `K` | hover |
| `D` | line diagnostics |
| `gd` / `gr` / `gi` / `gy` | definition / references / implementations / type |
| `<leader>ca` / `<leader>rn` | code action / rename |
| `<leader>cf` | format |
| `<leader>ui` / `<leader>uf` / `<leader>ud` | toggle inlay hints / format on save / diagnostics |

**Git**

| Key | Action |
| --- | --- |
| `]h` / `[h` | next / prev hunk |
| `<leader>gb` / `<leader>gB` | blame line / blame buffer |
| `<leader>gt` | toggle inline blame |
| `<leader>gs` / `<leader>gr` / `<leader>gp` | stage / reset / preview hunk |
| `<leader>gd` | diff against index |
| `<leader>gl` / `<leader>gL` | file history / repo log |
| `<leader>gg` | lazygit |
| `<leader>go` | open in browser |

## SQL (dadbod)

1. Add a `.nvim.lua` at the project root. Neovim asks once whether to trust it (`exrc`):

   ```lua
   vim.g.dbs = {
     { name = "dev", url = "sqlite:" .. vim.fn.getcwd() .. "/dev.db" },
     -- { name = "pg", url = "postgres://user:pass@localhost:5432/app" },
   }
   ```

   Keep `.nvim.lua` out of git if it contains credentials (it is in this repo's `.gitignore`).
2. `<leader>D` toggles the DB UI. Open a connection, then a table (it lists helpers such as *List*, *Columns* and *Indexes*), or create a new query buffer.
3. In a `.sql` buffer, `<leader>S` runs the whole file or the selection. Completion suggests tables and columns from the live connection.
4. On save, SQL is formatted with `sql-formatter` using the SQLite dialect. Add `.sql-formatter.json` to the project to change that.

Without the UI: `:DB sqlite:dev.db select * from users`.

## C#

[roslyn.nvim](https://github.com/seblyng/roslyn.nvim) finds the `.sln`/`.slnx`/`.csproj` and starts Roslyn (installed by Mason). Use `:Roslyn target` to switch solutions. Formatting uses `csharpier`.

## Troubleshooting

- **Completion stops working.** blink.cmp is pinned to the stable `1.*` releases, which use a prebuilt fuzzy binary. Check `:checkhealth blink.cmp`, then look at `~/.local/state/nvim/blink.cmp.log`.
- **A language server does not start.** Check `:checkhealth vim.lsp` and `:Mason`. Servers are enabled only if their binary exists, so restart after Mason installs something new.
- **Parsers fail to compile.** Run `:checkhealth nvim-treesitter` and check that the `tree-sitter` CLI is installed.

## License

[MIT](LICENSE)
