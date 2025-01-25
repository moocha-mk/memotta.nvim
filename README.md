# MEMOTTA.NVIM
> quick scratchpad manager


## INSTALL
* use your favorite package manager to install `slugbyte/whip.nvim` and dependencies
   * [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) 
   * [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

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
        local whip = require("whip")
        whip.setup({
            -- its probs a good idea to have a dir dedicated to your scratchpads
            dir =  vim.fn.expand("~/memotta/"),
        })
        vim.keymap.set("", "<leader>mo", whip.open, { desc = "[W]hip [O]pen" })
        vim.keymap.set("", "<leader>mm", whip.make, { desc = "[W]hip [M]ake" })
        vim.keymap.set("", "<leader>md", whip.drop, { desc = "[W]hip [D]rop" })
        vim.keymap.set("", "<leader>mf", whip.find_file, { desc = "[W]hip [F]ile Search" })
        vim.keymap.set("", "<leader>mg", whip.find_grep, { desc = "[W]hip [G]rep Search" })
    end,
}
```

## USAGE
whip.nvim allows you to quickly edit and manage files in the whip `dir` configured with `setup()`. 
A huge benefit of whip is that it always remeber's the last whip file you
selected/created and will auto open to that file.

I use different scratchpads for different projects, and while I'm working on a
particular project I tend to reference it's scratchpad over and over. I made this thing because I find 
it super nice to be able to quickly pop open the last scratchpad I used.

## LUA API
* `whip.open()` open last selected whip file, if no file is selected
it will trigger `whip.find_file()`
* `whip.make()` prompt to create a new whip file
* `whip.drop()` delete a whip file from a telescope find and a confirm prompt
* `whip.find_file()` telescope whip files
* `whip.find_grep()` telescope grep whip files

## COMMANDS
* `:WhipOpen` calls `whip.open()`
* `:WhipMake` calls `whip.make()`
* `:WhipDrop` calls `whip.drop()`
* `:WhipFindFile` calls `whip.find_file()`
* `:WhipFindGrep` calls `whip.find_grep()`


## CHECKHEALTH
Run `:checkhealth whip` to check for trouble with your configuration

## NOTE
whip.nvim creates a `.whip.json` in your whip `dir` to keep track of
your last selected file.

