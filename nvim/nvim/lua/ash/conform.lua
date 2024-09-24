require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" }, -- Example for Lua
		python = { "black" }, -- Example for Python
		c = { "clang-format" },
		java = { "google-java-format" },
		cs = { "clang-format" },
		rust = { "rustfmt" },
		-- Add other file types and their formatters here
	},
})

local function format_on_save()
	vim.api.nvim_exec(
		[[
    augroup FormatOnSave
      autocmd!
      autocmd BufWritePre * lua require('conform').format()
    augroup END
  ]],
		false
	)
end
format_on_save()
