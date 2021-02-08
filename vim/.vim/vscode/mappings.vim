" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap <expr> <Leader>gb VSCodeNotify('workbench.action.navigateBack')
nnoremap <expr> <Leader>gf VSCodeNotify('workbench.action.navigateForward')

nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" windows 
nnoremap <Leader>q :call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <Leader>w :call VSCodeNotify('workbench.action.files.save')<CR>
nnoremap <expr> <Leader>sl <SID>split('l', '__vscode_new__')
nnoremap <expr> <Leader>sh <SID>split('h', '__vscode_new__')
nnoremap <expr> <Leader>sj <SID>split('j', '__vscode_new__')
nnoremap <expr> <Leader>sk <SID>split('k', '__vscode_new__')
nnoremap <Leader><Leader>o :Only!<CR>

" format
nnoremap <Leader>fm :call VSCodeNotify('editor.action.format')<CR>
xnoremap <expr> <Leader>fm <SID>rangeExitSelection("editor.action.formatSelection")()

" comment
xnoremap <expr> <Leader>cc       <SID>rangeExitSelection('editor.action.addCommentLine')()
nnoremap <expr> <Leader>cc       <SID>rangeExitSelection('editor.action.addCommentLine')() . '_'
xnoremap <expr> <Leader>cu       <SID>rangeExitSelection('editor.action.removeCommentLine')()
nnoremap <expr> <Leader>cu       <SID>rangeExitSelection('editor.action.removeCommentLine')() . '_'
xnoremap <expr> <Leader>c<Space> <SID>rangeExitSelection('editor.action.commentLine')()
nnoremap <expr> <Leader>c<Space> <SID>rangeExitSelection('editor.action.commentLine')() . '_'

" vscode plugins
" ----------
" whichkey
" ----------
nnoremap <silent> \ :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> \ :<C-U>call <SID>range('whichkey.show')<CR>

function! s:range(cmd, ...) abort
    let selection = get(a:, 1, 0)
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        echom 'capitcal V'
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange(a:cmd, startLine, endLine, selection)
    else
        echom 'small V'
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos(a:cmd, startPos[1], endPos[1], startPos[2], endPos[2], selection)
    endif
endfunction

function s:rangeExitSelection(cmd)
    function! s:vscodeRange(...) abort closure
      if !a:0
            let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
            return 'g@'
        elseif a:0 > 1
            let [line1, line2] = [a:1, a:2]
        else
            let [line1, line2] = [line("'["), line("']")]
        endif

        call VSCodeCallRange(a:cmd, line1, line2, 0)
    endfunction

    return function('s:vscodeRange')
endfunction

function! s:split(...) abort
    let direction = 'workbench.action.splitEditorRight'
    let file = a:2

    if a:1 ==? 'h'
        let direction = 'workbench.action.splitEditorLeft'
    elseif a:1 ==? 'l'
        let direction = 'workbench.action.splitEditorRight'
    elseif a:1 ==? 'j'
        let direction = 'workbench.action.splitEditorDown'
    elseif a:1 ==? 'k'
        let direction = 'workbench.action.splitEditorUp'
    endif

    call VSCodeCall(direction)
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction
