-- File tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })

-- Diagnostic keybindings
vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- LSP code actions (quick fixes like auto-import)
vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action, { desc = 'Code actions (quick fixes)' })

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space><Space>', builtin.lsp_dynamic_workspace_symbols, { desc = 'Find symbols (classes, functions, etc.)' })
vim.keymap.set('n', '<Space>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<Space>fg', builtin.live_grep, { desc = 'Live grep (search in files)' })
vim.keymap.set('n', '<Space>fb', builtin.buffers, { desc = 'Find buffers' })

-- Terminal
vim.keymap.set('n', '<Space>t', ':botright 10split | terminal<CR>', { desc = 'Open bottom terminal' })

-- Git keybindings
vim.keymap.set('n', '<Space>gg', ':LazyGit<CR>', { desc = 'Open LazyGit' })
vim.keymap.set('n', '<Space>gh', ':DiffviewFileHistory %<CR>', { desc = 'File history (current file)' })
vim.keymap.set('n', '<Space>gH', ':DiffviewFileHistory<CR>', { desc = 'Project history (all commits)' })
vim.keymap.set('n', '<Space>gd', ':DiffviewOpen<CR>', { desc = 'Show diff' })
vim.keymap.set('n', '<Space>gc', ':DiffviewClose<CR>', { desc = 'Close diffview' })
