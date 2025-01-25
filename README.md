# MEMOTTA.NVIM

> quick scratchpad manager

## INSTALL

- use your favorite package manager to install `moocha-mk/memotta.nvim` and dependencies
  - [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

## SETUP

```lua
-- example lazy nvim config
return {
	"moocha-mk/memotta.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local memotta = require("memotta")
		memotta.setup({
			-- its probs a good idea to have a dir dedicated to your scratchpads
			dir = vim.fn.expand("~/dir/"),
		})
		vim.keymap.set("", "<leader>mo", memotta.open, { desc = "[M]emotta [O]pen" })
		vim.keymap.set("", "<leader>mm", memotta.make, { desc = "[M]emotta [M]ake" })
		vim.keymap.set("", "<leader>md", memotta.drop, { desc = "[M]emotta [D]rop" })
		vim.keymap.set("", "<leader>mf", memotta.find_file, { desc = "[M]emotta [F]ile Search" })
		vim.keymap.set("", "<leader>mg", memotta.find_grep, { desc = "[M]emotta [G]rep Search" })
	end,
}
```

## USAGE

memotta.nvim allows you to quickly edit and manage files in the memotta `dir` configured with `setup()`.
A huge benefit of memotta is that it always remeber's the last memotta file you
selected/created and will auto open to that file.

I use different scratchpads for different projects, and while I'm working on a
particular project I tend to reference it's scratchpad over and over. I made this thing because I find
it super nice to be able to quickly pop open the last scratchpad I used.

## LUA API

- `memotta.open()` open last selected memotta file, if no file is selected
  it will trigger `memotta.find_file()`
- `memotta.make()` prompt to create a new memotta file
- `memotta.drop()` delete a memotta file from a telescope find and a confirm prompt
- `memotta.find_file()` telescope memotta files
- `memotta.find_grep()` telescope grep memotta files

## COMMANDS

- `:MemottaOpen` calls `memotta.open()`
- `:MemottaMake` calls `memotta.make()`
- `:MemottaDrop` calls `memotta.drop()`
- `:MemottaFindFile` calls `memotta.find_file()`
- `:MemottaFindGrep` calls `memotta.find_grep()`

## CHECKHEALTH

Run `:checkhealth memotta ` to check for trouble with your configuration

## NOTE

memotta.nvim creates a `.memotta.json` in your memotta `dir` to keep track of
your last selected file.

## Other projects

I learned from:

- [whip.nvim](https://github.com/slugbyte/whip.nvim)
