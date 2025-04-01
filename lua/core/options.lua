-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

-- line numbers 
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2 
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.cursorline = true

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

