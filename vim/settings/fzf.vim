" source fzf plugin
set rtp +=~/.fzf

let g:fzf_tmux_height='33%'
" let g:fzf_prefer_tmux = 1
" Currently this breaks neovim

" Select colorscheme
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

function! s:ag_to_qf(line)
  let parts = split(a:lines, ':')
  return {
    \ 'filename': parts[0],
    \ 'lnum': parts[1],
    \ 'col': parts[2],
    \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')
  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

if executable('ag')
  command! -nargs=* Ag call fzf#run({
  \ 'source':  printf('ag --nogroup --column --color "%s" --word-regexp',
  \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
  \ 'sink*':    function('<sid>ag_handler'),
  \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
  \            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
  \            '--color hl:68,hl+:110',
  \ 'down':    g:fzf_tmux_height
  \ })

  " Actually maps to <C-/>, however Vim can only map printable characters.
  " This is a horrible hack and probably only works in specific terminal
  " environments.
  " nnoremap <silent> <C-_>:Ag<CR>
endif
