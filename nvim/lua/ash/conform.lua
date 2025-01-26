require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" }, -- Example for Lua
		python = { "black", "autopep8", "pylint" }, -- Example for Python
		-- c = { "clang-format" },
		-- java = { "google-java-format" },
		cs = { "clang-format" },
		rust = { "rustfmt" },
		c = {
			"clang-format",
			args = {
				"--style={IndentWidth: 4, ContinuationIndentWidth: 4}", -- Customize indentation
			},
		},
		java = {
			"google-java-format",
			args = { "--aosp" }, -- Use Android Open Source style (4 spaces instead of 2)
		},
		-- Add other file types and their formatters here
	},
})

-- local function format_on_save()
-- 	vim.api.nvim_exec(
-- 		[[
--     augroup FormatOnSave
--       autocmd!
--       autocmd BufWritePre * lua require('conform').format()
--     augroup END
--   ]],
-- 		false
-- 	)
-- end
-- format_on_save()

-- Variable to track the toggle state
local format_on_save_enabled = true

-- Function to enable/disable format-on-save
local function toggle_format_on_save()
	if format_on_save_enabled then
		-- Disable format-on-save by clearing the autocommand group
		vim.api.nvim_clear_autocmds({ group = "FormatOnSave" })
	else
		-- Enable format-on-save by creating the autocommand group
		vim.api.nvim_create_augroup("FormatOnSave", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "FormatOnSave",
			pattern = "*",
			callback = function()
				require("conform").format({ async = false }) -- Sync format
			end,
		})
	end
	format_on_save_enabled = not format_on_save_enabled
	print("Format on Save: " .. (format_on_save_enabled and "Enabled" or "Disabled"))
end

-- Initial setup: Enable format-on-save
vim.api.nvim_create_augroup("FormatOnSave", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "FormatOnSave",
	pattern = "*",
	callback = function()
		require("conform").format({ async = false }) -- Sync format
	end,
})

-- Keybinding to toggle format-on-save
vim.keymap.set("n", "<leader>co", toggle_format_on_save, { desc = "Toggle Format on Save" })
