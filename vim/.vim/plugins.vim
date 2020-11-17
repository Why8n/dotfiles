" Plug 'dyng/ctrlsf.vim'
" way too slow on huge files
" Plug 'ctrlpvim/ctrlp.vim', {'on':'CtrlP'} 
" Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggld','NERDTreeCWD'] }
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':['NERDTreeToggle','NERDTreeCWD'] }
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('easymotion/vim-easymotion', {
	\'lazy': 1,
    \'on_map': {
    \'n':['<Leader><Leader>w',
        \'<Leader><Leader>b',
        \'<Leader><Leader>s',
        \'<Leader><Leader>f',
        \'<Leader><Leader>F',
        \'<Leader><Leader>t',
        \'<Leader><Leader>T',
        \]}
	\})
call dein#add('unblevable/quick-scope')

call dein#add('vim-syntastic/syntastic', {
            \'on_cmd':'SyntasticToggleMode'
            \})

call dein#add('tpope/vim-repeat', {'on_map' : '.'})
call dein#add('tpope/vim-surround',{
        \'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 
        \'depends' : 'vim-repeat'
        \})

call dein#add('scrooloose/nerdcommenter', {
            \'lzay': 1,
            \'on_map': [ 
                \'<Plug>NERDCommenterToggle',
                \'<Leader>cc',
                \'<Leader>cu',
                \'<Leader>c<Space>']
            \})
" Plug 'Raimondi/delimitMate'
call dein#add('jiangmiao/auto-pairs', {
            \'lazy': 1,
            \'on_event': 'InsertEnter'
            \})
call dein#add('terryma/vim-multiple-cursors', { 
            \'on_map' : { 
                \'n' : ['<C-n>', '<C-p>'], 'x' : '<C-n>'}
            \}) 
" 缩进指示线
call dein#add('Yggdroot/indentLine',{
            \'on_event': 'VimEnter',
            \})

" Hyperfocus-writing in Vim
" on_source: load goyo.vim,then limelight.vim will be loaded automatically
" depens: load limelight,then goyo.vim will be loaded automatically
call dein#add('junegunn/limelight.vim', {
            \'on_cmd': 'Limelight',
            \'on_source': 'goyo.vim',
            \'depends': 'goyo.vim'
            \})
" distraction free writing mode
call dein#add('junegunn/goyo.vim', {
            \'on_cmd': 'Goyo'
            \})
" 文本对齐插件
call dein#add('godlygeek/tabular', {
            \ 'on_cmd':  'Tabularize',
            \ 'augroup': 'tabular'
            \})

" Find And Replace Vim plugin
call dein#add('brooth/far.vim', {
            \'on_cmd': ['Far','Fardo','Farf','Farp','Farr','Farundo']
            \})

" --------------------------
" === scheme for console ===
" --------------------------
" Plug 'jnurmine/Zenburn'
" Plug 'kristijanhusak/vim-hybrid-material'
call dein#add('morhetz/gruvbox')

call dein#add('schickling/vim-bufonly', {
            \'on_cmd': ['Bufonly','Bonly','BOnly']
            \})

" --------------------------
"=== switch input method ===
" --------------------------
" Plug 'https://github.com/vim-scripts/fcitx.vim.git'
" Plug 'ybian/smartim'

" ----------------
" === markdown ===
" ----------------
call dein#add('iamcco/markdown-preview.nvim', {
            \'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
            \'build': 'sh -c "cd app & yarn install"' })
" markdown table improvment
call dein#add('dhruvasagar/vim-table-mode', { 'on_cmd': 'TableModeToggle' })
" Plug 'reedes/vim-pencil'
call dein#add('skanehira/preview-markdown.vim', {
            \'on_ft': ['markdown','rmd'],
            \'on_cmd': 'PreviewMarkdown'
            \})

" -----------------
" === Bookmarks ===
" -----------------
call dein#add('kshenoy/vim-signature')
call dein#add('vim-scripts/Marks-Browser',{
            \'on_cmd': 'MarksBrowser'
            \})

call dein#add('junegunn/fzf', { 'build': './install --all'  })
call dein#add('junegunn/fzf.vim')

