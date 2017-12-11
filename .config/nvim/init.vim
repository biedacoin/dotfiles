syntax on
colorscheme molokai

set backspace=2
set modeline
set number
set nobackup
set nowritebackup
set noundofile

filetype indent off

set noautoindent
set nosmartindent
set nocindent
set nowrap

let g:default_modeline='# vim:ts=4:sw=4:et:'

fu! s:MakeModeline(...)
    let _ts = 'ts=' . &ts
    let _sw = 'sw=' . &sw
    let _et = 'et'
    let _syn = 'syn=' . &syn
    if a:0 == 0
        let b:effective_modeline = g:default_modeline
    else
        if a:0 > 1
            let b:effective_modeline = a:1 . ' vim:set ' . join([_ts,_sw,_et,_syn], ' ') . ': ' . a:2
        else
            let b:effective_modeline = a:1 . ' vim:' . join([_ts,_sw,_et,_syn], ':') . ':'
        endif
    endif
endfu

autocmd BufNewFile,BufRead *.nix set ts=2 sw=2 et syn=nix | call s:MakeModeline('#')

autocmd FileType   python set ts=4 sw=4 et | call s:MakeModeline('#')
autocmd FileType        c set ts=4 sw=4 et | call s:MakeModeline('//')
autocmd FileType      yml set ts=2 sw=2 et | call s:MakeModeline('#')
autocmd FileType       sh set ts=4 sw=4 et | call s:MakeModeline('#')
autocmd FileType markdown set ts=2 sw=2 et | call s:MakeModeline('[//]: # (', ')')

command ML execute
    \ '$s@$@\r' . (exists('b:effective_modeline') ? b:effective_modeline : g:default_modeline) . '@|noh|write!|edit'

" vim:ts=4:sw=4:et:
