-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Plugin stuff
return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fass a fuqboi
	use 'lewis6991/impatient.nvim'

	-- Colors
	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin"
	-- })
	use "rebelot/kanagawa.nvim"

    -- icons
    use { 'kyazdani42/nvim-web-devicons', opt = true }

	-- Bar
	-- use {'glepnir/galaxyline.nvim', branch='main', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

	-- Auto completion
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- TODO
	use "hrsh7th/cmp-nvim-lua" -- TODO
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- Buffers and buffer line
    use "akinsho/bufferline.nvim" -- ugly gui type buffer line for displaying windows(buffers)
    use "moll/vim-bbye" -- Don't close window when buffer is closed


	-- snippet completions
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Terimnal
	use {"akinsho/toggleterm.nvim", as = "toggleterm", tag = 'v1.*', config = function()
		require("toggleterm").setup()
	end}

	-- Smexy notifications
	use {'rcarriga/nvim-notify', as="notify"}
	use {'nvim-lualine/lualine.nvim'}


    -- LSP Stuff
	use "williamboman/nvim-lsp-installer" -- Insatlls lsps
	use "neovim/nvim-lspconfig" -- The main stuff
	use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

	-- Rust
	use "mfussenegger/nvim-dap" -- TODO
	use "nvim-lua/plenary.nvim" -- TODO

	-- Specifically for rust (support single fils)
	use { "simrat39/rust-tools.nvim", 
		ft = {'rust'},
	}

	-- Fuzzy finder
	use 'nvim-lua/popup.nvim' -- TODO
	use "nvim-telescope/telescope.nvim" -- The BEST fuzzy searcher
	use 'nvim-telescope/telescope-media-files.nvim' -- can see media files? (not working)

	-- Tree shitters
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	} -- THE REAL SHIT
	use "p00f/nvim-ts-rainbow" -- My little poni Te he ;)
	use { 
		"nvim-treesitter/playground",
		opt = true,
		cmd = { "TSPlaygroundToggle", "TSHighlightCaptureUnderCursor" },
	} -- Wanna play with cuite putie ugly syntax shell shock
	-- Lazy loading 'playground' as I don't require it much
	
	-- The Tree (like nerdTree)
	use 'kyazdani42/nvim-tree.lua'

    -- Commenting
	use 'numToStr/Comment.nvim'
    use 'JoosepAlviste/nvim-ts-context-commentstring'


	-- GIT
	use "lewis6991/gitsigns.nvim"
	
    -- Indent guides
    use 'lukas-reineke/indent-blankline.nvim'

	-- Shows which key that can be used next
	use { "folke/which-key.nvim" }
	
	-- lsp highlight color fix
	use 'folke/lsp-colors.nvim'
end)
