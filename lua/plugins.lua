local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use '~/projects/personal/packer.nvim'

  -- C++
  use 'p00f/clangd_extensions.nvim'

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
    },
    run = ':TSUpdate',
  }

  -- Documentation
  use {
    'danymat/neogen',
    requires = 'nvim-treesitter',
    config = [[require('config.neogen')]],
    keys = { '<localleader>d', '<localleader>df', '<localleader>dc' },
  }

  -- use {
  --   'AckslD/nvim-neoclip.lua',
  --   event = 'TextYankPost',
  --   config = function()
  --     local count = 0
  --     _G.test_handler = function()
  --       count = count + 1
  --       print('called', count, 'times')
  --     end
  --     vim.cmd [[autocmd TextYankPost * lua _G.test_handler()]]
  --   end,
  -- }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
