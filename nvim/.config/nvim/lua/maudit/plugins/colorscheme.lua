return {
	"AlphaTechnolog/pywal.nvim",
	name = "pywal",
	config = function()
		vim.cmd("colorscheme pywal")
		-- NOTE: function for transparency
		function Transparent(color)
			color = color or "pywal"
			vim.cmd.colorscheme(color)
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end
		Transparent()
	end,
}
