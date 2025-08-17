return {
	"sontungexpt/better-diagnostic-virtual-text",
	main = "better-diagnostic-virtual-text",
	lazy = true,
	init = function()
		local aug = vim.api.nvim_create_augroup("BDVT_per_buf", { clear = true })
		vim.api.nvim_create_autocmd("LspAttach", {
			group = aug,
			callback = function(ev)
				require("better-diagnostic-virtual-text.api").setup_buf(ev.buf, {})
			end,
		})
	end,
}
