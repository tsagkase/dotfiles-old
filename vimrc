" if $COLORTERM == 'gnome-terminal'
  set t_Co=256
" endif

syntax enable
color  base16-tomorrow-night

" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

" Sedit: scratch edit with args command
function! ScratchEdit(cmd, options)
	exe a:cmd tempname()
	setl buftype=nofile bufhidden=wipe nobuflisted
	if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! -bar -nargs=* Sedit call ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Ssplit call ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsplit call ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stabedit call ScratchEdit('tabe', <q-args>)

" find files recursively under vim's CWD
set path+=**

filetype plugin on

" ensure that :make runs after the buffers are flashed
set autowrite

" Today, Yesterday commands
command! Today r!date +"\%Y/\%m/\%d"
command! Yesterday r!date --date="yesterday" +"\%Y/\%m/\%d"
command! Tomorrow r!date --date="tomorrow" +"\%Y/\%m/\%d"
