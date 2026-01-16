vim.opt.cmdheight = 0
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.spell = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.breakindent = true -- maintain indent when wrapping indented lines
vim.opt.linebreak = true -- wrap at word boundaries
vim.opt.list = true -- enable the below listchars
vim.opt.listchars = { tab = "▸ ", trail = "·", nbsp = "␣" }
vim.opt.fillchars:append({ eob = " " }) -- remove the ~ from end of buffer
vim.opt.mouse = "a" -- enable mouse for all modes
vim.opt.mousemoveevent = true -- Allow hovering in bufferline
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus" -- Use Linux system clipboard
vim.opt.confirm = true -- ask for confirmation instead of erroring
vim.opt.undofile = true -- persistent undo
vim.opt.backup = true -- automatically save a backup file
vim.opt.backupdir:remove(".") -- keep backups out of the current directory
vim.opt.shortmess:append({ I = true }) -- disable the splash screen
vim.opt.wildmode = "longest:full,full" -- complete the longest common match, and allow tabbing the results to fully complete them
vim.opt.completeopt = "menuone,longest,preview"
vim.opt.signcolumn = "yes:2"
vim.opt.showmode = false
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
vim.opt.exrc = true
vim.opt.secure = true
vim.opt.titlestring = "%f // nvim"
vim.opt.inccommand = "split"
vim.opt.shell = vim.env.SHELL
vim.opt.shellcmdflag = "-ic"
vim.opt.shortmess:append("F")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

vim.o.statusline = "%{mode()} %l:%c"

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local file = event.match
		local dir = vim.fn.fnamemodify(file, ":p:h") -- Get the absolute path of the directory
		if not vim.loop.fs_stat(dir) then
			vim.fn.mkdir(dir, "p") -- Create the directory recursively
		end
	end,
	pattern = "*",
})

-- vim.opt.guicursor = "n-v-c:hor20,i:ver20,r-cr:hor15,sm:hor10"

-- Maximize window size
vim.g.lazygit_floating_window_scaling_factor = 0.95 -- Use 95% of screen (default is 0.9)
-- Remove transparency for cleaner look
vim.g.lazygit_floating_window_winblend = 0 -- 0 = fully opaque (default)
-- Minimize decorative borders
vim.g.lazygit_floating_window_border_chars = { " ", " ", " ", " ", " ", " ", " ", " " } -- Invisible borders
-- Or use simple line borders instead of fancy unicode:
-- vim.g.lazygit_floating_window_border_chars = {'-','-','-','|','-','-','-','|'}
vim.g.lazygit_use_neovim_remote = 1 -- Better editor integration
vim.g.lazygit_floating_window_use_plenary = 1 -- Better window management
