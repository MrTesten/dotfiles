" ================ You Complete Me ========================

" Defer YouCompleteMe load until insert mode is entered
augroup load_us_ycm
  autocmd!
  autocmd InsertEnter * call plug#load('vim-snippets', 'YouCompleteMe')
                     \| call youcompleteme#Enable()
                     \| autocmd! load_us_ycm
augroup END

" Configuration
" let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/settings/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifiers_for_completion = 3
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

function SetYcmCommands()
  nnoremap <silent> gw :YcmCompleter GoTo<CR>
  nnoremap <silent> tt :YcmCompleter GetType<CR>
  nnoremap <silent> gj :YcmCompleter GetDoc<CR>
  nnoremap <silent> <C-J> :YcmCompleter GetDoc<CR>
endfunction

augroup set_omnifunc
  autocmd!
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup END

augroup YcmCommandAutoGroup
  autocmd!
  autocmd Filetype cpp call SetYcmCommands()
augroup END

augroup YcmUpdateLightline
  autocmd!
  autocmd InsertLeave,InsertEnter,CursorHold,CursorHoldI,CursorMovedI,CursorMoved * call lightline#update()
augroup END
