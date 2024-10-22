function SetScheme(scheme)
	scheme = scheme or "rose-pine"
	vim.cmd.colorscheme(scheme)
end

SetScheme()
