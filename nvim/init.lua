vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set smartindent")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

-- Disables default file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cursor settings
vim.opt.guicursor = {
  "i-ci:block-blinkon1", -- enable blinking, rate is controlled by the term
}

vim.keymap.set(
  "n",
  "<C-e>",
  function() vim.cmd("NvimTreeToggle") end,
  {
    silent = true
  }
)

local function on_file_explorer_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "<C-e>", api.tree.toggle, opts("Toggle"))
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "folke/tokyonight.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "kepano/flexoki-neovim" },
  { "maxmx03/solarized.nvim" },
  { "EdenEast/nightfox.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        on_attach = on_file_explorer_attach
      })
    end,
  },
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "go", "javascript", "typescript", "zig" },
  highlight = { enable = true },
  indent = { enable = true }
})

require("kanagawa").setup({
  colors = {
    theme = {
        all = {
            ui = {
                bg_gutter = "none"
            }
        }
    }
  }
})

require("solarized").setup({
  highlights = function (colors, colorhelper)
    return {
      LineNr = { bg = "none" },
    }
  end,
  theme = "default",
  transparent = true
})

require("gruvbox").setup({
  transparent_mode = true
})

vim.cmd("colorscheme gruvbox")
