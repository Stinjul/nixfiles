local opt = vim.opt
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
if vim.version().minor >= 10 or vim.version().major > 0 then
    opt.foldtext = "v:lua.vim.treesitter.foldtext()"
end

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*"},
  command = "silent! loadview",
})
vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*"},
  command = "silent mkview",
})

vim.g.mapleader = ","

vim.keymap.set("n", "<leader>a", ":ArgWrap<CR>", { silent = true, noremap = true })
