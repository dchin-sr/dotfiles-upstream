-- Core settings

vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.list = true
vim.opt.listchars = 'eol:❮,tab:❯\\'
vim.opt.mouse = ''
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.statusline = '%t,%c'
vim.opt.syntax = 'on'
vim.opt.tabstop = 4
vim.opt.termguicolors = true

-- Set leader key to space
vim.g.mapleader = ' '

-- Turn off auto comments
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  desc = 'Disable New Line Comment',
  }
)

-- Disable expandtab on Makefile
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  callback = function()
    vim.opt.expandtab = false
  end
  }
)

-- Disable expandtab on golang
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = 'go',
  callback = function()
    vim.opt.expandtab = false
  end
  }
)

-- autocmd BufWritePre * :%s/\s\+$//e
vim.api.nvim_create_autocmd({'BufWritePre'}, {
   pattern = '*',
   command = ':%s/\\s\\+$//e'
  }
)

-- Stop smart indent for yaml because it ain't that smart.
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {'yaml', 'yaml.ansible'},
  callback = function()
    vim.opt.indentexpr = ''
  end
  }
)

-- Stop smart indent for Python because it ain't that smart.
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {'python'},
  callback = function()
    vim.opt.indentexpr = ''
  end
  }
)

-- Stop smart indent for Golang because it ain't that smart.
vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {'go'},
  callback = function()
    vim.opt.indentexpr = ''
  end
  }
)

-- Remap Copilot commands
vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(copilot-next)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Plug>(copilot-previous)', { noremap = true, silent = true })

-- Shortcuts for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true, silent = true })
