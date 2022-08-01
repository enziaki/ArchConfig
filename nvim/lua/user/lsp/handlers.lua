local M = {}

-- Goto definition in a split window
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

-- TODO: This is bad
function GOTO_DEF_SPLIT()
	vim.lsp.handlers["textDocument/definition"] = goto_definition('split')
	vim.lsp.buf.definition()
	vim.lsp.handlers["textDocument/definition"] = goto_definition()
end


-- TODO: backfill this to template
-- THE MAIN SETUP
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = {
			source = "always",
			prefix = '■'
		},
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},

	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	-- vim.lsp.handlers["textDocument/definition"] = goto_definition('split')
	vim.lsp.handlers["textDocument/definition"] = goto_definition()
end


local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	-- if client.resolved_capabilities.document_highlight then
	-- 	vim.api.nvim_exec(
	-- 	[[
	-- 	augroup lsp_document_highlight
	-- 	autocmd! * <buffer>
	-- 	autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
	-- 	autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
	-- 	augroup END
	-- 	]],
	-- 	false
	-- 	)
	-- end

	if client.server_capabilities.documentHighlightProvider then
		-- if client.resolved_capabilities.document_highlight then
		vim.cmd [[
		hi! LspReferenceRead cterm=italic ctermbg=green guibg=LightYellow
		hi! LspReferenceText cterm=italic ctermbg=blue guibg=LightYellow
		hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
		]]
		vim.api.nvim_create_augroup('lsp_document_highlight', {
			clear = false
		})
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = 'lsp_document_highlight',
		})
		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = 'lsp_document_highlight',
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }

	-- TODO: Split definition

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua GOTO_DEF_SPLIT()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(
	bufnr,
	"n",
	"gl",
	'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
	opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format {async = true }' ]]
end

M.on_attach = function(client, bufnr)
	-- To disable document formatting by the default lsp and use nullsp
	-- if client.name == "tsserver" then
	-- 	client.resolved_capabilities.document_formatting = false
	-- end
	lsp_keymaps(bufnr)
	-- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- highlight line number instead of having icons in sign column
vim.cmd [[
highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

return M

