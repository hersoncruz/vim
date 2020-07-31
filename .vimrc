" Configuration file for vim
set modelines=0         " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" My vim
set background=dark
set number
syntax on
filetype plugin on

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching diles whrn we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
command! MakeTags !ctags -R .

" Tweaks for browsing
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browser-maps| for more mappings
let g:netrw_banner=0      " disable anoying banner
let g:netrw_browser_split=4   " 1:hsplit, 2:vsplit, 3:ntab, 4:pwindow
let g:netrw_altv=1        " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_winsize=25

" Open navigation tree every time
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" SNIPPETS:
" Read an empty HTML template and move cursos to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,vd :-1read $HOME/.vim/.php.var_dump<CR>1jwfa

" Make column 81 background different color.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v',100)

" Highlight matched when jumping to next
nnoremap <silent> n    n:call HLNext(0.4)<CR>
nnoremap <silent> N    N:call HLNext(0.4)<CR>

function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

" Show trail spaces and tabs
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Tab width
set tabstop=2
set shiftwidth=2
set expandtab

" Custom TODO bullets
let g:VimTodoListsUndoneItem = '[ ]'
let g:VimTodoListsDoneItem = '[x]'
let g:VimTodoListsDatesEnabled = 1

" Plug auto install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'elmcast/elm-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'aserebryakov/vim-todo-lists'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
