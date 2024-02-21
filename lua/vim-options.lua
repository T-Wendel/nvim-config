--local nnoremap = require("user.keymap_utils").nnoremap

--local harpoon_ui = require("harpoon.ui")
--local harpoon_mark = require("harpoon.mark")

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 8
vim.g.mapleader = " "

--Makes it possible to use yanked content outside vim
vim.opt.clipboard = "unnamed,unnamedplus"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.mouse = "a"
vim.opt.cursorline = true
--vim.keymap.set('n', 'C-k', ':wincmd k<CR>')
--vim.keymap.set('n', 'C-j', ':wincmd j<CR>')
--vim.keymap.set('n', 'C-h', ':wincmd h<CR>')
vim.keymap.set("n", "<leader>q", ":wq<CR>")

--Switch panes
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Ctrl+d: Half-page down then center
keymap("n", "<C-d>", "<C-d>zz", opts)
-- Ctrl+u: Half-page up then center
keymap("n", "<C-u>", "<C-u>zz", opts)
-- Ctrl+f: Page down then center
keymap("n", "<C-f>", "<C-f>zz", opts)
-- Ctrl+b: Page up then center
keymap("n", "<C-b>", "<C-b>zz", opts)
-- gg: Start of the file then center
keymap("n", "gg", "ggzz", opts)
-- G: End of the file then center
keymap("n", "G", "Gzz", opts)
-- Bonus: If you fancy jumping around with search results, n and N for next and previous
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Press 'S' for quick find/replace for the word under the cursor
function _G.CustomSearchReplace()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end
-- Bind the function to the 'S' key in normal mode
vim.api.nvim_set_keymap("n", "S", ":lua _G.CustomSearchReplace()<CR>", { noremap = true, silent = true })

--vim.api.nvim_set_keymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })

--local function testfunc()
--	require("telescope.builtin").oldfiles()
--end
--
--vim.api.nvim_set_keymap("n", "<leader>?", testfunc(), { noremap = true})

--vim.api.nvim_set_keymap("n", "<leader>?", function() require("telescope.builtin").oldfiles() end, {desc = "[?] Find recently opened files" , noremap = true })
--
-- Harpoon keybinds --
-- Open harpoon ui
--vim.api.nvim_set_keymap('n', '<leader>ho', "harpoon.ui.toggle_quick_menu()<CR>", { noremap = true, silent = true })
--nnoremap("<leader>ho", function()
--	harpoon_ui.toggle_quick_menu()
--end)
--
---- Add current file to harpoon
--nnoremap("<leader>ha", function()
--	harpoon_mark.add_file()
--end)
--
---- Remove current file from harpoon
--nnoremap("<leader>hr", function()
--	harpoon_mark.rm_file()
--end)
--
---- Remove all files from harpoon
--nnoremap("<leader>hc", function()
--	harpoon_mark.clear_all()
--end)
--
---- Quickly jump to harpooned files
--nnoremap("<leader>1", function()
--	harpoon_ui.nav_file(1)
--end)
--
--nnoremap("<leader>2", function()
--	harpoon_ui.nav_file(2)
--end)
--
--nnoremap("<leader>3", function()
--	harpoon_ui.nav_file(3)
--end)
--
--nnoremap("<leader>4", function()
--	harpoon_ui.nav_file(4)
--end)
--
--nnoremap("<leader>5", function()
--	harpoon_ui.nav_file(5)
--end)
--
--
