-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Editor settings
vim.opt.number = true           -- Show line numbers
vim.opt.relativenumber = true   -- Show relative line numbers
vim.opt.tabstop = 2             -- Tab width
vim.opt.shiftwidth = 2          -- Indent width
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.smartindent = true      -- Auto indent
vim.opt.list = true             -- Show whitespace characters
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }  -- Define which chars to show
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'

-- Filetype detection
vim.filetype.add({
  extension = {
    MD = 'markdown',
  },
})

-- Setup plugins
require("lazy").setup({
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Define signs before setup
      vim.fn.sign_define("NvimTreeDiagnosticErrorIcon", { text = "E", texthl = "DiagnosticError" })
      vim.fn.sign_define("NvimTreeDiagnosticWarnIcon", { text = "W", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("NvimTreeDiagnosticInfoIcon", { text = "I", texthl = "DiagnosticInfo" })
      vim.fn.sign_define("NvimTreeDiagnosticHintIcon", { text = "H", texthl = "DiagnosticHint" })

      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })

      -- Integrate autopairs with cmp
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},  -- PlantUML support
        maid = {},  -- Mermaid support
      }
    end,
  },
})

-- Load configurations
require('go-config')
require('keybindings')
