-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = '\\'
vim.g.maplocalleader = ' '


local options = vim.opt

-- line
options.relativenumber = true
options.number = true
-- keep 5 lines when scoll down/up
options.scrolloff = 5

-- indent
-- 1 tab = 4 spaces
options.tabstop = 4
-- Set <<  and >> shift width 4
options.shiftwidth = 4
options.softtabstop = 0
options.expandtab = true
-- Be smart when using tabs
options.smarttab = true
options.autoindent = true

-- search
-- Highlight search results
options.hlsearch = true
--  real time search result shown
options.incsearch = true
-- Ignore case when searching
options.ignorecase = true
-- When searching try to be samrt about cases
options.smartcase = true
-- Show matching brackets when text indicator is over them
options.showmatch = true

-- cursor
options.cursorline = true
-- enable mouse
options.mouse = 'a'

-- ui
options.termguicolors = true
options.signcolumn = "yes"

-- --------------------
-- vim涉及字符显示的选项有三个，fileencoding文件字符编码，encoding缓冲区字符编码，termencoding终端字符编码。
--
-- 　　vim显示字符的顺序:（探测文件编码，从fileencodings里面选择最合适的编码赋值给fileencoding）按fileencoding编码读取文件->将读取到的内容转成encoding编码->将encoding编码转换成termencoding打印到终端->终端(我们平时主要使用的是securecrt)按设置的编码(一般是utf8)显示字符。
-- --------------------
options.encoding = 'utf-8'
options.fileencodings = 'utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936'
options.fileencoding = 'utf-8'

-- fileformat
options.ff = 'unix'
-- fileformats
options.ffs = 'unix,dos,mac'

-- clipboard
vim.opt.clipboard = ""