call dein#add('majutsushi/tagbar', { 'on_cmd': 'TagbarOpenAutoClose' })
call dein#add('mbbill/undotree', {
            \'on_cmd': 'UndotreeToggle'
            \})
" call dein#add('itchyny/vim-cursorword',{
            " \'on_event': 'VimEnter'
            " \})

" ----------------
" === language ===
" ----------------
" completion
call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release', 'trusted': 1})
call dein#add('chemzqm/vim-run', {'on_cmd': 'Run'})
"Plug 'Valloric/YouCompleteMe'
" autocomlete by AI
" Plug 'zxqfl/tabnine-vim', { 'on_ft': ['go','java', 'php', 'html', 'javascript', 'css', 'less','scss','cpp','c','javascript','kotlin','python','dart'] }
" Plug 'davidhalter/jedi-vim'

" frontend
" HTML, CSS, JavaScript, PHP, JSON, etc.
" Plug 'elzr/vim-json'
call dein#add('hail2u/vim-css3-syntax')
" color preview
call dein#add('gko/vim-coloresque')
" Plug 'pangloss/vim-javascript', { 'on_ft' :['javascript', 'vim-plug'] }
call dein#add('mattn/emmet-vim', {
            \ 'if': v:version >= 700,
            \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
            \})
call dein#add('posva/vim-vue')

" Python
call dein#add('vim-scripts/indentpython.vim')

" Android
call dein#add('udalov/kotlin-vim')

" http
call dein#add('nicwest/vim-http', {'on_cmd': ['Http','Http!']})

" format
call dein#add('prettier/vim-prettier', {
	    \ 'build': 'npm install',
	    \ 'rev': 'release/1.x',
        \'on_cmd': [ 
            \'Prettier',
            \'PrettierAsync',
            \'PrettierPartial'
            \'PrettierFragment',
            \'PrettierVersion',
            \'PrettierCli',
            \'PrettierCliPath',
            \'PrettierCliVersion'],
	    \ 'on_ft': [
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
            \ 'swift' ]
        \})
call dein#add('liuchengxu/vim-which-key', {
            \'on_cmd': [ 
                \'WhichKey',
                \'WhichKey!',
                \'WhichKeyVisual!',
                \'WhichKeyVisual']
            \})
call dein#add('voldikss/vim-floaterm',{
            \'lazy': 1,
            \'on_cmd': [ 
                \'FloatermNew',
                \'FloatermPrev',
                \'FloatermNext',
                \'FloatermToggle',
                \'FloatermUpdate',
                \'FloatermShow',
                \'FloatermHide',
                \'FloatermKill',
                \'FloatermSend']
            \})
call dein#add('airblade/vim-rooter')
call dein#add('honza/vim-snippets')
" call dein#add('wellle/targets.vim')
" show definiations & references
call dein#add('pechorin/any-jump.vim' ,{
            \'on_cmd':[ 
                \'AnyJump',
                \'AnyJumpVisual',
                \'AnyJumpBack',
                \'AnyJumpLastResults']
            \})

call dein#add('tpope/vim-scriptease', {
            \'on_cmd': [ 
                \'PP',
                \'Runtime',
                \'Disarm',
                \'Scriptnames',
                \'Messages',
                \'Verbose',
                \'Time',
                \'Breakadd',
                \'Vedit',
                \'K',
                \'zS',
                \'g=']
            \})

call dein#add('tpope/vim-dispatch', {
            \'on_cmd': [ 
                \'Make',
                \'Dispatch',
                \'Focus',
                \'Start']
            \})

" show git diff in the sign column
call dein#add('airblade/vim-gitgutter')

" set paste automatically when in insert mode
" call dein#add('roxma/vim-paste-easy', {
"             \'lazy': 1,
"             \'on_event': ['InsertCharPre','InsertLeave']
"             \})

" call dein#add('gcmt/wildfire.vim', {
"             \'on_map': {'n' : ['<Enter>']}
"             \})

call dein#add('/mnt/e/code/vim/autopaste')
call dein#add('Why8n/enhanceOPM')

