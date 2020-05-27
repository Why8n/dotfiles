function! s:installVimPlugins()
	" Plug 'dyng/ctrlsf.vim'
	" way too slow on huge files
	" Plug 'ctrlpvim/ctrlp.vim', {'on':'CtrlP'} 
	" Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggld','NERDTreeCWD'] }
    " Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':['NERDTreeToggle','NERDTreeCWD'] }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'easymotion/vim-easymotion'
    Plug 'unblevable/quick-scope'
	Plug 'vim-syntastic/syntastic'
	Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdcommenter'
	" Plug 'Raimondi/delimitMate'
	Plug 'jiangmiao/auto-pairs'
	Plug 'terryma/vim-multiple-cursors'
	" 缩进指示线
	Plug 'Yggdroot/indentLine'

	" Hyperfocus-writing in Vim
	Plug 'junegunn/limelight.vim'
	" distraction free writing mode
	Plug 'junegunn/goyo.vim' 
	" 文本对齐插件
	Plug 'godlygeek/tabular'

	" Find And Replace Vim plugin
	Plug 'brooth/far.vim'

	" --------------------------
	" === scheme for console ===
	" --------------------------
	" Plug 'jnurmine/Zenburn'
	" Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'morhetz/gruvbox'
    Plug 'schickling/vim-bufonly'

	" --------------------------
	"=== switch input method ===
	" --------------------------
	" Plug 'https://github.com/vim-scripts/fcitx.vim.git'
    " Plug 'ybian/smartim'

	" ----------------
	" === markdown ===
	" ----------------
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() },'for':['markdown','vim-plug']}
	" markdown table improvment
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
	" Plug 'reedes/vim-pencil'

	" -----------------
	" === Bookmarks ===
	" -----------------
	Plug 'kshenoy/vim-signature'
	Plug 'vim-scripts/Marks-Browser'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'
    
	Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
	Plug 'mbbill/undotree'
	Plug 'tpope/vim-repeat'
	Plug 'itchyny/vim-cursorword'

    " ----------------
    " === language ===
    " ----------------
    " completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'chemzqm/vim-run', {'on': 'Run'}
	"Plug 'Valloric/YouCompleteMe'
	" autocomlete by AI
	" Plug 'zxqfl/tabnine-vim', { 'for': ['go','java', 'php', 'html', 'javascript', 'css', 'less','scss','cpp','c','javascript','kotlin','python','dart'] }
	" Plug 'davidhalter/jedi-vim'
    
    " frontend
	" HTML, CSS, JavaScript, PHP, JSON, etc.
	" Plug 'elzr/vim-json'
	Plug 'hail2u/vim-css3-syntax', {'on': 'SyntasticToggleMode'}
    " color preview
	Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	" Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
	Plug 'mattn/emmet-vim'
	Plug 'posva/vim-vue'

	" Python
	Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }

    " Android
	Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }

    " http
    Plug 'nicwest/vim-http', {'on': ['Http','Http!']}

    " format
    Plug 'prettier/vim-prettier', {
    \ 'do': 'npm install',
    \ 'branch': 'release/1.x',
    \ 'for': [
      \ 'javascript',
      \ 'typescript',
      \ 'css',
      \ 'less',
      \ 'scss',
      \ 'json',
      \ 'graphql',
      \ 'markdown',
      \ 'vue',
      \ 'lua',
      \ 'php',
      \ 'python',
      \ 'ruby',
      \ 'html',
      \ 'swift' ] }

    Plug 'liuchengxu/vim-which-key'
    Plug 'voldikss/vim-floaterm'
    Plug 'airblade/vim-rooter'
    Plug 'honza/vim-snippets'
    " provides additional text objects(di(,ca}...)
    Plug 'wellle/targets.vim'
    " show definiations & references
    Plug 'pechorin/any-jump.vim' ,{'on':['AnyJump','AnyJumpVisual','AnyJumpBack','AnyJumpLastResults']}
endfunction

function! s:installNvimPlugins()
    source ~/.vim/neovim/plugins.vim
endfunction

function! InstallVimAndConfig()
    call plug#begin('~/.vim/plugged')
        call s:installVimPlugins()
    call plug#end()

    source ~/.vim/plugins_configuration.vim
endfunction

function! InstallNvimAndConfig()
    call plug#begin('~/.vim/plugged')
        call s:installVimPlugins()
        call s:installNvimPlugins()
    call plug#end()

    source ~/.vim/plugins_configuration.vim
    source ~/.vim/neovim/plugins_configuration.vim
endfunction
