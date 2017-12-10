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

autocmd FileType   python set ts=4 sw=4 et | let b:effective_modeline=( '# vim' . ':ts=' . &ts . ':sw=' . &sw . ':et' . ':' )
autocmd FileType        c set ts=4 sw=4 et | let b:effective_modeline=('// vim' . ':ts=' . &ts . ':sw=' . &sw . ':et' . ':' )
autocmd FileType      yml set ts=2 sw=2 et | let b:effective_modeline=( '# vim' . ':ts=' . &ts . ':sw=' . &sw . ':et' . ':' )
autocmd FileType       sh set ts=4 sw=4 et | let b:effective_modeline=( '# vim' . ':ts=' . &ts . ':sw=' . &sw . ':et' . ':' )
autocmd FileType markdown set ts=2 sw=2 et | let b:effective_modeline='[//]: # ( vim:set ts=' . &ts . ' sw=' . &sw . ' et: )'

command ML execute
    \ '$s@$@\r' . (exists('b:effective_modeline') ? b:effective_modeline : g:default_modeline) . '@|noh|write!|edit'
