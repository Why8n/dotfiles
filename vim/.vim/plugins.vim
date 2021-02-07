
call dein#add('unblevable/quick-scope', {
            \'on_map': {'n' : ['f','F','t','T']}
            \})

call dein#add('tpope/vim-repeat', {'on_map' : '.'})
call dein#add('tpope/vim-surround',{
        \'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 
        \'depends' : 'vim-repeat'
        \})

call dein#add('Why8n/enhanceOPM', {
            \'on_event': 'VimEnter',
            \})
" call dein#add('/mnt/e/code/vim/enhanceOPM')

if exists('g:vscode')
    let vscodePath = '~/.vim/vscode'
    execute printf('source %s/settings.vim', vscodePath)
    execute printf('source %s/mappings.vim', vscodePath)
    execute printf('source %s/plugins.vim', vscodePath)
else

    call dein#add('vim-airline/vim-airline', {
                \'on_event': 'VimEnter',
                \})

    call dein#add('vim-airline/vim-airline-themes', {
                \'on_event': 'VimEnter',
                \})

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

    call dein#add('vim-syntastic/syntastic', {
                \'on_cmd':'SyntasticToggleMode'
                \})

    call dein#add('scrooloose/nerdcommenter', {
                \'lzay': 1,
                \'on_map': [ 
                    \'<Plug>NERDCommenterToggle',
                    \'<Leader>cc',
                    \'<Leader>cu',
                    \'<Leader>c<Space>']
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
    call dein#add('morhetz/gruvbox', {'merge': 0})

    call dein#add('schickling/vim-bufonly', {
                \'on_cmd': ['Bufonly','Bonly','BOnly']
                \})


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
    " showing marks on left side, plus handle marks
    call dein#add('kshenoy/vim-signature', {
                \'on_event': 'VimEnter',
                \})
    call dein#add('vim-scripts/Marks-Browser',{
                \'on_cmd': 'MarksBrowser'
                \})

    call dein#add('junegunn/fzf', { 'build': './install --all'  })
    call dein#add('junegunn/fzf.vim')

    call dein#add('majutsushi/tagbar', { 'on_cmd': 'TagbarOpenAutoClose' })
    call dein#add('mbbill/undotree', {
                \'on_cmd': 'UndotreeToggle'
                \})
    call dein#add('itchyny/vim-cursorword',{
                \'on_event': 'VimEnter'
                \})

    " ----------------
    " === language ===
    " ----------------
    " completion
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release', 'trusted': 1})
    call dein#add('chemzqm/vim-run', {'on_cmd': 'Run'})

    " frontend
    " HTML, CSS, JavaScript, PHP, JSON, etc.
    " Plug 'elzr/vim-json'
    call dein#add('hail2u/vim-css3-syntax', {
                 \ 'on_ft': ['css']
                \})
    " color preview
    " call dein#add('gko/vim-coloresque')
    " Plug 'pangloss/vim-javascript', { 'on_ft' :['javascript', 'vim-plug'] }
    call dein#add('mattn/emmet-vim', {
                \ 'if': v:version >= 700,
                \ 'on_ft': ['html', 'htmljinja', 'xml', 'xsl'],
                \})
    call dein#add('posva/vim-vue')

    " Python
    call dein#add('vim-scripts/indentpython.vim', {
                \'on_ft': ['python']
                \})

    " Android
    call dein#add('udalov/kotlin-vim', {
                \'on_ft': ['kotlin']
                \})

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
    call dein#add('airblade/vim-rooter', {
                \'on_event': 'VimEnter',
                \})
    call dein#add('honza/vim-snippets', {
                \'on_event': 'VimEnter',
                \})
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
    call dein#add('airblade/vim-gitgutter', {
                \'on_event': 'VimEnter',
                \})

    " call dein#add('/mnt/e/code/vim/autopaste', {
    call dein#add('Why8n/autopaste', {
                \'on_cmd': [
                    \'PasteInNormalMode',
                    \'PasteInInsertMode',
                    \'PasteInVisualMode'
                    \]
                \})

    call dein#add('frazrepo/vim-rainbow', {
                \'on_ft': ['c',
                          \'c++',
                          \'java',
                          \'kotlin',
                          \'groovy',
                          \'dark',
                          \'python',
                          \'html',
                          \'scss',
                          \'javascript',
                          \'typescript',
                          \'vim',
                            \]
                \})
endif
