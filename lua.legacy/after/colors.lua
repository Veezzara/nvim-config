function SetScheme(scheme)
	scheme = scheme or "vscode"
	vim.cmd.colorscheme(scheme)
end

SetScheme()
