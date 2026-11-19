# Neovim setup

Neovim video setup guide.

- [part 1](https://www.youtube.com/watch?v=cdAMq2KcF4w)
- [part 2](https://www.youtube.com/watch?v=qp1OcolI6x0)
- [part 3](https://www.youtube.com/watch?v=JN4Zbs0ypwM)

## Check install

1. Check version

```
nvim --version
```

2. Check install

```
nvim -c :checkhealth
```

## Setup config

1. Create the config directory

```
mkdir -p ~/.config/nvim
```

2. Change to config directory

```
cd ~/.config/nvim
```

3. Create an init file

```
touch init.lua
```

4. Create directories

```
mkdir -p lua/{config,plugins,servers,utils}
```

5. Change to lua config

```
cd lua/config
```

6. Create config files

```
touch {keymaps,autocmds,options,globals,lazy}.lua
```

7. Create `lua/options.lua` file

8. Add to `~/config/nvim/init.lua` file

```
require("config")
```

9. Create a `~/config/nvim/lua/config/init.lua` file

```
echo 'require("config.options")' > lua/config/init.lua
```

10. Open the file to see the effect of the settings

```
nvim lua/config/options.lua
```

## Setup keymaps

1. Edit file in `~/config/nvim/lua/config` directory

```
nvim keymaps.lua
```

## lSP setup in neovim

[Neovim lsp setup](https://dotfiles.substack.com/p/native-lsp-in-neovim-012)

If you have nvim-lspconfig installed, run :help lspconfig-all

Then type 'gO' to see the outline

### Debug LSP issues

1. Verify the config is enabled

```
:checkhealth vim.lsp
```

2. Inspect currently enabled configs

```
:lsp
```

3. Check filetype

```
:set filetype?
```

4. Check root detection as many servers need a project root.

The server may not start if you open a file outside a workspace.

5. Check that the server executable exists

```
which lua-language-server
```

6. Turn on LSP logs if needed

```
vim.lsp.log.set_level('trace')
```

7. Inspect the log

```
vim.cmd('tabnew ' .. vim.lsp.log.get_filename())
```

## Treesitter setup in neovim

[Treesitter setup](https://www.qu8n.com/posts/nvim-treesitter)

### Install `tree-sitter` cli using nix

1. Check version

```
tree-sitter -V
```

2. Create a configuration

```
tree-sitter init-config
```

3. View the config in `$HOME/.config/tree-sitter/config.json`

## Editor Config

An example `.editorconfig` [file][1000]

[1000]: https://docs.cloudposse.com/best-practices/developer/editor-config/
