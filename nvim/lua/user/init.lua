require('user/packer_init') -- Check and install packer(if not installed)
require('user/plugins') -- The real plugins stuff

-- Fasss ====>>>> SHROOMMMM
require("user/plug_config/impatient") 

-- Plugins specific settings
require("user/plug_config/notify") -- Setup notifications

require('user/plug_config/lualine')
require('user/plug_config/kana')
require('user/plug_config/cmp')
require('user/plug_config/terminal')
require('user/plug_config/telescope')
require('user/plug_config/treesitter')
require('user/plug_config/autopair')
require('user/plug_config/comment')
require('user/plug_config/gitsigns')
require('user/plug_config/nvimtree')
require('user/plug_config/bufferline')
require('user/plug_config/indent_blankline')
require('user/plug_config/whichkey')
-- require('user/feline')
-- require('user/statusline')

-- LSP
require('user/lsp')
require('user/plug_config/rust_tools')
