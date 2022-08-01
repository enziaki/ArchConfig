local configs = require("nvim-treesitter.configs")

configs.setup {
  -- ensure_installed = "maintained",
  sync_install = false, 
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = { enable = true },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml", "rust", "cpp" } },
  
  -- Comments
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  -- My little rainbow, Coloring brackets is fun
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
		colors = {
		-- Kanagawa colors
		"#957FB8",
		"#6A9589",
		"#658594",
		"#727169",
		"#938AA9",
		"#9CABCA",
		"#7FB4CA"
	}

    -- termcolors = {} -- table of colour name strings
  },

  -- Playing with colorful dreath
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }

}
