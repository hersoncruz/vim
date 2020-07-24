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
let g:netrw_banner=0		" disable anoying banner
let g:netrw_browser_split=4	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" SNIPPETS:
" Read an empty HTML template and move cursos to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,vd :-1read $HOME/.vim/.php.var_dump<CR>1jwfa
