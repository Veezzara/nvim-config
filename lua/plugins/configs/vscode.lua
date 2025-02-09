return { 
	'Mofiqul/vscode.nvim', 
	name = "vscode", 
	lazy = false, 
	init = function() 
		vim.cmd.colorscheme("vscode")
	end
}
